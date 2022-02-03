Shader "Ciconia Studio/CS_Wet Animation/HDRP/Rainy 3D Objects/Opaque/Lite"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Space(35)][Header(Main Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_GlobalXYTilingXYZWOffsetXY("Global --> XY(TilingXY) - ZW(OffsetXY)", Vector) = (1,1,0,0)
		_Color("Color", Color) = (1,1,1,0)
		[Toggle]_InvertABaseColor("Invert Alpha", Float) = 0
		_MainTex("Base Color  -->(Mask A)", 2D) = "white" {}
		_Saturation("Saturation", Float) = 0
		_Brightness("Brightness", Range( 1 , 8)) = 1
		[Space(35)]_BumpMap("Normal Map", 2D) = "bump" {}
		_BumpScale("Normal Intensity", Float) = 0.3
		[Space(35)]_MetallicGlossMapMAHS("Mask Map  -->M(R) - Ao(G) - H(B) - S(A)", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 2)) = 0
		_Glossiness("Smoothness", Range( 0 , 2)) = 0.5
		[Space(15)]_Parallax("Height Scale", Range( -0.1 , 0.1)) = 0
		_AoIntensity("Ao Intensity", Range( 0 , 2)) = 0
		[HDR][Space(45)]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_EmissionMap("Emission Map", 2D) = "white" {}
		_EmissionIntensity("Intensity", Range( 0 , 2)) = 1
		[Space(35)][Header(Rain Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_GradientTexRain1("Gradient Tex --> DropLRamp(R) DropFade(G) DripLRamp(B) DripLMask(A) ", 2D) = "white" {}
		[Space(15)][KeywordEnum(Additive,Lighten)] _BlendingModeDrops("Blending Mode", Float) = 0
		_NormalDrop("Normal Drop", Float) = 1
		_SmoothnessDrop("Smoothness Drop", Range( 0 , 1)) = 0.2
		[Space(15)][Header(__________  Rain Drops  __________)][Space(15)]_Intensity("Intensity", Range( 0 , 1)) = 1
		_Tiling("Tiling", Float) = 5
		_SplashSpeed("Splash Speed", Range( 0 , 1)) = 0.1
		[Space(10)]_Size("Size", Range( 0 , 1)) = 0.5
		_DotFalloff("Falloff", Range( 0 , 1)) = 1
		_Noisescale("Noise scale", Float) = 5
		[Space(15)][Header(Drop Top)][Toggle]_UseBaseColorAlphaMaskTop("Use BaseColor Alpha Mask", Float) = 0
		_DropTopIntensity("Intensity", Range( 0 , 1)) = 1
		[Space(15)][Header(Drop Side)][Toggle]_EnableDropSide("Enable", Float) = 0
		[Space(10)][Toggle]_UseBaseColorAlphaMaskSide("Use BaseColor Alpha Mask", Float) = 0
		_DropSideIntensity("Intensity", Range( 0 , 1)) = 1
		[Space(35)][Header(__________  Rain Drip Line  __________)][Space(15)]_Amount("Amount", Float) = 8
		[Toggle]_UseBaseColorAlphaMaskSide1("Use BaseColor Alpha Mask", Float) = 0
		[Space(10)]_IntensityDripLine("Intensity", Range( 0 , 3)) = 2
		[Space(15)]_DripLineContrast("Contrast ", Float) = 1
		_TilingHorizontal("Tiling Horizontal", Float) = 1
		_TilingVertical("Tiling Vertical", Float) = 1
		[Space(15)]_DripLineSpeed("Speed", Float) = 1
		_RandomMax("Range Speed", Range( 0.1 , 10)) = 0.3
		_RandomPosition("Random Position", Float) = 1
		[Space(15)][Header(Trail of drop)][Toggle(_ENABLETRAILOFDROP_ON)] _EnableTrailOfDrop("Enable", Float) = 0
		[Space(10)]_TrailDropContrast("Contrast ", Float) = 1
		_TrailDropTiling("Tiling", Float) = 40
		[Space(10)]_TrailDropSpeed("Speed", Float) = 0.2
		_TrailDropSize("Shrink", Float) = 4
		[Space(25)][Toggle]_EnableRandomMask("Enable Random Mask", Float) = 0
		_GrowMask("Grow Mask", Range( 1 , 10)) = 1
		[Toggle]_EnableProjectionGrid("Enable Projection Grid", Float) = 0
		[Space(45)][Header(Reflection Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_ColorCubemap1("Color ", Color) = (1,1,1,1)
		[HDR]_Cubemap("Cubemap", CUBE) = "black" {}
		[Space(10)]_ReflectionIntensity("Intensity", Float) = 0.2
		_BlurReflection("Blur", Range( 0 , 7)) = 0.5
		[KeywordEnum(All,RainDrops,DropOnly,DripLineOnly)] _Reflected("Reflected", Float) = 0

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector] [ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector] [ToggleUI]_SupportDecals("Boolean", Float) = 1
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 6
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 8
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 40
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 40
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 14
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 10
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector] [ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector] [ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] [ToggleUI] _ReceivesSSRTransparent("Boolean", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector] [ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector] [ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 1
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Int) = 0
		[HideInInspector] [ToggleUI] _EnableFogOnTransparent("Enable Fog On Transparent", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2
		[HideInInspector] [Enum(Front, 1, Back, 2)] _TransparentCullMode("Transparent Cull Mode", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4
		[HideInInspector] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Float) = 4
		[HideInInspector] [ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector] [ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector] [ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector] [ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector] [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 metal vulkan xboxone ps4 switch 
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription //Distortion
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		
		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile _ LIGHT_LAYERS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			sampler2D _MetallicGlossMapMAHS;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _GradientTexRain1;
			sampler2D _BumpMap;
			sampler2D _EmissionMap;
			samplerCUBE _Cubemap;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _ENABLETRAILOFDROP_ON
			#pragma shader_feature_local _REFLECTED_ALL _REFLECTED_RAINDROPS _REFLECTED_DROPONLY _REFLECTED_DRIPLINEONLY
			#pragma shader_feature_local _BLENDINGMODEDROPS_ADDITIVE _BLENDINGMODEDROPS_LIGHTEN


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash58_g990( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g990( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g990( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash877( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi877( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash877( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash48_g1003( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi48_g1003( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash48_g1003( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 PerturbNormal107_g1004( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainTex = packedInput.ase_texcoord5.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break26_g818 = uv_MainTex;
				float GlobalTilingX11 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float GlobalTilingY8 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g818 = (float2(( break26_g818.x * GlobalTilingX11 ) , ( break26_g818.y * GlobalTilingY8 )));
				float GlobalOffsetX10 = _GlobalXYTilingXYZWOffsetXY.z;
				float GlobalOffsetY9 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g818 = (float2(( break26_g818.x + GlobalOffsetX10 ) , ( break26_g818.y + GlobalOffsetY9 )));
				float2 uv_MetallicGlossMapMAHS = packedInput.ase_texcoord5.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g622 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g622 = (float2(( break26_g622.x * GlobalTilingX11 ) , ( break26_g622.y * GlobalTilingY8 )));
				float2 appendResult13_g622 = (float2(( break26_g622.x + GlobalOffsetX10 ) , ( break26_g622.y + GlobalOffsetY9 )));
				float4 tex2DNode3_g621 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g622 + appendResult13_g622 ) + float2( 0,0 ) ) );
				float3 ase_worldBitangent = packedInput.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 ase_tanViewDir =  tanToWorld0 * V.x + tanToWorld1 * V.y  + tanToWorld2 * V.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g621 = ParallaxOffset( tex2DNode3_g621.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g621 = (((isFrontFace>0)?(paralaxOffset38_g621):(0.0)));
				float2 Parallaxe494 = switchResult37_g621;
				float4 tex2DNode7_g817 = tex2D( _MainTex, ( ( appendResult14_g818 + appendResult13_g818 ) + Parallaxe494 ) );
				float clampResult27_g817 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g817 = ( _Color * tex2DNode7_g817 ).rgb;
				float desaturateDot29_g817 = dot( desaturateInitialColor29_g817, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g817 = lerp( desaturateInitialColor29_g817, desaturateDot29_g817.xxx, -clampResult27_g817 );
				float4 temp_output_819_0 = CalculateContrast(_Brightness,float4( desaturateVar29_g817 , 0.0 ));
				float4 Albedo26 = temp_output_819_0;
				
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 surf_pos107_g1004 = ase_worldPos;
				float3 surf_norm107_g1004 = normalWS;
				float2 temp_cast_3 = (_SplashSpeed).xx;
				float time58_g990 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g990 = 0;
				float2 texCoord55_g990 = packedInput.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_577_0 = ( _Noisescale * 100.0 );
				float clampResult962 = clamp( temp_output_577_0 , 0.0 , 10000.0 );
				float time877 = 0.0;
				float2 voronoiSmoothId877 = 0;
				float2 texCoord576 = packedInput.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords877 = texCoord576 * clampResult962;
				float2 id877 = 0;
				float2 uv877 = 0;
				float fade877 = 0.5;
				float voroi877 = 0;
				float rest877 = 0;
				for( int it877 = 0; it877 <3; it877++ ){
				voroi877 += fade877 * voronoi877( coords877, time877, id877, uv877, 0,voronoiSmoothId877 );
				rest877 += fade877;
				coords877 *= 2;
				fade877 *= 0.5;
				}//Voronoi877
				voroi877 /= rest877;
				float Noise588 = ( voroi877 * 0.005 );
				float4 temp_cast_5 = (Noise588).xxxx;
				float2 coords58_g990 = ( float4( texCoord55_g990, 0.0 , 0.0 ) + temp_cast_5 ).xy * _Tiling;
				float2 id58_g990 = 0;
				float2 uv58_g990 = 0;
				float fade58_g990 = 0.5;
				float voroi58_g990 = 0;
				float rest58_g990 = 0;
				for( int it58_g990 = 0; it58_g990 <2; it58_g990++ ){
				voroi58_g990 += fade58_g990 * voronoi58_g990( coords58_g990, time58_g990, id58_g990, uv58_g990, 0,voronoiSmoothId58_g990 );
				rest58_g990 += fade58_g990;
				coords58_g990 *= 2;
				fade58_g990 *= 0.5;
				}//Voronoi58_g990
				voroi58_g990 /= rest58_g990;
				float2 myVarName60_g990 = id58_g990;
				float2 panner63_g990 = ( 1.0 * _Time.y * temp_cast_3 + ( step( voroi58_g990 , 0.1 ) * myVarName60_g990 ));
				float temp_output_79_0_g990 = (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0));
				float temp_output_120_0_g990 = saturate( ( step( voroi58_g990 , temp_output_79_0_g990 ) * ( 1.0 - ( voroi58_g990 * temp_output_79_0_g990 * (1.0 + (_DotFalloff - 0.0) * (500.0 - 1.0) / (1.0 - 0.0)) ) ) ) );
				float MaskWorldY589 = normalWS.y;
				float temp_output_667_0 = ( MaskWorldY589 * _DropTopIntensity );
				float BaseColorAlpha46 = (( _InvertABaseColor )?( ( 1.0 - tex2DNode7_g817.a ) ):( tex2DNode7_g817.a ));
				float3 temp_cast_7 = (0.5).xxx;
				float3 break580 = ( abs( normalWS ) - temp_cast_7 );
				float MaskWorldX585 = break580.x;
				float MaskWorldZ583 = break580.z;
				float blendOpSrc598 = MaskWorldX585;
				float blendOpDest598 = MaskWorldZ583;
				float temp_output_599_0 = ( ( saturate( max( blendOpSrc598, blendOpDest598 ) )) * _DropSideIntensity );
				float blendOpSrc603 = (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 ));
				float blendOpDest603 = (( _UseBaseColorAlphaMaskSide )?( ( temp_output_599_0 * BaseColorAlpha46 ) ):( temp_output_599_0 ));
				float clampResult605 = clamp( ( ( saturate( ( tex2D( _GradientTexRain1, panner63_g990 ).g * temp_output_120_0_g990 ) ) * _Intensity ) * (( _EnableDropSide )?( ( saturate( max( blendOpSrc603, blendOpDest603 ) )) ):( (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 )) )) ) , 0.0 , 1.0 );
				float RainDrops606 = clampResult605;
				float4 temp_cast_8 = (RainDrops606).xxxx;
				float clampResult243_g1003 = clamp( _DripLineContrast , 0.0 , 100.0 );
				float3 worldToObj249_g1003 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(( mul( UNITY_MATRIX_M, float4( ase_worldPos , 0.0 ) ).xyz + float3( float2( 0.5,0.5 ) ,  0.0 ) )), 1 ) ).xyz;
				float4 appendResult16_g1003 = (float4(worldToObj249_g1003.z , worldToObj249_g1003.y , 0.0 , 0.0));
				float clampResult5_g1003 = clamp( _Amount , 8.0 , 1000.0 );
				float2 _Globaltiling = float2(1,1);
				float4 XProjectionAmount23_g1003 = ( appendResult16_g1003 * ( clampResult5_g1003 * ( _Globaltiling.y * _TilingHorizontal ) ) );
				float RandomPosition25_g1003 = _RandomPosition;
				float simplePerlin2D46_g1003 = snoise( ( floor( XProjectionAmount23_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*RandomPosition25_g1003 );
				simplePerlin2D46_g1003 = simplePerlin2D46_g1003*0.5 + 0.5;
				float temp_output_240_0_g1003 = (1.0 + (_GrowMask - 1.0) * (50.0 - 1.0) / (10.0 - 1.0));
				float temp_output_83_0_g1003 = round( ( pow( simplePerlin2D46_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float RF_RandomMin66_g1003 = 0.05;
				float RF_Random65_g1003 = (0.05 + (_RandomMax - 0.1) * (1.0 - 0.05) / (1.0 - 0.1));
				float2 appendResult88_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult99_g1003 = (float4(temp_output_83_0_g1003 , appendResult88_g1003 , 0.0));
				float4 break104_g1003 = appendResult99_g1003;
				float lerpResult117_g1003 = lerp( break104_g1003.y , break104_g1003.z , pow( simplePerlin2D46_g1003 , 2.0 ));
				float RF_Timespeed77_g1003 = _DripLineSpeed;
				float mulTime105_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 XProjection98_g1003 = appendResult16_g1003;
				float3 temp_output_106_0_g1003 = ( float3(0,-1,0) * _TilingVertical );
				float4 tex2DNode147_g1003 = tex2D( _GradientTexRain1, ( ( lerpResult117_g1003 * ( mulTime105_g1003 + pow( simplePerlin2D46_g1003 , 2.0 ) ) ) + ( XProjection98_g1003 * float4( temp_output_106_0_g1003 , 0.0 ) ) ).xy );
				float4 temp_cast_16 = (tex2DNode147_g1003.r).xxxx;
				float4 temp_cast_17 = (MaskWorldX585).xxxx;
				float4 InputMaskWorldX199_g1003 = temp_cast_17;
				float4 temp_output_168_0_g1003 = ( CalculateContrast(clampResult243_g1003,temp_cast_16) * InputMaskWorldX199_g1003 * clampResult243_g1003 );
				float4 clampResult173_g1003 = clamp( temp_output_168_0_g1003 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float clampResult156_g1003 = clamp( (-1.0 + (_TrailDropContrast - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , -1.0 , 100.0 );
				float mulTime40_g1003 = _TimeParameters.x * _TrailDropSpeed;
				float time48_g1003 = mulTime40_g1003;
				float2 voronoiSmoothId48_g1003 = 0;
				float2 texCoord41_g1003 = packedInput.ase_texcoord5.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords48_g1003 = texCoord41_g1003 * _TrailDropTiling;
				float2 id48_g1003 = 0;
				float2 uv48_g1003 = 0;
				float fade48_g1003 = 0.5;
				float voroi48_g1003 = 0;
				float rest48_g1003 = 0;
				for( int it48_g1003 = 0; it48_g1003 <2; it48_g1003++ ){
				voroi48_g1003 += fade48_g1003 * voronoi48_g1003( coords48_g1003, time48_g1003, id48_g1003, uv48_g1003, 0,voronoiSmoothId48_g1003 );
				rest48_g1003 += fade48_g1003;
				coords48_g1003 *= 2;
				fade48_g1003 *= 0.5;
				}//Voronoi48_g1003
				voroi48_g1003 /= rest48_g1003;
				float temp_output_52_0_g1003 = ( voroi48_g1003 * (2.0 + (_TrailDropSize - 0.0) * (4.0 - 2.0) / (1.0 - 0.0)) );
				float temp_output_72_0_g1003 = ( step( voroi48_g1003 , temp_output_52_0_g1003 ) * ( 1.0 - temp_output_52_0_g1003 ) );
				float blendOpSrc112_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				float blendOpDest112_g1003 = ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch129_g1003 = ( blendOpSrc112_g1003 + blendOpDest112_g1003 );
				#else
				float staticSwitch129_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				#endif
				float4 XTrailOfDrop161_g1003 = saturate( ( staticSwitch129_g1003 * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpSrc177_g1003 = clampResult173_g1003;
				float4 blendOpDest177_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode147_g1003.b * InputMaskWorldX199_g1003 )) * XTrailOfDrop161_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float4 staticSwitch235_g1003 = ( blendOpSrc177_g1003 + blendOpDest177_g1003 );
				#else
				float4 staticSwitch235_g1003 = clampResult173_g1003;
				#endif
				float4 appendResult17_g1003 = (float4(worldToObj249_g1003.x , worldToObj249_g1003.y , 0.0 , 0.0));
				float4 ZProjection97_g1003 = appendResult17_g1003;
				float4 ZProjectionAmount22_g1003 = ( appendResult17_g1003 * ( ( _Globaltiling.y * _TilingHorizontal ) * clampResult5_g1003 ) );
				float simplePerlin2D49_g1003 = snoise( ( floor( ZProjectionAmount22_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*( RandomPosition25_g1003 + 0.5 ) );
				simplePerlin2D49_g1003 = simplePerlin2D49_g1003*0.5 + 0.5;
				float temp_output_80_0_g1003 = round( ( pow( simplePerlin2D49_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float2 appendResult85_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult101_g1003 = (float4(temp_output_80_0_g1003 , appendResult85_g1003 , 0.0));
				float4 break110_g1003 = appendResult101_g1003;
				float lerpResult121_g1003 = lerp( break110_g1003.y , break110_g1003.z , pow( simplePerlin2D49_g1003 , 2.0 ));
				float mulTime109_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 tex2DNode152_g1003 = tex2D( _GradientTexRain1, ( ( float4( temp_output_106_0_g1003 , 0.0 ) * ZProjection97_g1003 ) + ( lerpResult121_g1003 * ( mulTime109_g1003 + pow( simplePerlin2D49_g1003 , 2.0 ) ) ) ).xy );
				float4 temp_cast_28 = (tex2DNode152_g1003.r).xxxx;
				float4 temp_cast_29 = (MaskWorldZ583).xxxx;
				float4 InputMaskWorldZ205_g1003 = temp_cast_29;
				float4 clampResult175_g1003 = clamp( ( CalculateContrast(clampResult243_g1003,temp_cast_28) * InputMaskWorldZ205_g1003 * clampResult243_g1003 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float blendOpSrc118_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				float blendOpDest118_g1003 = ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch124_g1003 = ( blendOpSrc118_g1003 + blendOpDest118_g1003 );
				#else
				float staticSwitch124_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				#endif
				float4 ZTrailOfDrop157_g1003 = saturate( ( staticSwitch124_g1003 * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc179_g1003 = clampResult175_g1003;
				float4 blendOpDest179_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode152_g1003.b * InputMaskWorldZ205_g1003 )) * ZTrailOfDrop157_g1003 );
				float4 blendOpSrc186_g1003 = staticSwitch235_g1003;
				float4 blendOpDest186_g1003 = ( saturate( ( blendOpSrc179_g1003 + blendOpDest179_g1003 ) ));
				float4 blendOpSrc185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpDest185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc188_g1003 = InputMaskWorldX199_g1003;
				float4 blendOpDest188_g1003 = InputMaskWorldZ205_g1003;
				float4 temp_cast_39 = (MaskWorldY589).xxxx;
				float4 InputMaskWorldY207_g1003 = temp_cast_39;
				float4 blendOpSrc190_g1003 = ( saturate( max( blendOpSrc188_g1003, blendOpDest188_g1003 ) ));
				float4 blendOpDest190_g1003 = ( InputMaskWorldY207_g1003 * 2.0 );
				float4 clampResult192_g1003 = clamp( ( ( ( saturate( ( blendOpSrc186_g1003 + blendOpDest186_g1003 ) )) * ( saturate( max( blendOpSrc185_g1003, blendOpDest185_g1003 ) )) ) * ( saturate( max( blendOpSrc190_g1003, blendOpDest190_g1003 ) )) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 blendOpSrc226_g1003 = ( temp_output_83_0_g1003 * InputMaskWorldX199_g1003 );
				float4 blendOpDest226_g1003 = ( temp_output_80_0_g1003 * InputMaskWorldZ205_g1003 );
				float4 temp_output_226_0_g1003 = ( saturate( max( blendOpSrc226_g1003, blendOpDest226_g1003 ) ));
				float4 MaskRandom231_g1003 = ( temp_output_226_0_g1003 + temp_output_226_0_g1003 );
				float4 RainDropsFalling766 = (( _EnableRandomMask )?( ( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) * MaskRandom231_g1003 ) ):( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) ));
				float4 blendOpSrc772 = temp_cast_8;
				float4 blendOpDest772 = RainDropsFalling766;
				float height107_g1004 = ( saturate( max( blendOpSrc772, blendOpDest772 ) )).r;
				float scale107_g1004 = ( _NormalDrop / 10.0 );
				float3 localPerturbNormal107_g1004 = PerturbNormal107_g1004( surf_pos107_g1004 , surf_norm107_g1004 , height107_g1004 , scale107_g1004 );
				float3x3 ase_worldToTangent = float3x3(tangentWS.xyz,ase_worldBitangent,normalWS);
				float3 worldToTangentDir42_g1004 = mul( ase_worldToTangent, localPerturbNormal107_g1004);
				float2 uv_BumpMap = packedInput.ase_texcoord5.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1006 = uv_BumpMap;
				float2 appendResult14_g1006 = (float2(( break26_g1006.x * GlobalTilingX11 ) , ( break26_g1006.y * GlobalTilingY8 )));
				float2 appendResult13_g1006 = (float2(( break26_g1006.x + GlobalOffsetX10 ) , ( break26_g1006.y + GlobalOffsetY9 )));
				float3 unpack4_g1005 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1006 + appendResult13_g1006 ) + Parallaxe494 ) ), _BumpScale );
				unpack4_g1005.z = lerp( 1, unpack4_g1005.z, saturate(_BumpScale) );
				float3 Normal27 = BlendNormal( worldToTangentDir42_g1004 , unpack4_g1005 );
				
				float Metallic41 = ( tex2DNode3_g621.r * _Metallic );
				
				float2 uv_EmissionMap = packedInput.ase_texcoord5.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float2 break26_g1009 = uv_EmissionMap;
				float2 appendResult14_g1009 = (float2(( break26_g1009.x * GlobalTilingX11 ) , ( break26_g1009.y * GlobalTilingY8 )));
				float2 appendResult13_g1009 = (float2(( break26_g1009.x + GlobalOffsetX10 ) , ( break26_g1009.y + GlobalOffsetY9 )));
				float3 worldRefl28_g1096 = normalize( reflect( -V, float3( dot( tanToWorld0, Normal27 ), dot( tanToWorld1, Normal27 ), dot( tanToWorld2, Normal27 ) ) ) );
				float4 texCUBENode27_g1096 = texCUBElod( _Cubemap, float4( worldRefl28_g1096, _BlurReflection) );
				float clampResult58_g1096 = clamp( ( _ReflectionIntensity * 1000.0 ) , 0.0 , 100000.0 );
				float4 temp_cast_43 = (1.0).xxxx;
				float4 temp_cast_44 = (1.0).xxxx;
				float4 temp_cast_45 = (RainDrops606).xxxx;
				float4 blendOpSrc780 = RainDropsFalling766;
				float4 blendOpDest780 = temp_cast_45;
				float4 temp_cast_46 = (RainDrops606).xxxx;
				#if defined(_REFLECTED_ALL)
				float4 staticSwitch963 = temp_cast_43;
				#elif defined(_REFLECTED_RAINDROPS)
				float4 staticSwitch963 = ( saturate( max( blendOpSrc780, blendOpDest780 ) ));
				#elif defined(_REFLECTED_DROPONLY)
				float4 staticSwitch963 = temp_cast_46;
				#elif defined(_REFLECTED_DRIPLINEONLY)
				float4 staticSwitch963 = RainDropsFalling766;
				#else
				float4 staticSwitch963 = temp_cast_43;
				#endif
				float4 Emission110 = ( ( _EmissionColor * tex2D( _EmissionMap, ( ( appendResult14_g1009 + appendResult13_g1009 ) + Parallaxe494 ) ) * _EmissionIntensity ) + ( ( texCUBENode27_g1096 * ( texCUBENode27_g1096.a * clampResult58_g1096 ) * _ColorCubemap1 ) * staticSwitch963 ) );
				
				float temp_output_1_0_g621 = ( tex2DNode3_g621.a * _Glossiness );
				float4 temp_cast_50 = (RainDrops606).xxxx;
				float4 blendOpSrc707 = temp_cast_50;
				float4 blendOpDest707 = RainDropsFalling766;
				float4 temp_output_609_0 = ( ( _SmoothnessDrop * 5.0 ) * ( saturate( max( blendOpSrc707, blendOpDest707 ) )) );
				float4 temp_cast_51 = (temp_output_1_0_g621).xxxx;
				float4 blendOpSrc613 = temp_cast_51;
				float4 blendOpDest613 = temp_output_609_0;
				#if defined(_BLENDINGMODEDROPS_ADDITIVE)
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#elif defined(_BLENDINGMODEDROPS_LIGHTEN)
				float4 staticSwitch612 = ( saturate( max( blendOpSrc613, blendOpDest613 ) ));
				#else
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#endif
				float4 Smoothness40 = staticSwitch612;
				
				float blendOpSrc34_g621 = tex2DNode3_g621.g;
				float blendOpDest34_g621 = ( 1.0 - _AoIntensity );
				float AOG565 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g621 ) * ( 1.0 - blendOpDest34_g621 ) ) ));
				float AmbientOcclusion94 = AOG565;
				
				surfaceDescription.Albedo = Albedo26.rgb;
				surfaceDescription.Normal = Normal27;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Metallic41;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Emission110.rgb;
				surfaceDescription.Smoothness = Smoothness40.r;
				surfaceDescription.Occlusion = AmbientOcclusion94;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			sampler2D _MetallicGlossMapMAHS;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _GradientTexRain1;
			sampler2D _BumpMap;
			sampler2D _EmissionMap;
			samplerCUBE _Cubemap;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local _ENABLETRAILOFDROP_ON
			#pragma shader_feature_local _REFLECTED_ALL _REFLECTED_RAINDROPS _REFLECTED_DROPONLY _REFLECTED_DRIPLINEONLY
			#pragma shader_feature_local _BLENDINGMODEDROPS_ADDITIVE _BLENDINGMODEDROPS_LIGHTEN


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash58_g990( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g990( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g990( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash877( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi877( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash877( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash48_g1003( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi48_g1003( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash48_g1003( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 PerturbNormal107_g1004( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			CBUFFER_START(UnityMetaPass)
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldBitangent;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord.xyz = inputMesh.uv0.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord1.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float2 uv = float2(0.0, 0.0);
				if (unity_MetaVertexControl.x)
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if (unity_MetaVertexControl.y)
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4(uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainTex = packedInput.ase_texcoord.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break26_g818 = uv_MainTex;
				float GlobalTilingX11 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float GlobalTilingY8 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g818 = (float2(( break26_g818.x * GlobalTilingX11 ) , ( break26_g818.y * GlobalTilingY8 )));
				float GlobalOffsetX10 = _GlobalXYTilingXYZWOffsetXY.z;
				float GlobalOffsetY9 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g818 = (float2(( break26_g818.x + GlobalOffsetX10 ) , ( break26_g818.y + GlobalOffsetY9 )));
				float2 uv_MetallicGlossMapMAHS = packedInput.ase_texcoord.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g622 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g622 = (float2(( break26_g622.x * GlobalTilingX11 ) , ( break26_g622.y * GlobalTilingY8 )));
				float2 appendResult13_g622 = (float2(( break26_g622.x + GlobalOffsetX10 ) , ( break26_g622.y + GlobalOffsetY9 )));
				float4 tex2DNode3_g621 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g622 + appendResult13_g622 ) + float2( 0,0 ) ) );
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = packedInput.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g621 = ParallaxOffset( tex2DNode3_g621.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g621 = (((isFrontFace>0)?(paralaxOffset38_g621):(0.0)));
				float2 Parallaxe494 = switchResult37_g621;
				float4 tex2DNode7_g817 = tex2D( _MainTex, ( ( appendResult14_g818 + appendResult13_g818 ) + Parallaxe494 ) );
				float clampResult27_g817 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g817 = ( _Color * tex2DNode7_g817 ).rgb;
				float desaturateDot29_g817 = dot( desaturateInitialColor29_g817, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g817 = lerp( desaturateInitialColor29_g817, desaturateDot29_g817.xxx, -clampResult27_g817 );
				float4 temp_output_819_0 = CalculateContrast(_Brightness,float4( desaturateVar29_g817 , 0.0 ));
				float4 Albedo26 = temp_output_819_0;
				
				float3 surf_pos107_g1004 = ase_worldPos;
				float3 surf_norm107_g1004 = ase_worldNormal;
				float2 temp_cast_3 = (_SplashSpeed).xx;
				float time58_g990 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g990 = 0;
				float2 texCoord55_g990 = packedInput.ase_texcoord.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_577_0 = ( _Noisescale * 100.0 );
				float clampResult962 = clamp( temp_output_577_0 , 0.0 , 10000.0 );
				float time877 = 0.0;
				float2 voronoiSmoothId877 = 0;
				float2 texCoord576 = packedInput.ase_texcoord.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords877 = texCoord576 * clampResult962;
				float2 id877 = 0;
				float2 uv877 = 0;
				float fade877 = 0.5;
				float voroi877 = 0;
				float rest877 = 0;
				for( int it877 = 0; it877 <3; it877++ ){
				voroi877 += fade877 * voronoi877( coords877, time877, id877, uv877, 0,voronoiSmoothId877 );
				rest877 += fade877;
				coords877 *= 2;
				fade877 *= 0.5;
				}//Voronoi877
				voroi877 /= rest877;
				float Noise588 = ( voroi877 * 0.005 );
				float4 temp_cast_5 = (Noise588).xxxx;
				float2 coords58_g990 = ( float4( texCoord55_g990, 0.0 , 0.0 ) + temp_cast_5 ).xy * _Tiling;
				float2 id58_g990 = 0;
				float2 uv58_g990 = 0;
				float fade58_g990 = 0.5;
				float voroi58_g990 = 0;
				float rest58_g990 = 0;
				for( int it58_g990 = 0; it58_g990 <2; it58_g990++ ){
				voroi58_g990 += fade58_g990 * voronoi58_g990( coords58_g990, time58_g990, id58_g990, uv58_g990, 0,voronoiSmoothId58_g990 );
				rest58_g990 += fade58_g990;
				coords58_g990 *= 2;
				fade58_g990 *= 0.5;
				}//Voronoi58_g990
				voroi58_g990 /= rest58_g990;
				float2 myVarName60_g990 = id58_g990;
				float2 panner63_g990 = ( 1.0 * _Time.y * temp_cast_3 + ( step( voroi58_g990 , 0.1 ) * myVarName60_g990 ));
				float temp_output_79_0_g990 = (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0));
				float temp_output_120_0_g990 = saturate( ( step( voroi58_g990 , temp_output_79_0_g990 ) * ( 1.0 - ( voroi58_g990 * temp_output_79_0_g990 * (1.0 + (_DotFalloff - 0.0) * (500.0 - 1.0) / (1.0 - 0.0)) ) ) ) );
				float MaskWorldY589 = ase_worldNormal.y;
				float temp_output_667_0 = ( MaskWorldY589 * _DropTopIntensity );
				float BaseColorAlpha46 = (( _InvertABaseColor )?( ( 1.0 - tex2DNode7_g817.a ) ):( tex2DNode7_g817.a ));
				float3 temp_cast_7 = (0.5).xxx;
				float3 break580 = ( abs( ase_worldNormal ) - temp_cast_7 );
				float MaskWorldX585 = break580.x;
				float MaskWorldZ583 = break580.z;
				float blendOpSrc598 = MaskWorldX585;
				float blendOpDest598 = MaskWorldZ583;
				float temp_output_599_0 = ( ( saturate( max( blendOpSrc598, blendOpDest598 ) )) * _DropSideIntensity );
				float blendOpSrc603 = (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 ));
				float blendOpDest603 = (( _UseBaseColorAlphaMaskSide )?( ( temp_output_599_0 * BaseColorAlpha46 ) ):( temp_output_599_0 ));
				float clampResult605 = clamp( ( ( saturate( ( tex2D( _GradientTexRain1, panner63_g990 ).g * temp_output_120_0_g990 ) ) * _Intensity ) * (( _EnableDropSide )?( ( saturate( max( blendOpSrc603, blendOpDest603 ) )) ):( (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 )) )) ) , 0.0 , 1.0 );
				float RainDrops606 = clampResult605;
				float4 temp_cast_8 = (RainDrops606).xxxx;
				float clampResult243_g1003 = clamp( _DripLineContrast , 0.0 , 100.0 );
				float3 worldToObj249_g1003 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(( mul( UNITY_MATRIX_M, float4( ase_worldPos , 0.0 ) ).xyz + float3( float2( 0.5,0.5 ) ,  0.0 ) )), 1 ) ).xyz;
				float4 appendResult16_g1003 = (float4(worldToObj249_g1003.z , worldToObj249_g1003.y , 0.0 , 0.0));
				float clampResult5_g1003 = clamp( _Amount , 8.0 , 1000.0 );
				float2 _Globaltiling = float2(1,1);
				float4 XProjectionAmount23_g1003 = ( appendResult16_g1003 * ( clampResult5_g1003 * ( _Globaltiling.y * _TilingHorizontal ) ) );
				float RandomPosition25_g1003 = _RandomPosition;
				float simplePerlin2D46_g1003 = snoise( ( floor( XProjectionAmount23_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*RandomPosition25_g1003 );
				simplePerlin2D46_g1003 = simplePerlin2D46_g1003*0.5 + 0.5;
				float temp_output_240_0_g1003 = (1.0 + (_GrowMask - 1.0) * (50.0 - 1.0) / (10.0 - 1.0));
				float temp_output_83_0_g1003 = round( ( pow( simplePerlin2D46_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float RF_RandomMin66_g1003 = 0.05;
				float RF_Random65_g1003 = (0.05 + (_RandomMax - 0.1) * (1.0 - 0.05) / (1.0 - 0.1));
				float2 appendResult88_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult99_g1003 = (float4(temp_output_83_0_g1003 , appendResult88_g1003 , 0.0));
				float4 break104_g1003 = appendResult99_g1003;
				float lerpResult117_g1003 = lerp( break104_g1003.y , break104_g1003.z , pow( simplePerlin2D46_g1003 , 2.0 ));
				float RF_Timespeed77_g1003 = _DripLineSpeed;
				float mulTime105_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 XProjection98_g1003 = appendResult16_g1003;
				float3 temp_output_106_0_g1003 = ( float3(0,-1,0) * _TilingVertical );
				float4 tex2DNode147_g1003 = tex2D( _GradientTexRain1, ( ( lerpResult117_g1003 * ( mulTime105_g1003 + pow( simplePerlin2D46_g1003 , 2.0 ) ) ) + ( XProjection98_g1003 * float4( temp_output_106_0_g1003 , 0.0 ) ) ).xy );
				float4 temp_cast_16 = (tex2DNode147_g1003.r).xxxx;
				float4 temp_cast_17 = (MaskWorldX585).xxxx;
				float4 InputMaskWorldX199_g1003 = temp_cast_17;
				float4 temp_output_168_0_g1003 = ( CalculateContrast(clampResult243_g1003,temp_cast_16) * InputMaskWorldX199_g1003 * clampResult243_g1003 );
				float4 clampResult173_g1003 = clamp( temp_output_168_0_g1003 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float clampResult156_g1003 = clamp( (-1.0 + (_TrailDropContrast - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , -1.0 , 100.0 );
				float mulTime40_g1003 = _TimeParameters.x * _TrailDropSpeed;
				float time48_g1003 = mulTime40_g1003;
				float2 voronoiSmoothId48_g1003 = 0;
				float2 texCoord41_g1003 = packedInput.ase_texcoord.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords48_g1003 = texCoord41_g1003 * _TrailDropTiling;
				float2 id48_g1003 = 0;
				float2 uv48_g1003 = 0;
				float fade48_g1003 = 0.5;
				float voroi48_g1003 = 0;
				float rest48_g1003 = 0;
				for( int it48_g1003 = 0; it48_g1003 <2; it48_g1003++ ){
				voroi48_g1003 += fade48_g1003 * voronoi48_g1003( coords48_g1003, time48_g1003, id48_g1003, uv48_g1003, 0,voronoiSmoothId48_g1003 );
				rest48_g1003 += fade48_g1003;
				coords48_g1003 *= 2;
				fade48_g1003 *= 0.5;
				}//Voronoi48_g1003
				voroi48_g1003 /= rest48_g1003;
				float temp_output_52_0_g1003 = ( voroi48_g1003 * (2.0 + (_TrailDropSize - 0.0) * (4.0 - 2.0) / (1.0 - 0.0)) );
				float temp_output_72_0_g1003 = ( step( voroi48_g1003 , temp_output_52_0_g1003 ) * ( 1.0 - temp_output_52_0_g1003 ) );
				float blendOpSrc112_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				float blendOpDest112_g1003 = ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch129_g1003 = ( blendOpSrc112_g1003 + blendOpDest112_g1003 );
				#else
				float staticSwitch129_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				#endif
				float4 XTrailOfDrop161_g1003 = saturate( ( staticSwitch129_g1003 * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpSrc177_g1003 = clampResult173_g1003;
				float4 blendOpDest177_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode147_g1003.b * InputMaskWorldX199_g1003 )) * XTrailOfDrop161_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float4 staticSwitch235_g1003 = ( blendOpSrc177_g1003 + blendOpDest177_g1003 );
				#else
				float4 staticSwitch235_g1003 = clampResult173_g1003;
				#endif
				float4 appendResult17_g1003 = (float4(worldToObj249_g1003.x , worldToObj249_g1003.y , 0.0 , 0.0));
				float4 ZProjection97_g1003 = appendResult17_g1003;
				float4 ZProjectionAmount22_g1003 = ( appendResult17_g1003 * ( ( _Globaltiling.y * _TilingHorizontal ) * clampResult5_g1003 ) );
				float simplePerlin2D49_g1003 = snoise( ( floor( ZProjectionAmount22_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*( RandomPosition25_g1003 + 0.5 ) );
				simplePerlin2D49_g1003 = simplePerlin2D49_g1003*0.5 + 0.5;
				float temp_output_80_0_g1003 = round( ( pow( simplePerlin2D49_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float2 appendResult85_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult101_g1003 = (float4(temp_output_80_0_g1003 , appendResult85_g1003 , 0.0));
				float4 break110_g1003 = appendResult101_g1003;
				float lerpResult121_g1003 = lerp( break110_g1003.y , break110_g1003.z , pow( simplePerlin2D49_g1003 , 2.0 ));
				float mulTime109_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 tex2DNode152_g1003 = tex2D( _GradientTexRain1, ( ( float4( temp_output_106_0_g1003 , 0.0 ) * ZProjection97_g1003 ) + ( lerpResult121_g1003 * ( mulTime109_g1003 + pow( simplePerlin2D49_g1003 , 2.0 ) ) ) ).xy );
				float4 temp_cast_28 = (tex2DNode152_g1003.r).xxxx;
				float4 temp_cast_29 = (MaskWorldZ583).xxxx;
				float4 InputMaskWorldZ205_g1003 = temp_cast_29;
				float4 clampResult175_g1003 = clamp( ( CalculateContrast(clampResult243_g1003,temp_cast_28) * InputMaskWorldZ205_g1003 * clampResult243_g1003 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float blendOpSrc118_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				float blendOpDest118_g1003 = ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch124_g1003 = ( blendOpSrc118_g1003 + blendOpDest118_g1003 );
				#else
				float staticSwitch124_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				#endif
				float4 ZTrailOfDrop157_g1003 = saturate( ( staticSwitch124_g1003 * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc179_g1003 = clampResult175_g1003;
				float4 blendOpDest179_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode152_g1003.b * InputMaskWorldZ205_g1003 )) * ZTrailOfDrop157_g1003 );
				float4 blendOpSrc186_g1003 = staticSwitch235_g1003;
				float4 blendOpDest186_g1003 = ( saturate( ( blendOpSrc179_g1003 + blendOpDest179_g1003 ) ));
				float4 blendOpSrc185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpDest185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc188_g1003 = InputMaskWorldX199_g1003;
				float4 blendOpDest188_g1003 = InputMaskWorldZ205_g1003;
				float4 temp_cast_39 = (MaskWorldY589).xxxx;
				float4 InputMaskWorldY207_g1003 = temp_cast_39;
				float4 blendOpSrc190_g1003 = ( saturate( max( blendOpSrc188_g1003, blendOpDest188_g1003 ) ));
				float4 blendOpDest190_g1003 = ( InputMaskWorldY207_g1003 * 2.0 );
				float4 clampResult192_g1003 = clamp( ( ( ( saturate( ( blendOpSrc186_g1003 + blendOpDest186_g1003 ) )) * ( saturate( max( blendOpSrc185_g1003, blendOpDest185_g1003 ) )) ) * ( saturate( max( blendOpSrc190_g1003, blendOpDest190_g1003 ) )) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 blendOpSrc226_g1003 = ( temp_output_83_0_g1003 * InputMaskWorldX199_g1003 );
				float4 blendOpDest226_g1003 = ( temp_output_80_0_g1003 * InputMaskWorldZ205_g1003 );
				float4 temp_output_226_0_g1003 = ( saturate( max( blendOpSrc226_g1003, blendOpDest226_g1003 ) ));
				float4 MaskRandom231_g1003 = ( temp_output_226_0_g1003 + temp_output_226_0_g1003 );
				float4 RainDropsFalling766 = (( _EnableRandomMask )?( ( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) * MaskRandom231_g1003 ) ):( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) ));
				float4 blendOpSrc772 = temp_cast_8;
				float4 blendOpDest772 = RainDropsFalling766;
				float height107_g1004 = ( saturate( max( blendOpSrc772, blendOpDest772 ) )).r;
				float scale107_g1004 = ( _NormalDrop / 10.0 );
				float3 localPerturbNormal107_g1004 = PerturbNormal107_g1004( surf_pos107_g1004 , surf_norm107_g1004 , height107_g1004 , scale107_g1004 );
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g1004 = mul( ase_worldToTangent, localPerturbNormal107_g1004);
				float2 uv_BumpMap = packedInput.ase_texcoord.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1006 = uv_BumpMap;
				float2 appendResult14_g1006 = (float2(( break26_g1006.x * GlobalTilingX11 ) , ( break26_g1006.y * GlobalTilingY8 )));
				float2 appendResult13_g1006 = (float2(( break26_g1006.x + GlobalOffsetX10 ) , ( break26_g1006.y + GlobalOffsetY9 )));
				float3 unpack4_g1005 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1006 + appendResult13_g1006 ) + Parallaxe494 ) ), _BumpScale );
				unpack4_g1005.z = lerp( 1, unpack4_g1005.z, saturate(_BumpScale) );
				float3 Normal27 = BlendNormal( worldToTangentDir42_g1004 , unpack4_g1005 );
				
				float Metallic41 = ( tex2DNode3_g621.r * _Metallic );
				
				float2 uv_EmissionMap = packedInput.ase_texcoord.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float2 break26_g1009 = uv_EmissionMap;
				float2 appendResult14_g1009 = (float2(( break26_g1009.x * GlobalTilingX11 ) , ( break26_g1009.y * GlobalTilingY8 )));
				float2 appendResult13_g1009 = (float2(( break26_g1009.x + GlobalOffsetX10 ) , ( break26_g1009.y + GlobalOffsetY9 )));
				float3 worldRefl28_g1096 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, Normal27 ), dot( tanToWorld1, Normal27 ), dot( tanToWorld2, Normal27 ) ) ) );
				float4 texCUBENode27_g1096 = texCUBElod( _Cubemap, float4( worldRefl28_g1096, _BlurReflection) );
				float clampResult58_g1096 = clamp( ( _ReflectionIntensity * 1000.0 ) , 0.0 , 100000.0 );
				float4 temp_cast_43 = (1.0).xxxx;
				float4 temp_cast_44 = (1.0).xxxx;
				float4 temp_cast_45 = (RainDrops606).xxxx;
				float4 blendOpSrc780 = RainDropsFalling766;
				float4 blendOpDest780 = temp_cast_45;
				float4 temp_cast_46 = (RainDrops606).xxxx;
				#if defined(_REFLECTED_ALL)
				float4 staticSwitch963 = temp_cast_43;
				#elif defined(_REFLECTED_RAINDROPS)
				float4 staticSwitch963 = ( saturate( max( blendOpSrc780, blendOpDest780 ) ));
				#elif defined(_REFLECTED_DROPONLY)
				float4 staticSwitch963 = temp_cast_46;
				#elif defined(_REFLECTED_DRIPLINEONLY)
				float4 staticSwitch963 = RainDropsFalling766;
				#else
				float4 staticSwitch963 = temp_cast_43;
				#endif
				float4 Emission110 = ( ( _EmissionColor * tex2D( _EmissionMap, ( ( appendResult14_g1009 + appendResult13_g1009 ) + Parallaxe494 ) ) * _EmissionIntensity ) + ( ( texCUBENode27_g1096 * ( texCUBENode27_g1096.a * clampResult58_g1096 ) * _ColorCubemap1 ) * staticSwitch963 ) );
				
				float temp_output_1_0_g621 = ( tex2DNode3_g621.a * _Glossiness );
				float4 temp_cast_50 = (RainDrops606).xxxx;
				float4 blendOpSrc707 = temp_cast_50;
				float4 blendOpDest707 = RainDropsFalling766;
				float4 temp_output_609_0 = ( ( _SmoothnessDrop * 5.0 ) * ( saturate( max( blendOpSrc707, blendOpDest707 ) )) );
				float4 temp_cast_51 = (temp_output_1_0_g621).xxxx;
				float4 blendOpSrc613 = temp_cast_51;
				float4 blendOpDest613 = temp_output_609_0;
				#if defined(_BLENDINGMODEDROPS_ADDITIVE)
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#elif defined(_BLENDINGMODEDROPS_LIGHTEN)
				float4 staticSwitch612 = ( saturate( max( blendOpSrc613, blendOpDest613 ) ));
				#else
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#endif
				float4 Smoothness40 = staticSwitch612;
				
				float blendOpSrc34_g621 = tex2DNode3_g621.g;
				float blendOpDest34_g621 = ( 1.0 - _AoIntensity );
				float AOG565 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g621 ) * ( 1.0 - blendOpDest34_g621 ) ) ));
				float AmbientOcclusion94 = AOG565;
				
				surfaceDescription.Albedo = Albedo26.rgb;
				surfaceDescription.Normal = Normal27;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Metallic41;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Emission110.rgb;
				surfaceDescription.Smoothness = Smoothness40.r;
				surfaceDescription.Occlusion = AmbientOcclusion94;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4(0.0, 0.0, 0.0, 1.0);
				if (unity_MetaFragmentControl.x)
				{
					res.rgb = clamp(pow(abs(lightTransportData.diffuseColor), saturate(unity_OneOverOutputBoost)), 0, unity_MaxOutputValue);
				}

				if (unity_MetaFragmentControl.y)
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS
			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			int _ObjectId;
			int _PassValue;

			
			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _DISABLE_DECALS

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _GradientTexRain1;
			sampler2D _MainTex;
			sampler2D _MetallicGlossMapMAHS;
			sampler2D _BumpMap;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local _ENABLETRAILOFDROP_ON
			#pragma shader_feature_local _BLENDINGMODEDROPS_ADDITIVE _BLENDINGMODEDROPS_LIGHTEN


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

					float2 voronoihash58_g990( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g990( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g990( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash877( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi877( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash877( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash48_g1003( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi48_g1003( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash48_g1003( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 PerturbNormal107_g1004( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 surf_pos107_g1004 = ase_worldPos;
				float3 surf_norm107_g1004 = normalWS;
				float2 temp_cast_0 = (_SplashSpeed).xx;
				float time58_g990 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g990 = 0;
				float2 texCoord55_g990 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_577_0 = ( _Noisescale * 100.0 );
				float clampResult962 = clamp( temp_output_577_0 , 0.0 , 10000.0 );
				float time877 = 0.0;
				float2 voronoiSmoothId877 = 0;
				float2 texCoord576 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords877 = texCoord576 * clampResult962;
				float2 id877 = 0;
				float2 uv877 = 0;
				float fade877 = 0.5;
				float voroi877 = 0;
				float rest877 = 0;
				for( int it877 = 0; it877 <3; it877++ ){
				voroi877 += fade877 * voronoi877( coords877, time877, id877, uv877, 0,voronoiSmoothId877 );
				rest877 += fade877;
				coords877 *= 2;
				fade877 *= 0.5;
				}//Voronoi877
				voroi877 /= rest877;
				float Noise588 = ( voroi877 * 0.005 );
				float4 temp_cast_2 = (Noise588).xxxx;
				float2 coords58_g990 = ( float4( texCoord55_g990, 0.0 , 0.0 ) + temp_cast_2 ).xy * _Tiling;
				float2 id58_g990 = 0;
				float2 uv58_g990 = 0;
				float fade58_g990 = 0.5;
				float voroi58_g990 = 0;
				float rest58_g990 = 0;
				for( int it58_g990 = 0; it58_g990 <2; it58_g990++ ){
				voroi58_g990 += fade58_g990 * voronoi58_g990( coords58_g990, time58_g990, id58_g990, uv58_g990, 0,voronoiSmoothId58_g990 );
				rest58_g990 += fade58_g990;
				coords58_g990 *= 2;
				fade58_g990 *= 0.5;
				}//Voronoi58_g990
				voroi58_g990 /= rest58_g990;
				float2 myVarName60_g990 = id58_g990;
				float2 panner63_g990 = ( 1.0 * _Time.y * temp_cast_0 + ( step( voroi58_g990 , 0.1 ) * myVarName60_g990 ));
				float temp_output_79_0_g990 = (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0));
				float temp_output_120_0_g990 = saturate( ( step( voroi58_g990 , temp_output_79_0_g990 ) * ( 1.0 - ( voroi58_g990 * temp_output_79_0_g990 * (1.0 + (_DotFalloff - 0.0) * (500.0 - 1.0) / (1.0 - 0.0)) ) ) ) );
				float MaskWorldY589 = normalWS.y;
				float temp_output_667_0 = ( MaskWorldY589 * _DropTopIntensity );
				float2 uv_MainTex = packedInput.ase_texcoord3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break26_g818 = uv_MainTex;
				float GlobalTilingX11 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float GlobalTilingY8 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g818 = (float2(( break26_g818.x * GlobalTilingX11 ) , ( break26_g818.y * GlobalTilingY8 )));
				float GlobalOffsetX10 = _GlobalXYTilingXYZWOffsetXY.z;
				float GlobalOffsetY9 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g818 = (float2(( break26_g818.x + GlobalOffsetX10 ) , ( break26_g818.y + GlobalOffsetY9 )));
				float2 uv_MetallicGlossMapMAHS = packedInput.ase_texcoord3.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g622 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g622 = (float2(( break26_g622.x * GlobalTilingX11 ) , ( break26_g622.y * GlobalTilingY8 )));
				float2 appendResult13_g622 = (float2(( break26_g622.x + GlobalOffsetX10 ) , ( break26_g622.y + GlobalOffsetY9 )));
				float4 tex2DNode3_g621 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g622 + appendResult13_g622 ) + float2( 0,0 ) ) );
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 ase_tanViewDir =  tanToWorld0 * V.x + tanToWorld1 * V.y  + tanToWorld2 * V.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g621 = ParallaxOffset( tex2DNode3_g621.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g621 = (((isFrontFace>0)?(paralaxOffset38_g621):(0.0)));
				float2 Parallaxe494 = switchResult37_g621;
				float4 tex2DNode7_g817 = tex2D( _MainTex, ( ( appendResult14_g818 + appendResult13_g818 ) + Parallaxe494 ) );
				float BaseColorAlpha46 = (( _InvertABaseColor )?( ( 1.0 - tex2DNode7_g817.a ) ):( tex2DNode7_g817.a ));
				float3 temp_cast_4 = (0.5).xxx;
				float3 break580 = ( abs( normalWS ) - temp_cast_4 );
				float MaskWorldX585 = break580.x;
				float MaskWorldZ583 = break580.z;
				float blendOpSrc598 = MaskWorldX585;
				float blendOpDest598 = MaskWorldZ583;
				float temp_output_599_0 = ( ( saturate( max( blendOpSrc598, blendOpDest598 ) )) * _DropSideIntensity );
				float blendOpSrc603 = (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 ));
				float blendOpDest603 = (( _UseBaseColorAlphaMaskSide )?( ( temp_output_599_0 * BaseColorAlpha46 ) ):( temp_output_599_0 ));
				float clampResult605 = clamp( ( ( saturate( ( tex2D( _GradientTexRain1, panner63_g990 ).g * temp_output_120_0_g990 ) ) * _Intensity ) * (( _EnableDropSide )?( ( saturate( max( blendOpSrc603, blendOpDest603 ) )) ):( (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 )) )) ) , 0.0 , 1.0 );
				float RainDrops606 = clampResult605;
				float4 temp_cast_5 = (RainDrops606).xxxx;
				float clampResult243_g1003 = clamp( _DripLineContrast , 0.0 , 100.0 );
				float3 worldToObj249_g1003 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(( mul( UNITY_MATRIX_M, float4( ase_worldPos , 0.0 ) ).xyz + float3( float2( 0.5,0.5 ) ,  0.0 ) )), 1 ) ).xyz;
				float4 appendResult16_g1003 = (float4(worldToObj249_g1003.z , worldToObj249_g1003.y , 0.0 , 0.0));
				float clampResult5_g1003 = clamp( _Amount , 8.0 , 1000.0 );
				float2 _Globaltiling = float2(1,1);
				float4 XProjectionAmount23_g1003 = ( appendResult16_g1003 * ( clampResult5_g1003 * ( _Globaltiling.y * _TilingHorizontal ) ) );
				float RandomPosition25_g1003 = _RandomPosition;
				float simplePerlin2D46_g1003 = snoise( ( floor( XProjectionAmount23_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*RandomPosition25_g1003 );
				simplePerlin2D46_g1003 = simplePerlin2D46_g1003*0.5 + 0.5;
				float temp_output_240_0_g1003 = (1.0 + (_GrowMask - 1.0) * (50.0 - 1.0) / (10.0 - 1.0));
				float temp_output_83_0_g1003 = round( ( pow( simplePerlin2D46_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float RF_RandomMin66_g1003 = 0.05;
				float RF_Random65_g1003 = (0.05 + (_RandomMax - 0.1) * (1.0 - 0.05) / (1.0 - 0.1));
				float2 appendResult88_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult99_g1003 = (float4(temp_output_83_0_g1003 , appendResult88_g1003 , 0.0));
				float4 break104_g1003 = appendResult99_g1003;
				float lerpResult117_g1003 = lerp( break104_g1003.y , break104_g1003.z , pow( simplePerlin2D46_g1003 , 2.0 ));
				float RF_Timespeed77_g1003 = _DripLineSpeed;
				float mulTime105_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 XProjection98_g1003 = appendResult16_g1003;
				float3 temp_output_106_0_g1003 = ( float3(0,-1,0) * _TilingVertical );
				float4 tex2DNode147_g1003 = tex2D( _GradientTexRain1, ( ( lerpResult117_g1003 * ( mulTime105_g1003 + pow( simplePerlin2D46_g1003 , 2.0 ) ) ) + ( XProjection98_g1003 * float4( temp_output_106_0_g1003 , 0.0 ) ) ).xy );
				float4 temp_cast_13 = (tex2DNode147_g1003.r).xxxx;
				float4 temp_cast_14 = (MaskWorldX585).xxxx;
				float4 InputMaskWorldX199_g1003 = temp_cast_14;
				float4 temp_output_168_0_g1003 = ( CalculateContrast(clampResult243_g1003,temp_cast_13) * InputMaskWorldX199_g1003 * clampResult243_g1003 );
				float4 clampResult173_g1003 = clamp( temp_output_168_0_g1003 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float clampResult156_g1003 = clamp( (-1.0 + (_TrailDropContrast - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , -1.0 , 100.0 );
				float mulTime40_g1003 = _TimeParameters.x * _TrailDropSpeed;
				float time48_g1003 = mulTime40_g1003;
				float2 voronoiSmoothId48_g1003 = 0;
				float2 texCoord41_g1003 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords48_g1003 = texCoord41_g1003 * _TrailDropTiling;
				float2 id48_g1003 = 0;
				float2 uv48_g1003 = 0;
				float fade48_g1003 = 0.5;
				float voroi48_g1003 = 0;
				float rest48_g1003 = 0;
				for( int it48_g1003 = 0; it48_g1003 <2; it48_g1003++ ){
				voroi48_g1003 += fade48_g1003 * voronoi48_g1003( coords48_g1003, time48_g1003, id48_g1003, uv48_g1003, 0,voronoiSmoothId48_g1003 );
				rest48_g1003 += fade48_g1003;
				coords48_g1003 *= 2;
				fade48_g1003 *= 0.5;
				}//Voronoi48_g1003
				voroi48_g1003 /= rest48_g1003;
				float temp_output_52_0_g1003 = ( voroi48_g1003 * (2.0 + (_TrailDropSize - 0.0) * (4.0 - 2.0) / (1.0 - 0.0)) );
				float temp_output_72_0_g1003 = ( step( voroi48_g1003 , temp_output_52_0_g1003 ) * ( 1.0 - temp_output_52_0_g1003 ) );
				float blendOpSrc112_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				float blendOpDest112_g1003 = ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch129_g1003 = ( blendOpSrc112_g1003 + blendOpDest112_g1003 );
				#else
				float staticSwitch129_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				#endif
				float4 XTrailOfDrop161_g1003 = saturate( ( staticSwitch129_g1003 * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpSrc177_g1003 = clampResult173_g1003;
				float4 blendOpDest177_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode147_g1003.b * InputMaskWorldX199_g1003 )) * XTrailOfDrop161_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float4 staticSwitch235_g1003 = ( blendOpSrc177_g1003 + blendOpDest177_g1003 );
				#else
				float4 staticSwitch235_g1003 = clampResult173_g1003;
				#endif
				float4 appendResult17_g1003 = (float4(worldToObj249_g1003.x , worldToObj249_g1003.y , 0.0 , 0.0));
				float4 ZProjection97_g1003 = appendResult17_g1003;
				float4 ZProjectionAmount22_g1003 = ( appendResult17_g1003 * ( ( _Globaltiling.y * _TilingHorizontal ) * clampResult5_g1003 ) );
				float simplePerlin2D49_g1003 = snoise( ( floor( ZProjectionAmount22_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*( RandomPosition25_g1003 + 0.5 ) );
				simplePerlin2D49_g1003 = simplePerlin2D49_g1003*0.5 + 0.5;
				float temp_output_80_0_g1003 = round( ( pow( simplePerlin2D49_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float2 appendResult85_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult101_g1003 = (float4(temp_output_80_0_g1003 , appendResult85_g1003 , 0.0));
				float4 break110_g1003 = appendResult101_g1003;
				float lerpResult121_g1003 = lerp( break110_g1003.y , break110_g1003.z , pow( simplePerlin2D49_g1003 , 2.0 ));
				float mulTime109_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 tex2DNode152_g1003 = tex2D( _GradientTexRain1, ( ( float4( temp_output_106_0_g1003 , 0.0 ) * ZProjection97_g1003 ) + ( lerpResult121_g1003 * ( mulTime109_g1003 + pow( simplePerlin2D49_g1003 , 2.0 ) ) ) ).xy );
				float4 temp_cast_25 = (tex2DNode152_g1003.r).xxxx;
				float4 temp_cast_26 = (MaskWorldZ583).xxxx;
				float4 InputMaskWorldZ205_g1003 = temp_cast_26;
				float4 clampResult175_g1003 = clamp( ( CalculateContrast(clampResult243_g1003,temp_cast_25) * InputMaskWorldZ205_g1003 * clampResult243_g1003 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float blendOpSrc118_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				float blendOpDest118_g1003 = ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch124_g1003 = ( blendOpSrc118_g1003 + blendOpDest118_g1003 );
				#else
				float staticSwitch124_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				#endif
				float4 ZTrailOfDrop157_g1003 = saturate( ( staticSwitch124_g1003 * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc179_g1003 = clampResult175_g1003;
				float4 blendOpDest179_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode152_g1003.b * InputMaskWorldZ205_g1003 )) * ZTrailOfDrop157_g1003 );
				float4 blendOpSrc186_g1003 = staticSwitch235_g1003;
				float4 blendOpDest186_g1003 = ( saturate( ( blendOpSrc179_g1003 + blendOpDest179_g1003 ) ));
				float4 blendOpSrc185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpDest185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc188_g1003 = InputMaskWorldX199_g1003;
				float4 blendOpDest188_g1003 = InputMaskWorldZ205_g1003;
				float4 temp_cast_36 = (MaskWorldY589).xxxx;
				float4 InputMaskWorldY207_g1003 = temp_cast_36;
				float4 blendOpSrc190_g1003 = ( saturate( max( blendOpSrc188_g1003, blendOpDest188_g1003 ) ));
				float4 blendOpDest190_g1003 = ( InputMaskWorldY207_g1003 * 2.0 );
				float4 clampResult192_g1003 = clamp( ( ( ( saturate( ( blendOpSrc186_g1003 + blendOpDest186_g1003 ) )) * ( saturate( max( blendOpSrc185_g1003, blendOpDest185_g1003 ) )) ) * ( saturate( max( blendOpSrc190_g1003, blendOpDest190_g1003 ) )) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 blendOpSrc226_g1003 = ( temp_output_83_0_g1003 * InputMaskWorldX199_g1003 );
				float4 blendOpDest226_g1003 = ( temp_output_80_0_g1003 * InputMaskWorldZ205_g1003 );
				float4 temp_output_226_0_g1003 = ( saturate( max( blendOpSrc226_g1003, blendOpDest226_g1003 ) ));
				float4 MaskRandom231_g1003 = ( temp_output_226_0_g1003 + temp_output_226_0_g1003 );
				float4 RainDropsFalling766 = (( _EnableRandomMask )?( ( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) * MaskRandom231_g1003 ) ):( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) ));
				float4 blendOpSrc772 = temp_cast_5;
				float4 blendOpDest772 = RainDropsFalling766;
				float height107_g1004 = ( saturate( max( blendOpSrc772, blendOpDest772 ) )).r;
				float scale107_g1004 = ( _NormalDrop / 10.0 );
				float3 localPerturbNormal107_g1004 = PerturbNormal107_g1004( surf_pos107_g1004 , surf_norm107_g1004 , height107_g1004 , scale107_g1004 );
				float3x3 ase_worldToTangent = float3x3(tangentWS.xyz,ase_worldBitangent,normalWS);
				float3 worldToTangentDir42_g1004 = mul( ase_worldToTangent, localPerturbNormal107_g1004);
				float2 uv_BumpMap = packedInput.ase_texcoord3.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1006 = uv_BumpMap;
				float2 appendResult14_g1006 = (float2(( break26_g1006.x * GlobalTilingX11 ) , ( break26_g1006.y * GlobalTilingY8 )));
				float2 appendResult13_g1006 = (float2(( break26_g1006.x + GlobalOffsetX10 ) , ( break26_g1006.y + GlobalOffsetY9 )));
				float3 unpack4_g1005 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1006 + appendResult13_g1006 ) + Parallaxe494 ) ), _BumpScale );
				unpack4_g1005.z = lerp( 1, unpack4_g1005.z, saturate(_BumpScale) );
				float3 Normal27 = BlendNormal( worldToTangentDir42_g1004 , unpack4_g1005 );
				
				float temp_output_1_0_g621 = ( tex2DNode3_g621.a * _Glossiness );
				float4 temp_cast_40 = (RainDrops606).xxxx;
				float4 blendOpSrc707 = temp_cast_40;
				float4 blendOpDest707 = RainDropsFalling766;
				float4 temp_output_609_0 = ( ( _SmoothnessDrop * 5.0 ) * ( saturate( max( blendOpSrc707, blendOpDest707 ) )) );
				float4 temp_cast_41 = (temp_output_1_0_g621).xxxx;
				float4 blendOpSrc613 = temp_cast_41;
				float4 blendOpDest613 = temp_output_609_0;
				#if defined(_BLENDINGMODEDROPS_ADDITIVE)
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#elif defined(_BLENDINGMODEDROPS_LIGHTEN)
				float4 staticSwitch612 = ( saturate( max( blendOpSrc613, blendOpDest613 ) ));
				#else
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#endif
				float4 Smoothness40 = staticSwitch612;
				
				surfaceDescription.Normal = Normal27;
				surfaceDescription.Smoothness = Smoothness40.r;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _GradientTexRain1;
			sampler2D _MainTex;
			sampler2D _MetallicGlossMapMAHS;
			sampler2D _BumpMap;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _ENABLETRAILOFDROP_ON
			#pragma shader_feature_local _BLENDINGMODEDROPS_ADDITIVE _BLENDINGMODEDROPS_LIGHTEN


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


					float2 voronoihash58_g990( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g990( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g990( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash877( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi877( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash877( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash48_g1003( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi48_g1003( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash48_g1003( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 PerturbNormal107_g1004( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldTangent;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					// We need the depth color as SV_Target0 for alpha to coverage
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					// When no MSAA, the motion vector is always the first buffer
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 surf_pos107_g1004 = ase_worldPos;
				float3 ase_worldNormal = packedInput.ase_texcoord4.xyz;
				float3 surf_norm107_g1004 = ase_worldNormal;
				float2 temp_cast_0 = (_SplashSpeed).xx;
				float time58_g990 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g990 = 0;
				float2 texCoord55_g990 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_577_0 = ( _Noisescale * 100.0 );
				float clampResult962 = clamp( temp_output_577_0 , 0.0 , 10000.0 );
				float time877 = 0.0;
				float2 voronoiSmoothId877 = 0;
				float2 texCoord576 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords877 = texCoord576 * clampResult962;
				float2 id877 = 0;
				float2 uv877 = 0;
				float fade877 = 0.5;
				float voroi877 = 0;
				float rest877 = 0;
				for( int it877 = 0; it877 <3; it877++ ){
				voroi877 += fade877 * voronoi877( coords877, time877, id877, uv877, 0,voronoiSmoothId877 );
				rest877 += fade877;
				coords877 *= 2;
				fade877 *= 0.5;
				}//Voronoi877
				voroi877 /= rest877;
				float Noise588 = ( voroi877 * 0.005 );
				float4 temp_cast_2 = (Noise588).xxxx;
				float2 coords58_g990 = ( float4( texCoord55_g990, 0.0 , 0.0 ) + temp_cast_2 ).xy * _Tiling;
				float2 id58_g990 = 0;
				float2 uv58_g990 = 0;
				float fade58_g990 = 0.5;
				float voroi58_g990 = 0;
				float rest58_g990 = 0;
				for( int it58_g990 = 0; it58_g990 <2; it58_g990++ ){
				voroi58_g990 += fade58_g990 * voronoi58_g990( coords58_g990, time58_g990, id58_g990, uv58_g990, 0,voronoiSmoothId58_g990 );
				rest58_g990 += fade58_g990;
				coords58_g990 *= 2;
				fade58_g990 *= 0.5;
				}//Voronoi58_g990
				voroi58_g990 /= rest58_g990;
				float2 myVarName60_g990 = id58_g990;
				float2 panner63_g990 = ( 1.0 * _Time.y * temp_cast_0 + ( step( voroi58_g990 , 0.1 ) * myVarName60_g990 ));
				float temp_output_79_0_g990 = (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0));
				float temp_output_120_0_g990 = saturate( ( step( voroi58_g990 , temp_output_79_0_g990 ) * ( 1.0 - ( voroi58_g990 * temp_output_79_0_g990 * (1.0 + (_DotFalloff - 0.0) * (500.0 - 1.0) / (1.0 - 0.0)) ) ) ) );
				float MaskWorldY589 = ase_worldNormal.y;
				float temp_output_667_0 = ( MaskWorldY589 * _DropTopIntensity );
				float2 uv_MainTex = packedInput.ase_texcoord5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break26_g818 = uv_MainTex;
				float GlobalTilingX11 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float GlobalTilingY8 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g818 = (float2(( break26_g818.x * GlobalTilingX11 ) , ( break26_g818.y * GlobalTilingY8 )));
				float GlobalOffsetX10 = _GlobalXYTilingXYZWOffsetXY.z;
				float GlobalOffsetY9 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g818 = (float2(( break26_g818.x + GlobalOffsetX10 ) , ( break26_g818.y + GlobalOffsetY9 )));
				float2 uv_MetallicGlossMapMAHS = packedInput.ase_texcoord5.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g622 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g622 = (float2(( break26_g622.x * GlobalTilingX11 ) , ( break26_g622.y * GlobalTilingY8 )));
				float2 appendResult13_g622 = (float2(( break26_g622.x + GlobalOffsetX10 ) , ( break26_g622.y + GlobalOffsetY9 )));
				float4 tex2DNode3_g621 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g622 + appendResult13_g622 ) + float2( 0,0 ) ) );
				float3 ase_worldTangent = packedInput.ase_texcoord6.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * V.x + tanToWorld1 * V.y  + tanToWorld2 * V.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g621 = ParallaxOffset( tex2DNode3_g621.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g621 = (((ase_vface>0)?(paralaxOffset38_g621):(0.0)));
				float2 Parallaxe494 = switchResult37_g621;
				float4 tex2DNode7_g817 = tex2D( _MainTex, ( ( appendResult14_g818 + appendResult13_g818 ) + Parallaxe494 ) );
				float BaseColorAlpha46 = (( _InvertABaseColor )?( ( 1.0 - tex2DNode7_g817.a ) ):( tex2DNode7_g817.a ));
				float3 temp_cast_4 = (0.5).xxx;
				float3 break580 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float MaskWorldX585 = break580.x;
				float MaskWorldZ583 = break580.z;
				float blendOpSrc598 = MaskWorldX585;
				float blendOpDest598 = MaskWorldZ583;
				float temp_output_599_0 = ( ( saturate( max( blendOpSrc598, blendOpDest598 ) )) * _DropSideIntensity );
				float blendOpSrc603 = (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 ));
				float blendOpDest603 = (( _UseBaseColorAlphaMaskSide )?( ( temp_output_599_0 * BaseColorAlpha46 ) ):( temp_output_599_0 ));
				float clampResult605 = clamp( ( ( saturate( ( tex2D( _GradientTexRain1, panner63_g990 ).g * temp_output_120_0_g990 ) ) * _Intensity ) * (( _EnableDropSide )?( ( saturate( max( blendOpSrc603, blendOpDest603 ) )) ):( (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 )) )) ) , 0.0 , 1.0 );
				float RainDrops606 = clampResult605;
				float4 temp_cast_5 = (RainDrops606).xxxx;
				float clampResult243_g1003 = clamp( _DripLineContrast , 0.0 , 100.0 );
				float3 worldToObj249_g1003 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(( mul( UNITY_MATRIX_M, float4( ase_worldPos , 0.0 ) ).xyz + float3( float2( 0.5,0.5 ) ,  0.0 ) )), 1 ) ).xyz;
				float4 appendResult16_g1003 = (float4(worldToObj249_g1003.z , worldToObj249_g1003.y , 0.0 , 0.0));
				float clampResult5_g1003 = clamp( _Amount , 8.0 , 1000.0 );
				float2 _Globaltiling = float2(1,1);
				float4 XProjectionAmount23_g1003 = ( appendResult16_g1003 * ( clampResult5_g1003 * ( _Globaltiling.y * _TilingHorizontal ) ) );
				float RandomPosition25_g1003 = _RandomPosition;
				float simplePerlin2D46_g1003 = snoise( ( floor( XProjectionAmount23_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*RandomPosition25_g1003 );
				simplePerlin2D46_g1003 = simplePerlin2D46_g1003*0.5 + 0.5;
				float temp_output_240_0_g1003 = (1.0 + (_GrowMask - 1.0) * (50.0 - 1.0) / (10.0 - 1.0));
				float temp_output_83_0_g1003 = round( ( pow( simplePerlin2D46_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float RF_RandomMin66_g1003 = 0.05;
				float RF_Random65_g1003 = (0.05 + (_RandomMax - 0.1) * (1.0 - 0.05) / (1.0 - 0.1));
				float2 appendResult88_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult99_g1003 = (float4(temp_output_83_0_g1003 , appendResult88_g1003 , 0.0));
				float4 break104_g1003 = appendResult99_g1003;
				float lerpResult117_g1003 = lerp( break104_g1003.y , break104_g1003.z , pow( simplePerlin2D46_g1003 , 2.0 ));
				float RF_Timespeed77_g1003 = _DripLineSpeed;
				float mulTime105_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 XProjection98_g1003 = appendResult16_g1003;
				float3 temp_output_106_0_g1003 = ( float3(0,-1,0) * _TilingVertical );
				float4 tex2DNode147_g1003 = tex2D( _GradientTexRain1, ( ( lerpResult117_g1003 * ( mulTime105_g1003 + pow( simplePerlin2D46_g1003 , 2.0 ) ) ) + ( XProjection98_g1003 * float4( temp_output_106_0_g1003 , 0.0 ) ) ).xy );
				float4 temp_cast_13 = (tex2DNode147_g1003.r).xxxx;
				float4 temp_cast_14 = (MaskWorldX585).xxxx;
				float4 InputMaskWorldX199_g1003 = temp_cast_14;
				float4 temp_output_168_0_g1003 = ( CalculateContrast(clampResult243_g1003,temp_cast_13) * InputMaskWorldX199_g1003 * clampResult243_g1003 );
				float4 clampResult173_g1003 = clamp( temp_output_168_0_g1003 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float clampResult156_g1003 = clamp( (-1.0 + (_TrailDropContrast - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , -1.0 , 100.0 );
				float mulTime40_g1003 = _TimeParameters.x * _TrailDropSpeed;
				float time48_g1003 = mulTime40_g1003;
				float2 voronoiSmoothId48_g1003 = 0;
				float2 texCoord41_g1003 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords48_g1003 = texCoord41_g1003 * _TrailDropTiling;
				float2 id48_g1003 = 0;
				float2 uv48_g1003 = 0;
				float fade48_g1003 = 0.5;
				float voroi48_g1003 = 0;
				float rest48_g1003 = 0;
				for( int it48_g1003 = 0; it48_g1003 <2; it48_g1003++ ){
				voroi48_g1003 += fade48_g1003 * voronoi48_g1003( coords48_g1003, time48_g1003, id48_g1003, uv48_g1003, 0,voronoiSmoothId48_g1003 );
				rest48_g1003 += fade48_g1003;
				coords48_g1003 *= 2;
				fade48_g1003 *= 0.5;
				}//Voronoi48_g1003
				voroi48_g1003 /= rest48_g1003;
				float temp_output_52_0_g1003 = ( voroi48_g1003 * (2.0 + (_TrailDropSize - 0.0) * (4.0 - 2.0) / (1.0 - 0.0)) );
				float temp_output_72_0_g1003 = ( step( voroi48_g1003 , temp_output_52_0_g1003 ) * ( 1.0 - temp_output_52_0_g1003 ) );
				float blendOpSrc112_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				float blendOpDest112_g1003 = ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch129_g1003 = ( blendOpSrc112_g1003 + blendOpDest112_g1003 );
				#else
				float staticSwitch129_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				#endif
				float4 XTrailOfDrop161_g1003 = saturate( ( staticSwitch129_g1003 * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpSrc177_g1003 = clampResult173_g1003;
				float4 blendOpDest177_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode147_g1003.b * InputMaskWorldX199_g1003 )) * XTrailOfDrop161_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float4 staticSwitch235_g1003 = ( blendOpSrc177_g1003 + blendOpDest177_g1003 );
				#else
				float4 staticSwitch235_g1003 = clampResult173_g1003;
				#endif
				float4 appendResult17_g1003 = (float4(worldToObj249_g1003.x , worldToObj249_g1003.y , 0.0 , 0.0));
				float4 ZProjection97_g1003 = appendResult17_g1003;
				float4 ZProjectionAmount22_g1003 = ( appendResult17_g1003 * ( ( _Globaltiling.y * _TilingHorizontal ) * clampResult5_g1003 ) );
				float simplePerlin2D49_g1003 = snoise( ( floor( ZProjectionAmount22_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*( RandomPosition25_g1003 + 0.5 ) );
				simplePerlin2D49_g1003 = simplePerlin2D49_g1003*0.5 + 0.5;
				float temp_output_80_0_g1003 = round( ( pow( simplePerlin2D49_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float2 appendResult85_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult101_g1003 = (float4(temp_output_80_0_g1003 , appendResult85_g1003 , 0.0));
				float4 break110_g1003 = appendResult101_g1003;
				float lerpResult121_g1003 = lerp( break110_g1003.y , break110_g1003.z , pow( simplePerlin2D49_g1003 , 2.0 ));
				float mulTime109_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 tex2DNode152_g1003 = tex2D( _GradientTexRain1, ( ( float4( temp_output_106_0_g1003 , 0.0 ) * ZProjection97_g1003 ) + ( lerpResult121_g1003 * ( mulTime109_g1003 + pow( simplePerlin2D49_g1003 , 2.0 ) ) ) ).xy );
				float4 temp_cast_25 = (tex2DNode152_g1003.r).xxxx;
				float4 temp_cast_26 = (MaskWorldZ583).xxxx;
				float4 InputMaskWorldZ205_g1003 = temp_cast_26;
				float4 clampResult175_g1003 = clamp( ( CalculateContrast(clampResult243_g1003,temp_cast_25) * InputMaskWorldZ205_g1003 * clampResult243_g1003 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float blendOpSrc118_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				float blendOpDest118_g1003 = ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch124_g1003 = ( blendOpSrc118_g1003 + blendOpDest118_g1003 );
				#else
				float staticSwitch124_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				#endif
				float4 ZTrailOfDrop157_g1003 = saturate( ( staticSwitch124_g1003 * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc179_g1003 = clampResult175_g1003;
				float4 blendOpDest179_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode152_g1003.b * InputMaskWorldZ205_g1003 )) * ZTrailOfDrop157_g1003 );
				float4 blendOpSrc186_g1003 = staticSwitch235_g1003;
				float4 blendOpDest186_g1003 = ( saturate( ( blendOpSrc179_g1003 + blendOpDest179_g1003 ) ));
				float4 blendOpSrc185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpDest185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc188_g1003 = InputMaskWorldX199_g1003;
				float4 blendOpDest188_g1003 = InputMaskWorldZ205_g1003;
				float4 temp_cast_36 = (MaskWorldY589).xxxx;
				float4 InputMaskWorldY207_g1003 = temp_cast_36;
				float4 blendOpSrc190_g1003 = ( saturate( max( blendOpSrc188_g1003, blendOpDest188_g1003 ) ));
				float4 blendOpDest190_g1003 = ( InputMaskWorldY207_g1003 * 2.0 );
				float4 clampResult192_g1003 = clamp( ( ( ( saturate( ( blendOpSrc186_g1003 + blendOpDest186_g1003 ) )) * ( saturate( max( blendOpSrc185_g1003, blendOpDest185_g1003 ) )) ) * ( saturate( max( blendOpSrc190_g1003, blendOpDest190_g1003 ) )) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 blendOpSrc226_g1003 = ( temp_output_83_0_g1003 * InputMaskWorldX199_g1003 );
				float4 blendOpDest226_g1003 = ( temp_output_80_0_g1003 * InputMaskWorldZ205_g1003 );
				float4 temp_output_226_0_g1003 = ( saturate( max( blendOpSrc226_g1003, blendOpDest226_g1003 ) ));
				float4 MaskRandom231_g1003 = ( temp_output_226_0_g1003 + temp_output_226_0_g1003 );
				float4 RainDropsFalling766 = (( _EnableRandomMask )?( ( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) * MaskRandom231_g1003 ) ):( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) ));
				float4 blendOpSrc772 = temp_cast_5;
				float4 blendOpDest772 = RainDropsFalling766;
				float height107_g1004 = ( saturate( max( blendOpSrc772, blendOpDest772 ) )).r;
				float scale107_g1004 = ( _NormalDrop / 10.0 );
				float3 localPerturbNormal107_g1004 = PerturbNormal107_g1004( surf_pos107_g1004 , surf_norm107_g1004 , height107_g1004 , scale107_g1004 );
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				float3 worldToTangentDir42_g1004 = mul( ase_worldToTangent, localPerturbNormal107_g1004);
				float2 uv_BumpMap = packedInput.ase_texcoord5.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1006 = uv_BumpMap;
				float2 appendResult14_g1006 = (float2(( break26_g1006.x * GlobalTilingX11 ) , ( break26_g1006.y * GlobalTilingY8 )));
				float2 appendResult13_g1006 = (float2(( break26_g1006.x + GlobalOffsetX10 ) , ( break26_g1006.y + GlobalOffsetY9 )));
				float3 unpack4_g1005 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1006 + appendResult13_g1006 ) + Parallaxe494 ) ), _BumpScale );
				unpack4_g1005.z = lerp( 1, unpack4_g1005.z, saturate(_BumpScale) );
				float3 Normal27 = BlendNormal( worldToTangentDir42_g1004 , unpack4_g1005 );
				
				float temp_output_1_0_g621 = ( tex2DNode3_g621.a * _Glossiness );
				float4 temp_cast_40 = (RainDrops606).xxxx;
				float4 blendOpSrc707 = temp_cast_40;
				float4 blendOpDest707 = RainDropsFalling766;
				float4 temp_output_609_0 = ( ( _SmoothnessDrop * 5.0 ) * ( saturate( max( blendOpSrc707, blendOpDest707 ) )) );
				float4 temp_cast_41 = (temp_output_1_0_g621).xxxx;
				float4 blendOpSrc613 = temp_cast_41;
				float4 blendOpDest613 = temp_output_609_0;
				#if defined(_BLENDINGMODEDROPS_ADDITIVE)
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#elif defined(_BLENDINGMODEDROPS_LIGHTEN)
				float4 staticSwitch612 = ( saturate( max( blendOpSrc613, blendOpDest613 ) ));
				#else
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#endif
				float4 Smoothness40 = staticSwitch612;
				
				surfaceDescription.Normal = Normal27;
				surfaceDescription.Smoothness = Smoothness40.r;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmeshPositionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmeshPositionCS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_ColorMaskTransparentVel] 1

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 100302
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_FORWARD
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			// CBuffer must be declared before Material.hlsl since it internaly uses _BlendMode now
			CBUFFER_START( UnityPerMaterial )
			float4 _Color;
			float4 _MainTex_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _ColorCubemap1;
			float4 _EmissionMap_ST;
			float4 _BumpMap_ST;
			float _Brightness;
			float _RandomMax;
			float _DripLineSpeed;
			float _TilingVertical;
			float _TrailDropContrast;
			float _TrailDropTiling;
			float _TrailDropSpeed;
			float _TrailDropSize;
			float _BumpScale;
			float _NormalDrop;
			float _GrowMask;
			float _Metallic;
			float _EmissionIntensity;
			float _BlurReflection;
			float _ReflectionIntensity;
			float _Glossiness;
			float _IntensityDripLine;
			float _RandomPosition;
			float _TilingHorizontal;
			float _SmoothnessDrop;
			float _Parallax;
			float _Saturation;
			float _SplashSpeed;
			float _Tiling;
			float _Noisescale;
			float _Size;
			float _DotFalloff;
			float _Intensity;
			float _EnableProjectionGrid;
			float _EnableDropSide;
			float _DropTopIntensity;
			float _InvertABaseColor;
			float _UseBaseColorAlphaMaskSide;
			float _DropSideIntensity;
			float _EnableRandomMask;
			float _UseBaseColorAlphaMaskSide1;
			float _DripLineContrast;
			float _Amount;
			float _UseBaseColorAlphaMaskTop;
			float _AoIntensity;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MainTex;
			sampler2D _MetallicGlossMapMAHS;
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _GradientTexRain1;
			sampler2D _BumpMap;
			sampler2D _EmissionMap;
			samplerCUBE _Cubemap;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			#define HAS_LIGHTLOOP
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local _ENABLETRAILOFDROP_ON
			#pragma shader_feature_local _REFLECTED_ALL _REFLECTED_RAINDROPS _REFLECTED_DROPONLY _REFLECTED_DRIPLINEONLY
			#pragma shader_feature_local _BLENDINGMODEDROPS_ADDITIVE _BLENDINGMODEDROPS_LIGHTEN


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash58_g990( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g990( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g990( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash877( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi877( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash877( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
					float2 voronoihash48_g1003( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi48_g1003( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash48_g1003( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			
			float3 PerturbNormal107_g1004( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = inputMesh.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = v.previousPositionOS;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = v.precomputedVelocity;
					#endif
				#endif
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
					#endif
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						out float4 outDiffuseLighting : SV_Target1,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_MainTex = packedInput.ase_texcoord7.xyz.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float2 break26_g818 = uv_MainTex;
				float GlobalTilingX11 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float GlobalTilingY8 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g818 = (float2(( break26_g818.x * GlobalTilingX11 ) , ( break26_g818.y * GlobalTilingY8 )));
				float GlobalOffsetX10 = _GlobalXYTilingXYZWOffsetXY.z;
				float GlobalOffsetY9 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g818 = (float2(( break26_g818.x + GlobalOffsetX10 ) , ( break26_g818.y + GlobalOffsetY9 )));
				float2 uv_MetallicGlossMapMAHS = packedInput.ase_texcoord7.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g622 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g622 = (float2(( break26_g622.x * GlobalTilingX11 ) , ( break26_g622.y * GlobalTilingY8 )));
				float2 appendResult13_g622 = (float2(( break26_g622.x + GlobalOffsetX10 ) , ( break26_g622.y + GlobalOffsetY9 )));
				float4 tex2DNode3_g621 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g622 + appendResult13_g622 ) + float2( 0,0 ) ) );
				float3 ase_worldBitangent = packedInput.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 ase_tanViewDir =  tanToWorld0 * V.x + tanToWorld1 * V.y  + tanToWorld2 * V.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g621 = ParallaxOffset( tex2DNode3_g621.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g621 = (((isFrontFace>0)?(paralaxOffset38_g621):(0.0)));
				float2 Parallaxe494 = switchResult37_g621;
				float4 tex2DNode7_g817 = tex2D( _MainTex, ( ( appendResult14_g818 + appendResult13_g818 ) + Parallaxe494 ) );
				float clampResult27_g817 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g817 = ( _Color * tex2DNode7_g817 ).rgb;
				float desaturateDot29_g817 = dot( desaturateInitialColor29_g817, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g817 = lerp( desaturateInitialColor29_g817, desaturateDot29_g817.xxx, -clampResult27_g817 );
				float4 temp_output_819_0 = CalculateContrast(_Brightness,float4( desaturateVar29_g817 , 0.0 ));
				float4 Albedo26 = temp_output_819_0;
				
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 surf_pos107_g1004 = ase_worldPos;
				float3 surf_norm107_g1004 = normalWS;
				float2 temp_cast_3 = (_SplashSpeed).xx;
				float time58_g990 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g990 = 0;
				float2 texCoord55_g990 = packedInput.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_577_0 = ( _Noisescale * 100.0 );
				float clampResult962 = clamp( temp_output_577_0 , 0.0 , 10000.0 );
				float time877 = 0.0;
				float2 voronoiSmoothId877 = 0;
				float2 texCoord576 = packedInput.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords877 = texCoord576 * clampResult962;
				float2 id877 = 0;
				float2 uv877 = 0;
				float fade877 = 0.5;
				float voroi877 = 0;
				float rest877 = 0;
				for( int it877 = 0; it877 <3; it877++ ){
				voroi877 += fade877 * voronoi877( coords877, time877, id877, uv877, 0,voronoiSmoothId877 );
				rest877 += fade877;
				coords877 *= 2;
				fade877 *= 0.5;
				}//Voronoi877
				voroi877 /= rest877;
				float Noise588 = ( voroi877 * 0.005 );
				float4 temp_cast_5 = (Noise588).xxxx;
				float2 coords58_g990 = ( float4( texCoord55_g990, 0.0 , 0.0 ) + temp_cast_5 ).xy * _Tiling;
				float2 id58_g990 = 0;
				float2 uv58_g990 = 0;
				float fade58_g990 = 0.5;
				float voroi58_g990 = 0;
				float rest58_g990 = 0;
				for( int it58_g990 = 0; it58_g990 <2; it58_g990++ ){
				voroi58_g990 += fade58_g990 * voronoi58_g990( coords58_g990, time58_g990, id58_g990, uv58_g990, 0,voronoiSmoothId58_g990 );
				rest58_g990 += fade58_g990;
				coords58_g990 *= 2;
				fade58_g990 *= 0.5;
				}//Voronoi58_g990
				voroi58_g990 /= rest58_g990;
				float2 myVarName60_g990 = id58_g990;
				float2 panner63_g990 = ( 1.0 * _Time.y * temp_cast_3 + ( step( voroi58_g990 , 0.1 ) * myVarName60_g990 ));
				float temp_output_79_0_g990 = (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0));
				float temp_output_120_0_g990 = saturate( ( step( voroi58_g990 , temp_output_79_0_g990 ) * ( 1.0 - ( voroi58_g990 * temp_output_79_0_g990 * (1.0 + (_DotFalloff - 0.0) * (500.0 - 1.0) / (1.0 - 0.0)) ) ) ) );
				float MaskWorldY589 = normalWS.y;
				float temp_output_667_0 = ( MaskWorldY589 * _DropTopIntensity );
				float BaseColorAlpha46 = (( _InvertABaseColor )?( ( 1.0 - tex2DNode7_g817.a ) ):( tex2DNode7_g817.a ));
				float3 temp_cast_7 = (0.5).xxx;
				float3 break580 = ( abs( normalWS ) - temp_cast_7 );
				float MaskWorldX585 = break580.x;
				float MaskWorldZ583 = break580.z;
				float blendOpSrc598 = MaskWorldX585;
				float blendOpDest598 = MaskWorldZ583;
				float temp_output_599_0 = ( ( saturate( max( blendOpSrc598, blendOpDest598 ) )) * _DropSideIntensity );
				float blendOpSrc603 = (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 ));
				float blendOpDest603 = (( _UseBaseColorAlphaMaskSide )?( ( temp_output_599_0 * BaseColorAlpha46 ) ):( temp_output_599_0 ));
				float clampResult605 = clamp( ( ( saturate( ( tex2D( _GradientTexRain1, panner63_g990 ).g * temp_output_120_0_g990 ) ) * _Intensity ) * (( _EnableDropSide )?( ( saturate( max( blendOpSrc603, blendOpDest603 ) )) ):( (( _UseBaseColorAlphaMaskTop )?( ( temp_output_667_0 * BaseColorAlpha46 ) ):( temp_output_667_0 )) )) ) , 0.0 , 1.0 );
				float RainDrops606 = clampResult605;
				float4 temp_cast_8 = (RainDrops606).xxxx;
				float clampResult243_g1003 = clamp( _DripLineContrast , 0.0 , 100.0 );
				float3 worldToObj249_g1003 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(( mul( UNITY_MATRIX_M, float4( ase_worldPos , 0.0 ) ).xyz + float3( float2( 0.5,0.5 ) ,  0.0 ) )), 1 ) ).xyz;
				float4 appendResult16_g1003 = (float4(worldToObj249_g1003.z , worldToObj249_g1003.y , 0.0 , 0.0));
				float clampResult5_g1003 = clamp( _Amount , 8.0 , 1000.0 );
				float2 _Globaltiling = float2(1,1);
				float4 XProjectionAmount23_g1003 = ( appendResult16_g1003 * ( clampResult5_g1003 * ( _Globaltiling.y * _TilingHorizontal ) ) );
				float RandomPosition25_g1003 = _RandomPosition;
				float simplePerlin2D46_g1003 = snoise( ( floor( XProjectionAmount23_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*RandomPosition25_g1003 );
				simplePerlin2D46_g1003 = simplePerlin2D46_g1003*0.5 + 0.5;
				float temp_output_240_0_g1003 = (1.0 + (_GrowMask - 1.0) * (50.0 - 1.0) / (10.0 - 1.0));
				float temp_output_83_0_g1003 = round( ( pow( simplePerlin2D46_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float RF_RandomMin66_g1003 = 0.05;
				float RF_Random65_g1003 = (0.05 + (_RandomMax - 0.1) * (1.0 - 0.05) / (1.0 - 0.1));
				float2 appendResult88_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult99_g1003 = (float4(temp_output_83_0_g1003 , appendResult88_g1003 , 0.0));
				float4 break104_g1003 = appendResult99_g1003;
				float lerpResult117_g1003 = lerp( break104_g1003.y , break104_g1003.z , pow( simplePerlin2D46_g1003 , 2.0 ));
				float RF_Timespeed77_g1003 = _DripLineSpeed;
				float mulTime105_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 XProjection98_g1003 = appendResult16_g1003;
				float3 temp_output_106_0_g1003 = ( float3(0,-1,0) * _TilingVertical );
				float4 tex2DNode147_g1003 = tex2D( _GradientTexRain1, ( ( lerpResult117_g1003 * ( mulTime105_g1003 + pow( simplePerlin2D46_g1003 , 2.0 ) ) ) + ( XProjection98_g1003 * float4( temp_output_106_0_g1003 , 0.0 ) ) ).xy );
				float4 temp_cast_16 = (tex2DNode147_g1003.r).xxxx;
				float4 temp_cast_17 = (MaskWorldX585).xxxx;
				float4 InputMaskWorldX199_g1003 = temp_cast_17;
				float4 temp_output_168_0_g1003 = ( CalculateContrast(clampResult243_g1003,temp_cast_16) * InputMaskWorldX199_g1003 * clampResult243_g1003 );
				float4 clampResult173_g1003 = clamp( temp_output_168_0_g1003 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float clampResult156_g1003 = clamp( (-1.0 + (_TrailDropContrast - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , -1.0 , 100.0 );
				float mulTime40_g1003 = _TimeParameters.x * _TrailDropSpeed;
				float time48_g1003 = mulTime40_g1003;
				float2 voronoiSmoothId48_g1003 = 0;
				float2 texCoord41_g1003 = packedInput.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords48_g1003 = texCoord41_g1003 * _TrailDropTiling;
				float2 id48_g1003 = 0;
				float2 uv48_g1003 = 0;
				float fade48_g1003 = 0.5;
				float voroi48_g1003 = 0;
				float rest48_g1003 = 0;
				for( int it48_g1003 = 0; it48_g1003 <2; it48_g1003++ ){
				voroi48_g1003 += fade48_g1003 * voronoi48_g1003( coords48_g1003, time48_g1003, id48_g1003, uv48_g1003, 0,voronoiSmoothId48_g1003 );
				rest48_g1003 += fade48_g1003;
				coords48_g1003 *= 2;
				fade48_g1003 *= 0.5;
				}//Voronoi48_g1003
				voroi48_g1003 /= rest48_g1003;
				float temp_output_52_0_g1003 = ( voroi48_g1003 * (2.0 + (_TrailDropSize - 0.0) * (4.0 - 2.0) / (1.0 - 0.0)) );
				float temp_output_72_0_g1003 = ( step( voroi48_g1003 , temp_output_52_0_g1003 ) * ( 1.0 - temp_output_52_0_g1003 ) );
				float blendOpSrc112_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				float blendOpDest112_g1003 = ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch129_g1003 = ( blendOpSrc112_g1003 + blendOpDest112_g1003 );
				#else
				float staticSwitch129_g1003 = tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a;
				#endif
				float4 XTrailOfDrop161_g1003 = saturate( ( staticSwitch129_g1003 * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpSrc177_g1003 = clampResult173_g1003;
				float4 blendOpDest177_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode147_g1003.b * InputMaskWorldX199_g1003 )) * XTrailOfDrop161_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float4 staticSwitch235_g1003 = ( blendOpSrc177_g1003 + blendOpDest177_g1003 );
				#else
				float4 staticSwitch235_g1003 = clampResult173_g1003;
				#endif
				float4 appendResult17_g1003 = (float4(worldToObj249_g1003.x , worldToObj249_g1003.y , 0.0 , 0.0));
				float4 ZProjection97_g1003 = appendResult17_g1003;
				float4 ZProjectionAmount22_g1003 = ( appendResult17_g1003 * ( ( _Globaltiling.y * _TilingHorizontal ) * clampResult5_g1003 ) );
				float simplePerlin2D49_g1003 = snoise( ( floor( ZProjectionAmount22_g1003 ) * float4( (( _EnableProjectionGrid )?( float2( 1,1 ) ):( float2( 1,0 ) )), 0.0 , 0.0 ) ).xy*( RandomPosition25_g1003 + 0.5 ) );
				simplePerlin2D49_g1003 = simplePerlin2D49_g1003*0.5 + 0.5;
				float temp_output_80_0_g1003 = round( ( pow( simplePerlin2D49_g1003 , 2.0 ) * temp_output_240_0_g1003 ) );
				float2 appendResult85_g1003 = (float2(RF_RandomMin66_g1003 , RF_Random65_g1003));
				float4 appendResult101_g1003 = (float4(temp_output_80_0_g1003 , appendResult85_g1003 , 0.0));
				float4 break110_g1003 = appendResult101_g1003;
				float lerpResult121_g1003 = lerp( break110_g1003.y , break110_g1003.z , pow( simplePerlin2D49_g1003 , 2.0 ));
				float mulTime109_g1003 = _TimeParameters.x * -RF_Timespeed77_g1003;
				float4 tex2DNode152_g1003 = tex2D( _GradientTexRain1, ( ( float4( temp_output_106_0_g1003 , 0.0 ) * ZProjection97_g1003 ) + ( lerpResult121_g1003 * ( mulTime109_g1003 + pow( simplePerlin2D49_g1003 , 2.0 ) ) ) ).xy );
				float4 temp_cast_28 = (tex2DNode152_g1003.r).xxxx;
				float4 temp_cast_29 = (MaskWorldZ583).xxxx;
				float4 InputMaskWorldZ205_g1003 = temp_cast_29;
				float4 clampResult175_g1003 = clamp( ( CalculateContrast(clampResult243_g1003,temp_cast_28) * InputMaskWorldZ205_g1003 * clampResult243_g1003 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float blendOpSrc118_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				float blendOpDest118_g1003 = ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * temp_output_72_0_g1003 );
				#ifdef _ENABLETRAILOFDROP_ON
				float staticSwitch124_g1003 = ( blendOpSrc118_g1003 + blendOpDest118_g1003 );
				#else
				float staticSwitch124_g1003 = tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a;
				#endif
				float4 ZTrailOfDrop157_g1003 = saturate( ( staticSwitch124_g1003 * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc179_g1003 = clampResult175_g1003;
				float4 blendOpDest179_g1003 = ( CalculateContrast(clampResult156_g1003,( tex2DNode152_g1003.b * InputMaskWorldZ205_g1003 )) * ZTrailOfDrop157_g1003 );
				float4 blendOpSrc186_g1003 = staticSwitch235_g1003;
				float4 blendOpDest186_g1003 = ( saturate( ( blendOpSrc179_g1003 + blendOpDest179_g1003 ) ));
				float4 blendOpSrc185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( XProjectionAmount23_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldX199_g1003 ) );
				float4 blendOpDest185_g1003 = saturate( ( tex2D( _GradientTexRain1, ( ZProjectionAmount22_g1003 / 8.0 ).xy ).a * _IntensityDripLine * InputMaskWorldZ205_g1003 ) );
				float4 blendOpSrc188_g1003 = InputMaskWorldX199_g1003;
				float4 blendOpDest188_g1003 = InputMaskWorldZ205_g1003;
				float4 temp_cast_39 = (MaskWorldY589).xxxx;
				float4 InputMaskWorldY207_g1003 = temp_cast_39;
				float4 blendOpSrc190_g1003 = ( saturate( max( blendOpSrc188_g1003, blendOpDest188_g1003 ) ));
				float4 blendOpDest190_g1003 = ( InputMaskWorldY207_g1003 * 2.0 );
				float4 clampResult192_g1003 = clamp( ( ( ( saturate( ( blendOpSrc186_g1003 + blendOpDest186_g1003 ) )) * ( saturate( max( blendOpSrc185_g1003, blendOpDest185_g1003 ) )) ) * ( saturate( max( blendOpSrc190_g1003, blendOpDest190_g1003 ) )) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 blendOpSrc226_g1003 = ( temp_output_83_0_g1003 * InputMaskWorldX199_g1003 );
				float4 blendOpDest226_g1003 = ( temp_output_80_0_g1003 * InputMaskWorldZ205_g1003 );
				float4 temp_output_226_0_g1003 = ( saturate( max( blendOpSrc226_g1003, blendOpDest226_g1003 ) ));
				float4 MaskRandom231_g1003 = ( temp_output_226_0_g1003 + temp_output_226_0_g1003 );
				float4 RainDropsFalling766 = (( _EnableRandomMask )?( ( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) * MaskRandom231_g1003 ) ):( (( _UseBaseColorAlphaMaskSide1 )?( ( clampResult192_g1003 * BaseColorAlpha46 ) ):( clampResult192_g1003 )) ));
				float4 blendOpSrc772 = temp_cast_8;
				float4 blendOpDest772 = RainDropsFalling766;
				float height107_g1004 = ( saturate( max( blendOpSrc772, blendOpDest772 ) )).r;
				float scale107_g1004 = ( _NormalDrop / 10.0 );
				float3 localPerturbNormal107_g1004 = PerturbNormal107_g1004( surf_pos107_g1004 , surf_norm107_g1004 , height107_g1004 , scale107_g1004 );
				float3x3 ase_worldToTangent = float3x3(tangentWS.xyz,ase_worldBitangent,normalWS);
				float3 worldToTangentDir42_g1004 = mul( ase_worldToTangent, localPerturbNormal107_g1004);
				float2 uv_BumpMap = packedInput.ase_texcoord7.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1006 = uv_BumpMap;
				float2 appendResult14_g1006 = (float2(( break26_g1006.x * GlobalTilingX11 ) , ( break26_g1006.y * GlobalTilingY8 )));
				float2 appendResult13_g1006 = (float2(( break26_g1006.x + GlobalOffsetX10 ) , ( break26_g1006.y + GlobalOffsetY9 )));
				float3 unpack4_g1005 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1006 + appendResult13_g1006 ) + Parallaxe494 ) ), _BumpScale );
				unpack4_g1005.z = lerp( 1, unpack4_g1005.z, saturate(_BumpScale) );
				float3 Normal27 = BlendNormal( worldToTangentDir42_g1004 , unpack4_g1005 );
				
				float Metallic41 = ( tex2DNode3_g621.r * _Metallic );
				
				float2 uv_EmissionMap = packedInput.ase_texcoord7.xyz.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				float2 break26_g1009 = uv_EmissionMap;
				float2 appendResult14_g1009 = (float2(( break26_g1009.x * GlobalTilingX11 ) , ( break26_g1009.y * GlobalTilingY8 )));
				float2 appendResult13_g1009 = (float2(( break26_g1009.x + GlobalOffsetX10 ) , ( break26_g1009.y + GlobalOffsetY9 )));
				float3 worldRefl28_g1096 = normalize( reflect( -V, float3( dot( tanToWorld0, Normal27 ), dot( tanToWorld1, Normal27 ), dot( tanToWorld2, Normal27 ) ) ) );
				float4 texCUBENode27_g1096 = texCUBElod( _Cubemap, float4( worldRefl28_g1096, _BlurReflection) );
				float clampResult58_g1096 = clamp( ( _ReflectionIntensity * 1000.0 ) , 0.0 , 100000.0 );
				float4 temp_cast_43 = (1.0).xxxx;
				float4 temp_cast_44 = (1.0).xxxx;
				float4 temp_cast_45 = (RainDrops606).xxxx;
				float4 blendOpSrc780 = RainDropsFalling766;
				float4 blendOpDest780 = temp_cast_45;
				float4 temp_cast_46 = (RainDrops606).xxxx;
				#if defined(_REFLECTED_ALL)
				float4 staticSwitch963 = temp_cast_43;
				#elif defined(_REFLECTED_RAINDROPS)
				float4 staticSwitch963 = ( saturate( max( blendOpSrc780, blendOpDest780 ) ));
				#elif defined(_REFLECTED_DROPONLY)
				float4 staticSwitch963 = temp_cast_46;
				#elif defined(_REFLECTED_DRIPLINEONLY)
				float4 staticSwitch963 = RainDropsFalling766;
				#else
				float4 staticSwitch963 = temp_cast_43;
				#endif
				float4 Emission110 = ( ( _EmissionColor * tex2D( _EmissionMap, ( ( appendResult14_g1009 + appendResult13_g1009 ) + Parallaxe494 ) ) * _EmissionIntensity ) + ( ( texCUBENode27_g1096 * ( texCUBENode27_g1096.a * clampResult58_g1096 ) * _ColorCubemap1 ) * staticSwitch963 ) );
				
				float temp_output_1_0_g621 = ( tex2DNode3_g621.a * _Glossiness );
				float4 temp_cast_50 = (RainDrops606).xxxx;
				float4 blendOpSrc707 = temp_cast_50;
				float4 blendOpDest707 = RainDropsFalling766;
				float4 temp_output_609_0 = ( ( _SmoothnessDrop * 5.0 ) * ( saturate( max( blendOpSrc707, blendOpDest707 ) )) );
				float4 temp_cast_51 = (temp_output_1_0_g621).xxxx;
				float4 blendOpSrc613 = temp_cast_51;
				float4 blendOpDest613 = temp_output_609_0;
				#if defined(_BLENDINGMODEDROPS_ADDITIVE)
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#elif defined(_BLENDINGMODEDROPS_LIGHTEN)
				float4 staticSwitch612 = ( saturate( max( blendOpSrc613, blendOpDest613 ) ));
				#else
				float4 staticSwitch612 = ( temp_output_1_0_g621 + temp_output_609_0 );
				#endif
				float4 Smoothness40 = staticSwitch612;
				
				float blendOpSrc34_g621 = tex2DNode3_g621.g;
				float blendOpDest34_g621 = ( 1.0 - _AoIntensity );
				float AOG565 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g621 ) * ( 1.0 - blendOpDest34_g621 ) ) ));
				float AmbientOcclusion94 = AOG565;
				
				surfaceDescription.Albedo = Albedo26.rgb;
				surfaceDescription.Normal = Normal27;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Metallic41;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Emission110.rgb;
				surfaceDescription.Smoothness = Smoothness40.r;
				surfaceDescription.Occlusion = AmbientOcclusion94;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = 0;
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);

						GetPBRValidatorDebug(surfaceData, result);

						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
				#endif
					{
				#ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
					
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;
					
						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = 0;
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
				#endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
						if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
					}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}
			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	
	
}