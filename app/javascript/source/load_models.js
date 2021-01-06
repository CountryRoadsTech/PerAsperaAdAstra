import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';

export function load_model_into_scene(scene, model) {
    const loader = new GLTFLoader();
    loader.load(model, function (gltf ) {
        scene.add(gltf.scene);

    }, undefined, function (error) {
        console.error(error);
    });
}
