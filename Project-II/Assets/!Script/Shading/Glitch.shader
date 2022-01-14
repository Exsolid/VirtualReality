Shader "Hidden/Shader/Glitch"
{
    Properties
    {
        _DisplacementTex ("Displacement Texture", 2D) = "white" {}

        _NoiseIntensity ("Noise Intensity", Range(0,1)) = 0.0

        _ScreenDivisions ("Screen Divisions", Range(0,5)) = 0.0

        _IndentionAmount ("Indention Amount", Range(0,0.1)) = 0.0
        _IndentionIntensityLeft ("Indention Intensity Left", Range(0,1)) = 0.0
        _IndentionIntensityRight ("Indention Intensity Right", Range(0,1)) = 0.0
        
        _StaticOpacity ("Static Opacity", Range(0,1)) = 0.0
        _StaticDivisionsY ("Static Divisions Y", Range(0,1)) = 0.01
        _StaticDivisionsY2 ("Static Divisions Y 2", Range(0,1)) = 0.01
        _StaticDivisionsY3 ("Static Divisions Y 3", Range(0,1)) = 0.01
        _StaticTimed ("Static Timed", Range(-1,1)) = 0.01

        _BlackWhite ("Black and White", Range(0,1)) = 0
        _BlackWhiteContrast ("Black and White Contrast", Range(0,1)) = 0

        _DisplacementIntensity ("Displacement Intensity", Range(0,1)) = 0
    }
    
    HLSLINCLUDE

    #pragma target 4.5
    #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch

    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/PostProcessing/Shaders/FXAA.hlsl"
    #include "Packages/com.unity.render-pipelines.high-definition/Runtime/PostProcessing/Shaders/RTUpscale.hlsl"

    TEXTURE2D_X(_RenderTex);
    sampler2D _DisplacementTex;

    float _NoiseIntensity;

    float _ScreenDivisions;

    float _IndentionAmount;
    float _IndentionIntensityLeft;
    float _IndentionIntensityRight;

    float _StaticOpacity;
    float _StaticDivisionsY;
    float _StaticDivisionsY2;
    float _StaticDivisionsY3;
    float _StaticTimed;

    float _BlackWhite;
    float _BlackWhiteContrast;

    float _DisplacementIntensity;

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

    float blackWhite(float x){
        return x-_BlackWhiteContrast;
    }

    float rand(float2 co)
    {
        return frac((sin( dot(co.xy , float2(12.345 * _Time.w, 67.890 * _Time.w) )) * 12345.67890+_Time.w));
    }

    float unevenCos(float v){
        return pow(cos(0.02 * v) + cos(0.03  * v) + cos(0.07 * v),2);
    }

    FragInput vert (MeshData data){
        FragInput o;
        o.pos = GetFullScreenTriangleVertexPosition(data.vertexID);
        o.uv =  GetFullScreenTriangleTexCoord(data.vertexID);
        return o;
    }

    float4 frag(FragInput input) : SV_TARGET {
        //Indention Values
        input.uv += saturate(cos(input.pos.y*_IndentionAmount)*0.1*_IndentionIntensityRight);
        input.uv -= saturate(cos(input.pos.y*_IndentionAmount)*0.1*-_IndentionIntensityLeft);

        //Repeating Screen Values
        input.uv.y = (_ScreenDivisions == 0) * input.uv.y + (_ScreenDivisions != 0) * (input.uv.y+_Time.x*5+_ScreenDivisions*2)*(_ScreenDivisions)%1;
        //Displacement
        float4 colDisp = tex2D(_DisplacementTex, input.uv);
        float2 uvCopy = input.uv + colDisp.xy * _DisplacementIntensity *0.1;
        uint2 positionSS = uvCopy.xy * _ScreenSize.xy;
        float4 col = LOAD_TEXTURE2D_X(_RenderTex, positionSS);

        //Noise Values
        col -=  rand(col.x)*0.3*_NoiseIntensity;
        col +=  rand(col.x)*0.1*_NoiseIntensity;

        //Static Values
        float timedValue =  (cos(_Time.y * 0.01)*10000) * _StaticTimed;
        float4 simpleLining = saturate(cos(input.pos.y*_StaticDivisionsY*2+_StaticDivisionsY*2)*_StaticOpacity);
        float4 breakLiningY = simpleLining * saturate(unevenCos(input.pos.y*_StaticDivisionsY2+_StaticDivisionsY2 + timedValue));  
        float4 breakLiningY2 = breakLiningY * saturate(unevenCos(input.pos.y*_StaticDivisionsY3+_StaticDivisionsY3 + timedValue));
        float4 timed = breakLiningY2 * saturate(unevenCos(input.pos.y + timedValue));
        col += timed;
        
        //Black and White Values
        col = (_BlackWhite != 1) * col + (_BlackWhite == 1) * blackWhite(col.z);

        return col;
    }

    ENDHLSL

    SubShader
    {
        Pass
        {
            Name "Glitch"

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
