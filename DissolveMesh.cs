using System.Collections;
using UnityEngine;

[RequireComponent(typeof(Renderer))]
public class DissolveMesh : MonoBehaviour
{
    public Texture2D dissolveTexture;
    public Color dissolveColor = Color.red;
    public float delayBeforeStart = 3f;
    public float dissolveTime = 2f;

    private Material material;
    private float dissolveProgress = 0f;

    private void Start()
    {
        material = GetComponent<Renderer>().material;
        material.shader = Shader.Find("Custom/Dissolve");
        material.SetTexture("_DissolveTex", dissolveTexture);
        material.SetColor("_DissolveColor", dissolveColor);

        StartCoroutine(DissolveAfterDelay());
    }

    private IEnumerator DissolveAfterDelay()
    {
        yield return new WaitForSeconds(delayBeforeStart);

        while (dissolveProgress < 1f)
        {
            dissolveProgress += Time.deltaTime / dissolveTime;
            material.SetFloat("_DissolveThreshold", dissolveProgress);
            yield return null;
        }

        Destroy(gameObject);
    }
}
