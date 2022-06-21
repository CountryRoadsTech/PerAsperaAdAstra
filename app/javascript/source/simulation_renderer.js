import * as THREE from 'three'

document.addEventListener("turbo:load", function() {
  const canvas = document.querySelector('#simulation_renderer')
  const renderer = new THREE.WebGLRenderer({canvas})

  const scene = new THREE.Scene();
	const camera = new THREE.PerspectiveCamera( 75, 2, 0.1, 1000 );

	const geometry = new THREE.BoxGeometry( 1, 1, 1 );
	const material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
	const cube = new THREE.Mesh( geometry, material );
	scene.add( cube );

	camera.position.z = 5;

	function animate() {
		requestAnimationFrame( animate );

		cube.rotation.x += 0.01;
		cube.rotation.y += 0.01;

		renderer.render( scene, camera );
	};

	animate();
})
