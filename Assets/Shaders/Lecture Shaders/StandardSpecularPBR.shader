Shader "Custom/StandardSpecularPBR"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MetallicTex("Metallic (R)", 2D) = "white" {}
        _SpecColor("Specular", Color) = (1,1,1,1)
    }
        SubShader
        {
            Tags { "Queue" = "Geometry" }

            CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf StandardSpecular

            // Use shader model 3.0 target, to get nicer looking lighting
            #pragma target 3.0

            sampler2D _MetallicTex;
            fixed4 _Color;

            struct Input
            {
                float2 uv_MetallicTex;
            };

            void surf(Input IN, inout SurfaceOutputStandardSpecular o)
            {
                // Albedo comes from a texture tinted by color
                o.Albedo = _Color.rgb;
                o.Specular = _SpecColor.rgb;
                o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
