Shader "Hidden/Shader/Blur"
{
    HLSLINCLUDE

    #pragma target 4.5
    #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch

    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/PostProcessing/Shaders/FXAA.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/PostProcessing/Shaders/RTUpscale.hlsl"
    TEXTURE2D_X(_RenderTex);

    float _Quality;
    float _Amount;
    
    struct FragInput {
        float4 pos : SV_POSITION;
        float2 uv : TEXCOORD0;
    };

    struct MeshData {
        float4 pos : POSITION;
        float2 uv : TEXCOORD0;
        uint vertexID : SV_VertexID;

        UNITY_VERTEX_INPUT_INSTANCE_ID
    };

    FragInput vert (MeshData data){
        FragInput o;
        o.pos = GetFullScreenTriangleVertexPosition(data.vertexID);
        o.uv =  GetFullScreenTriangleTexCoord(data.vertexID);
        return o;
    }

    float4 frag(FragInput input) : SV_TARGET {

        uint2 positionSS = input.uv * _ScreenSize.xy;
        float4 col = LOAD_TEXTURE2D_X(_RenderTex, positionSS);
        float inversAspect = _ScreenSize.y / _ScreenSize.x;
        for(float smpl=0.0; smpl<_Quality; smpl+=1){
            col += LOAD_TEXTURE2D_X(_RenderTex, positionSS+float2((smpl/9 - 0.5) *inversAspect,(smpl/9 - 0.5))*_Amount);
        }
        return col/(_Quality * (_Quality != 0) + 1 * (_Quality == 0));
    }

    ENDHLSL

    SubShader
    {
        Pass
        {
            Name "Blur"

            ZWrite Off
            ZTest Always
            Blend Off
            Cull Off

            HLSLPROGRAM
                #pragma fragment frag
                #pragma vertex vert
            ENDHLSL
        }
    }
    Fallback Off
}
