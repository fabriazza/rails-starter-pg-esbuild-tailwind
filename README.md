# README
<a name="readme-top"></a>
## About The Project

Ruby on Rails project starter with PostgreSQL esbuild TailwindCSS


### Built With

* [![Ruby][Ruby.org]][Ruby-url]
* [![Rails][RubyOnRails.org]][Rails-url]
* [![PostgreSQL][PostgreSQL.org]][PostgreSQL-url]
* [![TailwindCSS][TailwindCSS.com]][TailwindCSS-url]
* [![esbuild][esbuild.io]][esbuild-url]

* Ruby version
3.1.2

* Rails version
7.0.3

* System dependencies
Ruby 3+
PostgreSQL 13+
Graphviz (via Brew)

* Configuration
No initial setup needed

* Database creation
```sh
  rake db:create
  rake db:migrate
  ```

* Database initialization
No initial setup needed

* How to run the test suite
```sh
  guard -P rspec
  ```

* Services (job queues, cache servers, search engines, etc.)
[https://github.com/bensheldon/good_job](https://github.com/bensheldon/good_job)


### Installation

1. Clone the repo
   ```sh
   git clone git@github.com:fabriazza/rails-starter-pg-esbuild-tailwind.git
   ```
3. Install Gems
   ```sh
   bundle install
   ```
3. Install Node dependencies
   ```sh
   pnpm install
   ```
3. Create and migrate database
   ```sh
   rake db:create
   rake db:migrate
   ```
3. Start server
   ```sh
   overmind start
   ```


## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Contact

Fabrizio Azzarri - [@fabriphix](https://twitter.com/fabriphix) - hello@fabrizioazzarri.it

Project Link: [https://github.com/fabriazza/rails-starter-pg-esbuild-tailwind](https://github.com/fabriazza/rails-starter-pg-esbuild-tailwind)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Ruby]: https://img.shields.io/badge/Ruby-%23CC0000.svg?style=for-the-badge&logo=Ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/
[Rails]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[PostgreSQL]: https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/
[TailwindCSS]: https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white
[TailwindCSS-url]: https://tailwindcss.com/
[esbuild]: https://img.shields.io/static/v1?style=for-the-badge&message=esbuild&color=222222&logo=esbuild&logoColor=FFCF00&label=
[esbuild-url]: https://esbuild.github.io/