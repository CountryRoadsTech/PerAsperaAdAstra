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

// Import the 3d rendering canvas.
import * as THREE from 'three';

// Check if WebGL is available on the local device.
const {WEBGL} = require("three/examples/jsm/WebGL");
// If it is available, then load the render.
if (WEBGL.isWebGLAvailable()) {
    // animate();
// If it is not available, then load a simple warning message that 'WebGL is not available on this device'.
} else {
    const warning = WEBGL.getWebGLErrorMessage();
    // Wait for the turbo frame to finish loading
    window.addEventListener('turbo:load', function () {
        document.getElementById('canvas_container').appendChild(warning);
    });
}

// Load the 3d scene on the canvas.
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );

window.addEventListener('turbo:load', function () {
    document.body.appendChild( renderer.domElement );
});

// Add a cube.
const geometry = new THREE.BoxGeometry();
const material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
const cube = new THREE.Mesh( geometry, material );
scene.add( cube );

camera.position.z = 5;

// Use 3D orbit controls to move the camera around.
//import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
//const controls = new OrbitControls();

function animate() {
    requestAnimationFrame( animate );

    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;

    renderer.render( scene, camera );
}

animate();