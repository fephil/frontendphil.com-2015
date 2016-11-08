import 'feature.js'
const Svg4everybody = require('svg4everybody')

// Cuts the mustard check to add js class
if ('querySelector' in document && 'addEventListener' in window) {
  var html = document.querySelector('html')
  html.classList.remove('no-js')
  html.classList.add('js')

  // Check if we need fastclick
  if ('touchAction' in document.body.style) {
    document.body.style.touchAction = 'manipulation'
  } else {
    require.ensure(['fastclick'], (require) => {
      const FastClick = require('fastclick')

      window.addEventListener('load', () => {
        FastClick.attach(document.body)
      })
    }, 'fastclick')
  }

  // Check if we need picturefill
  if (feature.pictureElement) {
  } else {
    require.ensure(['picturefill'], (require) => {
      const picturefill = require('picturefill')

      picturefill();
    }, 'picturefill')
  }

  // SVG support
  Svg4everybody()
}
