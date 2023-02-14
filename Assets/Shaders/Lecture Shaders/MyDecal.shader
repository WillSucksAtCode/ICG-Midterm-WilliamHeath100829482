Shader "Custom/MyDecal"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _DecalTex ("Decal", 2D) = "white" {}
        [Toggle] _ShowDecal("Show Decal", Float) = 0
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _DecalTex;
        float _ShowDecal;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 a = tex2D (_MainTex, IN.uv_MainTex);
            //fixed4 b = tex2D (_DecalTex, IN.uv_MainTex);
            fixed4 b = tex2D (_DecalTex, IN.uv_MainTex) * _ShowDecal;
            o.Albedo = b.r > 0.5 ? b.rgb : a.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}