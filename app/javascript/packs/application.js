// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"

// Include the website's CSS and SCSS stylesheets.
import "../stylesheets/application.scss"

import "@hotwired/turbo-rails"

// The HTML canvas element and associated three.js 3D rendering elements to create a basic, skeleton scene.
import '../source/rendering_canvas'

// Load in to the scene the 3D models of Earth and the Moon.
import '../source/load_models'
