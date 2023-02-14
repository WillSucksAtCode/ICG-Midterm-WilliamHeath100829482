Shader "Custom/MyRim"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
        _Color ("Color", Color) = (0, 0, 0, 0.0)
        _RimPower ("Rim Power", Range(0.5, 8.0)) = 3.0
        _MainTex("Texture", 2D) = "white" {}
        [Toggle] _ShowField("Show Forcefield", Float) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        float4 _RimColor;
        float4 _Color;
        float _RimPower;
        float _ShowField;

        struct Input {
            float3 viewDir;
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 mainTex = tex2D(_MainTex, IN.uv_MainTex);
           //half rim = dot (normalize(in.viewDir), o.Normal);
            half rimA = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            half rimB = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal)) * _ShowField;
            //o.Emission = _RimColor.rgb * rim;
            o.Albedo = mainTex.rgb;
            //o.Emission = _RimColor.rgb * pow(rim, _RimPower);
            o.Emission = rimB.r > 0.9 ? _Color.rgb : _RimColor.rgb * pow(rimB, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
