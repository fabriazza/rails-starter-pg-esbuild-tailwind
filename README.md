# Rails Starter: PostgreSQL, esbuild, and Tailwind CSS

Modern Rails starter with PostgreSQL, Hotwire, esbuild, Tailwind CSS, Devise, Trestle, and database-backed Rails infrastructure.

## Stack

- Ruby 4.0.6
- Rails `~> 8.1.3` (currently 8.1.3.1)
- PostgreSQL 14+
- Node.js 24.14.0 and pnpm 12.4.1
- Propshaft, esbuild, Tailwind CSS 4
- Turbo and Stimulus
- Devise and Simple Form with Tailwind wrappers
- Trestle admin
- Solid Queue, Solid Cache, and Solid Cable
- Minitest, RuboCop, Brakeman, and Bundler Audit
- Docker, Thruster, and Kamal

Redis is not required. Development uses in-process cache and Action Cable adapters; production uses dedicated PostgreSQL databases for cache, queue, and cable.

## Requirements

Install Ruby, Node.js, pnpm, PostgreSQL, and libvips (`brew install vips` on macOS). [mise](https://mise.jdx.dev/) installs Ruby and Node.js versions from `.tool-versions`; Corepack uses `packageManager` from `package.json` for pnpm:

```sh
mise install
corepack enable
corepack prepare pnpm@12.4.1 --activate
```

Install Overmind or Foreman to run `Procfile.dev`.

## Setup

```sh
git clone git@github.com:fabriazza/rails-starter-pg-esbuild-tailwind.git
cd rails-starter-pg-esbuild-tailwind
cp .env.example .env
bin/setup
```

`bin/setup` installs Ruby and JavaScript dependencies, prepares database, builds assets, and starts development processes. Skip server startup when needed:

```sh
bin/setup --skip-server
```

Reset local database explicitly:

```sh
bin/setup --reset --skip-server
```

## Development

```sh
bin/dev
```

Processes:

- Rails web server on port 3000
- esbuild watcher
- Tailwind CSS watcher

Health endpoint: `GET /up`.

## Databases and Solid services

Development and test use primary PostgreSQL databases. Production defines four PostgreSQL databases:

- `rails_starter_production`
- `rails_starter_production_cache`
- `rails_starter_production_queue`
- `rails_starter_production_cable`

Override connections with Rails database URL variables such as `DATABASE_URL`, `CACHE_DATABASE_URL`, `QUEUE_DATABASE_URL`, and `CABLE_DATABASE_URL`, or use `POSTGRES_HOST`, `POSTGRES_USER`, and `POSTGRES_PASSWORD`.

Prepare all configured databases:

```sh
RAILS_ENV=production bin/rails db:prepare
```

For one-server deployments, set `SOLID_QUEUE_IN_PUMA=true`. For dedicated workers, leave it false and run:

```sh
bin/jobs
```

Validate worker and recurring-job configuration:

```sh
bin/jobs check
```

Queue behavior lives in `config/queue.yml`; recurring tasks live in `config/recurring.yml`.

## Tests and quality checks

```sh
bin/rails test
bin/rails test:system
bin/rails zeitwerk:check
bin/rubocop
bin/brakeman --no-pager
bin/bundler-audit check --update
pnpm audit --audit-level high
```

Run local CI sequence:

```sh
bin/ci
```

GitHub Actions runs dependency installation, asset builds, Minitest, Zeitwerk, RuboCop, Brakeman, Bundler Audit, and pnpm audit. Dependabot tracks Bundler, npm/pnpm, GitHub Actions, and Docker dependencies.

## Assets

```sh
pnpm run build
pnpm run build:css
```

Production compilation:

```sh
SECRET_KEY_BASE_DUMMY=1 RAILS_ENV=production bin/rails assets:precompile
```

## Production configuration

Copy values from `.env.example` into deployment secrets. Key settings:

- `RAILS_MASTER_KEY`
- `APP_HOST` and `APP_PROTOCOL`
- `POSTGRES_HOST`, `POSTGRES_USER`, and `POSTGRES_PASSWORD`
- `SMTP_ADDRESS`, `SMTP_PORT`, `SMTP_DOMAIN`, `SMTP_USERNAME`, and `SMTP_PASSWORD`
- `SOLID_QUEUE_IN_PUMA` and `JOB_CONCURRENCY`

Local Active Storage is default. To use S3, add `aws-sdk-s3`, enable `amazon` in `config/storage.yml`, and set `ACTIVE_STORAGE_SERVICE=amazon` plus AWS variables.

## Docker

Dockerfile builds Ruby gems and pnpm assets in a multi-stage image, then runs Rails through Thruster:

```sh
docker build -t rails-starter .
docker run --rm -p 80:80 \
  -e RAILS_MASTER_KEY \
  -e DATABASE_URL \
  rails-starter
```

Container entrypoint runs `db:prepare` before Rails server startup.

## Kamal

`config/deploy.yml` is provider-neutral example. Before deploying:

1. Replace image, registry, server, proxy host, and PostgreSQL host placeholders.
2. Export secrets referenced by `.kamal/secrets`.
3. Provision primary, cache, queue, and cable PostgreSQL databases.
4. Choose Solid Queue inside Puma or dedicated `job` role.

```sh
bin/kamal setup
bin/kamal deploy
```

Never commit raw secrets or local `.env` files.
