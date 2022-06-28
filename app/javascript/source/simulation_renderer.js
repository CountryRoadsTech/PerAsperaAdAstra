import * as THREE from 'three'
import { OrbitControls } from 'OrbitControls'
import {GLTFLoader} from 'GLTFLoader'

document.addEventListener("turbo:load", function() {
  // Get the HTML Canvas used as the target for the renderer
  const canvas = document.querySelector('#simulation_renderer')
  const renderer = new THREE.WebGLRenderer({canvas, logarithmicDepthBuffer: true})

  // Add a perspective camera
  const fov = 75
  const aspect_ratio = 2
  const near_render_distance = 0.1
  const far_render_distance = 1000000000
  const camera = new THREE.PerspectiveCamera(fov, aspect_ratio, near_render_distance, far_render_distance)
  camera.position.z = 5

  // Add orbit style controls
  const controls = new OrbitControls(camera, canvas)
  controls.target.set(0, 0, 0)
  controls.update()

  // Create the main scene
  const scene = new THREE.Scene()

  // Add ambient lighting
  const lightColor = 0xFFFFFF
  const lightIntensity = 1
  const ambientLight = new THREE.AmbientLight(lightColor, lightIntensity)
  scene.add(ambientLight)

  // Add the world axes
  const worldAxes = new THREE.AxesHelper(far_render_distance - 1)
  scene.add(worldAxes)

  // Add the grid planes
  const gridSize = 10
  const numberOfGridDivisions = 10

  const xyGrid = new THREE.GridHelper(gridSize, numberOfGridDivisions, 0xFFFF00, 0xFFFF00)
  xyGrid.rotateX(Math.PI / 2)
  scene.add(xyGrid)

  const xzGrid = new THREE.GridHelper(gridSize, numberOfGridDivisions, 0x800080, 0x800080)
  scene.add(xzGrid)

  const yzGrid = new THREE.GridHelper(gridSize, numberOfGridDivisions, 0xADD8E6, 0xADD8E6)
  yzGrid.rotateZ(Math.PI / 2)
  scene.add(yzGrid)

  // Load objects
  loadPhysicsBodies()

  // Main rendering and animation loop
  function render(time) {
    time *= 0.001 // Convert time to seconds.

    // Resize the camera if the canvas's size (ie the user's browser window) was changed
    if (resizeRendererToDisplaySize(renderer)) {
      const canvas = renderer.domElement
      camera.aspect = canvas.clientWidth / canvas.clientHeight
      camera.updateProjectionMatrix()
    }

    // Animate objects:

    // ***************

    renderer.render(scene, camera)
    requestAnimationFrame(render)
  }

  // Used to check if the user's browser window has changed and the canvas and camera need to update.
  function resizeRendererToDisplaySize(renderer) {
    const canvas = renderer.domElement
    const pixelRatio = window.devicePixelRatio
    const width = canvas.clientWidth * pixelRatio | 1
    const height = canvas.clientHeight * pixelRatio | 1

    const needResize = canvas.width !== width || canvas.height !== height
    if (needResize) {
      renderer.setSize(width, height, false)
    }

    return needResize
  }

  // Make sure render gets called!
  render()

  function loadPhysicsBodies() {
    const gltfLoader = new GLTFLoader()

    for (var i = 0; i < gon.physics_bodies.length; i++) {
      loadPhysicsBody(gltfLoader, gon.physics_bodies[i])
    }
  }

  function loadPhysicsBody(loader, physics_body) {
    loader.load('/resources/models/' + physics_body['name'] + '.glb', (gltf) => {
      const name = physics_body['name']
      const px = parseFloat(physics_body['initial_position_x'])
      const py = parseFloat(physics_body['initial_position_y'])
      const pz = parseFloat(physics_body['initial_position_z'])
      const vx = parseFloat(physics_body['initial_velocity_x'])
      const vy = parseFloat(physics_body['initial_velocity_y'])
      const vz = parseFloat(physics_body['initial_velocity_z'])
      const radius = parseFloat(physics_body['radius'])
      var size;

      const root = gltf.scene

      // Load a bounding box around the model
      var boundingBox = new THREE.BoxHelper(root, 0xFF0000)
      boundingBox.update()
      root.add(boundingBox)

      // Set the model to the correct size
      if (name == 'Hubble') {
        size = radius / 23.56 // Divide by 23 to rescale the model to unit size.
      } else {
        size = radius / 1732.051 // Divide by 1732 to rescale the model to unit size.
      }

      root.scale.set(size, size, size)

      // Place the model at its initial position
      root.position.x = px
      root.position.y = py
      root.position.z = pz

      // Load an arrow representing the model's velocity
      const velocityArrow = new THREE.ArrowHelper(new THREE.Vector3(vx, vy, vz),
                                                  new THREE.Vector3(px, py, pz),
                                                  size + Math.sqrt((vx * vx) + (vy * vy) + (vz * vz)),
                                                  0x00FF0F)
      root.add(velocityArrow)

      scene.add(root)

      // Calculate and log the model's size and center
      const box = new THREE.Box3().setFromObject(root)
      const boxSize = box.getSize(new THREE.Vector3()).length()
      const boxCenter = box.getCenter(new THREE.Vector3())
      console.log(boxSize)
      console.log(boxCenter)
    })
  }

})
