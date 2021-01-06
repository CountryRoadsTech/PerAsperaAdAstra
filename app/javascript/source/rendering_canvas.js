// Import the 3d rendering canvas.
import * as THREE from 'three';

import * as LOADER from './load_models';

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

// Load the 3D scene on the canvas.
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );

window.addEventListener('turbo:load', function () {
    document.body.appendChild( renderer.domElement );
});

// Add a basic ambient light.
const ambient_light = new THREE.AmbientLight( 0x202020 );
scene.add( ambient_light );

// Add a point light to basically represent the sun.
const light = new THREE.PointLight( 0xffffff, 50 );
light.position.set( 1000, 0, 0 );
scene.add( light );

// Load in a 3D model of the Earth.
LOADER.load_model_into_scene(scene, "assets/Earth.glb")

camera.position.x = 625;
camera.lookAt( new THREE.Vector3(0, 0, 0) );

// Use 3D orbit controls to move the camera around.
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
const controls = new OrbitControls(camera, renderer.domElement);
controls.enablePan = false;
controls.update();

function animate() {
    requestAnimationFrame( animate );

    // Do animation stuff.

    renderer.render( scene, camera );
}

animate();
