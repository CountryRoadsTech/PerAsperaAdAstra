# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
pin 'three', to: 'https://ga.jspm.io/npm:three@0.141.0/build/three.module.js'
pin 'OrbitControls', to: 'https://ga.jspm.io/npm:three@0.141.0/examples/jsm/controls/OrbitControls.js' # Edit URL: https://generator.jspm.io/#U2VhYGBmD80rySzJSU1hKMkoSk11MNAzNDHQM0Dl6adWJOYW5KQW62cV5+on5+eVFOXnFOv7FyVlljhDeXpZxfg05eQnpqQWFeu7RgT5gJlA9QCQ4WFsgQA
pin 'GLTFLoader', to: 'https://ga.jspm.io/npm:three@0.141.0/examples/jsm/loaders/GLTFLoader.js'
pin 'EXRLoader', to: 'https://ga.jspm.io/npm:three@0.141.0/examples/jsm/loaders/EXRLoader.js'
