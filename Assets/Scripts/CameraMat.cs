using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMat : MonoBehaviour
{

    bool lutToggle = false;

    //public Shader awesomeShader = null;
    public Material m_renderMaterial;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            lutToggle = !lutToggle;
        }
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, m_renderMaterial);
    }
}
