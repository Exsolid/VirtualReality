using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
using System;

[Serializable, VolumeComponentMenu("Post-processing/Custom/Blur")]
public sealed class Blur : CustomPostProcessVolumeComponent, IPostProcessComponent
{

    Material m_Material;
    public ClampedFloatParameter _Quality = new ClampedFloatParameter(0, 0, 64);
    public ClampedFloatParameter _Amount = new ClampedFloatParameter(0, 0, 64);

    public bool IsActive() => m_Material != null;

    // Do not forget to add this post process in the Custom Post Process Orders list (Project Settings > HDRP Default Settings).
    public override CustomPostProcessInjectionPoint injectionPoint => CustomPostProcessInjectionPoint.AfterPostProcess;

    const string kShaderName = "Hidden/Shader/Blur";

    public override void Setup()
    {
        if (Shader.Find(kShaderName) != null)
            m_Material = new Material(Shader.Find(kShaderName));
        else
            Debug.LogError($"Unable to find shader '{kShaderName}'. Post Process Volume Blur is unable to load.");
    }

    public override void Render(CommandBuffer cmd, HDCamera camera, RTHandle source, RTHandle destination)
    {
        if (m_Material == null)
            return;

        m_Material.SetTexture("_RenderTex", source);
        m_Material.SetFloat("_Quality", _Quality.value);
        m_Material.SetFloat("_Amount", _Amount.value);
        HDUtils.DrawFullScreen(cmd, m_Material, destination);
    }

    public override void Cleanup()
    {
        CoreUtils.Destroy(m_Material);
    }
}
