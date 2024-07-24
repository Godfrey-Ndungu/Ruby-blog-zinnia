const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors:{
        'ruby-primary': '#e0115f',
        'ruby-secondary-dark': '#9b111e',
        'ruby-secondary-light': '#ff2b2b',
        'ruby-accent-1': '#c71585',
        'ruby-accent-2': '#ff1493',
        'ruby-accent-3': '#ff69b4',
        'ruby-background-primary': '#e0115f',
        'ruby-background-secondary-dark': '#9b111e',
        'ruby-background-secondary-light': '#ff2b2b',
        'ruby-background-accent-1': '#c71585',
        'ruby-background-accent-2': '#ff1493',
        'ruby-background-accent-3': '#ff69b4',
        'ruby-border-primary': '#e0115f',
        'ruby-border-secondary-dark': '#9b111e',
        'ruby-border-secondary-light': '#ff2b2b',
        'ruby-border-accent-1': '#c71585',
        'ruby-border-accent-2': '#ff1493',
        'ruby-border-accent-3': '#ff69b4'

      },
    },
    
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
