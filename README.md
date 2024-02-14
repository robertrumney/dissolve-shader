# Unity Dissolve Shader

A custom dissolve shader for Unity, capable of creating a dynamic dissolve effect on 3D objects. It can be particularly useful in games for creating effects such as enemies disintegrating or objects phasing in/out.

The shader uses a procedural noise function to generate a unique dissolve pattern, and allows you to adjust the dissolve threshold and edge color to fine-tune the effect.

## Usage

1. Clone this repository or download the shader directly.
2. Place the shader file (`Dissolve.shader`) in a `/Resources/` directory within your Unity project. This is necessary for the `Shader.Find` function to work correctly in a compiled build.

You can use the shader by applying it to a material like this: `Material material = new Material(Shader.Find("Custom/Dissolve"));`

Then, apply this material to the mesh you want to dissolve like this: `renderer.material = material;`

To control the dissolve effect, you can adjust the dissolve threshold like this: `material.SetFloat("_DissolveThreshold", value);` Value should be a float between 0 (no dissolve) and 1 (fully dissolved).

You can also change the color of the edges that appear as the object dissolves like this: `material.SetColor("_EdgeColor", color);`

## Sample Script

A sample script (`DissolveMesh.cs`) is provided, which demonstrates how to use the shader to dissolve a mesh over time once a certain event occurs (such as an enemy "death").

## Contributing

Contributions to improve the shader or the sample script are welcome. Please feel free to submit a pull request or open an issue.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
