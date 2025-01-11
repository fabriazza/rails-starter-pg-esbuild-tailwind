const defaultTheme = require('tailwindcss/defaultTheme')
module.exports = {
  content: [
    './app/**/*.{html,js,erb,haml,css}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './config/initializers/simple_form_tailwind.rb',
    './app/decorators/**/*.rb'
  ]
}
