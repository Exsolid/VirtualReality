using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;
using System;

[Serializable, VolumeComponentMenu("Post-processing/Custom/Glitch")]
public sealed class Glitch : CustomPostProcessVolumeComponent, IPostProcessComponent
{
    public ClampedFloatParameter _NoiseIntensity = new ClampedFloatParameter(0, 0, 1);
    public ClampedFloatParameter _ScreenDivisions = new ClampedFloatParameter(0, 0, 5);

    public ClampedFloatParameter _IndentionAmount = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _IndentionIntensityLeft = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _IndentionIntensityRight = new ClampedFloatParameter(0f, 0f, 1f);

    public ClampedFloatParameter _StaticOpacity = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _StaticDivisionsY = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _StaticDivisionsY2 = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _StaticDivisionsY3 = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _StaticTimed = new ClampedFloatParameter(0f, -1f, 1f);

    public ClampedFloatParameter _BlackWhite = new ClampedFloatParameter(0f, 0f, 1f);
    public ClampedFloatParameter _BlackWhiteContrast = new ClampedFloatParameter(0f, 0f, 1f);

    public ClampedFloatParameter _DisplacementIntensity = new ClampedFloatParameter(0f, 0f, 1f);

    public TextureParameter _DisplacementTexture = new TextureParameter(null);

    Material m_Material;

    public bool IsActive() => m_Material != null;
    // Do not forget to add this post process in the Custom Post Process Orders list (Project Settings > HDRP Default Settings).
    public override CustomPostProcessInjectionPoint injectionPoint => CustomPostProcessInjectionPoint.AfterPostProcess;

    const string kShaderName = "Hidden/Shader/Glitch";

    public override void Setup()
    {
        if (Shader.Find(kShaderName) != null)
            m_Material = new Material(Shader.Find(kShaderName));
        else
            Debug.LogError($"Unable to find shader '{kShaderName}'. Post Process Volume Glitch is unable to load.");
    }

    public override void Render(CommandBuffer cmd, HDCamera camera, RTHandle source, RTHandle destination)
    {
        if (m_Material == null)
            return;

        m_Material.SetFloat("_NoiseIntensity", _NoiseIntensity.value);
        m_Material.SetFloat("_ScreenDivisions", _ScreenDivisions.value);
        m_Material.SetFloat("_IndentionAmount", _IndentionAmount.value);
        m_Material.SetFloat("_IndentionIntensityLeft", _IndentionIntensityLeft.value);
        m_Material.SetFloat("_IndentionIntensityRight", _IndentionIntensityRight.value);
        m_Material.SetFloat("_StaticOpacity", _StaticOpacity.value);
        m_Material.SetFloat("_StaticDivisionsY", _StaticDivisionsY.value);
        m_Material.SetFloat("_StaticDivisionsY2", _StaticDivisionsY2.value);
        m_Material.SetFloat("_StaticDivisionsY3", _StaticDivisionsY3.value);
        m_Material.SetFloat("_StaticTimed", _StaticTimed.value);
        m_Material.SetFloat("_BlackWhite", _BlackWhite.value);
        m_Material.SetFloat("_BlackWhiteContrast", _BlackWhiteContrast.value);
        m_Material.SetFloat("_DisplacementIntensity", _DisplacementIntensity.value);
        m_Material.SetTexture("_RenderTex", source);
        m_Material.SetTexture("_DisplacementTex", _DisplacementTexture.value);
        HDUtils.DrawFullScreen(cmd, m_Material, destination);
    }

    public override void Cleanup()
    {
        CoreUtils.Destroy(m_Material);
    }
}
