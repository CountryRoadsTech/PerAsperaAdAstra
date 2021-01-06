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
