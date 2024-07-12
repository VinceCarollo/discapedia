const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim,rb}'
  ],
  theme: {
    extend: {
      colors: {
        'poly-green': '#004F2D',
        'sea-green': '#0A8754',
        'air-force-blue': '#508CA4',
        'cadet-gray': '#91AEC1',
        'columbia-blue': '#BFD7EA'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        fly: ['"Fly"', "sans-serif"],
      },
    },
  },
}
