CI.run do
  step "Setup", "bin/setup --skip-server"
  step "Style: Ruby", "bin/rubocop"
  step "Security: Gem audit", "bin/bundler-audit check --update"
  step "Security: pnpm audit", "pnpm audit --audit-level high"
  step "Security: Brakeman", "bin/brakeman --quiet --no-pager --exit-on-warn --exit-on-error"
  step "Tests: Rails", "bin/rails test"
  step "Tests: Zeitwerk", "bin/rails zeitwerk:check"
  step "Assets", "env SECRET_KEY_BASE_DUMMY=1 RAILS_ENV=production bin/rails assets:precompile"
end
