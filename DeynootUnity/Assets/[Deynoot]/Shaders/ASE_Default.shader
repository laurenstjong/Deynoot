// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Deynoot/ASE_Default"
{
	Properties
	{
		[NoScaleOffset]_MainTex("Albedo Map", 2D) = "white" {}
		_Color("Albedo Color", Color) = (1,1,1,0)
		[NoScaleOffset]_EmissionMap("Emission Map", 2D) = "black" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		[Normal][NoScaleOffset]_Normal("Normal Map", 2D) = "bump" {}
		_NormalScale("Normal Scale", Range( 0 , 2)) = 1
		[NoScaleOffset]_MSAMap("MSA Map", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_AmbientOcclusion("Ambient Occlusion", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _NormalScale;
		uniform sampler2D _Normal;
		uniform sampler2D _MainTex;
		uniform float4 _Color;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionColor;
		uniform float _Metallic;
		uniform sampler2D _MSAMap;
		uniform float _Smoothness;
		uniform float _AmbientOcclusion;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal4 = i.uv_texcoord;
			o.Normal = UnpackScaleNormal( tex2D( _Normal, uv_Normal4 ) ,_NormalScale );
			float2 uv_MainTex1 = i.uv_texcoord;
			o.Albedo = ( tex2D( _MainTex, uv_MainTex1 ) * _Color ).rgb;
			float2 uv_EmissionMap14 = i.uv_texcoord;
			o.Emission = ( tex2D( _EmissionMap, uv_EmissionMap14 ) * _EmissionColor ).rgb;
			float2 uv_MSAMap5 = i.uv_texcoord;
			float4 tex2DNode5 = tex2D( _MSAMap, uv_MSAMap5 );
			o.Metallic = ( _Metallic * tex2DNode5.r );
			o.Smoothness = ( tex2DNode5.g * _Smoothness );
			float lerpResult10 = lerp( 1.0 , tex2DNode5.b , _AmbientOcclusion);
			o.Occlusion = lerpResult10;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14501
730;348;1993;1493;2263.559;407.0051;1.604999;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-436.0714,-288.2299;Float;True;Property;_MainTex;Albedo Map;0;1;[NoScaleOffset];Create;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-528.549,1394.764;Float;False;Property;_AmbientOcclusion;Ambient Occlusion;9;0;Create;True;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;13;-706.7123,536.7341;Float;False;Property;_EmissionColor;Emission Color;3;1;[HDR];Create;True;0;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-759.6793,320.0591;Float;True;Property;_EmissionMap;Emission Map;2;1;[NoScaleOffset];Create;True;0;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;6;-725.8137,772.6688;Float;False;Property;_Metallic;Metallic;7;0;Create;True;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-538.2087,1299.034;Float;False;Constant;_Float0;Float 0;5;0;Create;True;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-728.8067,906.6456;Float;True;Property;_MSAMap;MSA Map;6;1;[NoScaleOffset];Create;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;9;-585.0092,1175.51;Float;False;Property;_Smoothness;Smoothness;8;0;Create;True;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-364.9602,-58.65514;Float;False;Property;_Color;Albedo Color;1;0;Create;False;0;1,1,1,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-857.5804,178.8198;Float;False;Property;_NormalScale;Normal Scale;5;0;Create;True;0;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-83.55948,874.8344;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-452.471,121.3501;Float;True;Property;_Normal;Normal Map;4;2;[Normal];[NoScaleOffset];Create;False;0;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-258.9195,478.9545;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-78.14412,1056.199;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;35.29991,-177.8948;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;10;-71.21404,1223.014;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;545.9699,347.1698;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Deynoot/ASE_Default;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;6;0
WireConnection;7;1;5;1
WireConnection;4;5;16;0
WireConnection;15;0;14;0
WireConnection;15;1;13;0
WireConnection;8;0;5;2
WireConnection;8;1;9;0
WireConnection;2;0;1;0
WireConnection;2;1;3;0
WireConnection;10;0;12;0
WireConnection;10;1;5;3
WireConnection;10;2;11;0
WireConnection;0;0;2;0
WireConnection;0;1;4;0
WireConnection;0;2;15;0
WireConnection;0;3;7;0
WireConnection;0;4;8;0
WireConnection;0;5;10;0
ASEEND*/
//CHKSM=BCC6B3A95435DD5BB60D4810A46DD7E152919693