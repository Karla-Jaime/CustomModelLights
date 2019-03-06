Shader "Custom/Tools"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white"{}
        _Albedo("Albedo", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white"{}
    }

    SubShader   
    {
        CGPROGRAM
        #pragma surface surf ToonRamp
        /*Me duelen los dientes tana nana~
          Me duele la boca tana nana~
          quiero una pastilla!!!
          e irme a mi casaaaaaaaaa*/
        float4 _Albedo;
        sampler2D _MainTex;
        sampler2D _RampTex;

        float4 LightingToonRamp(SurfaceOutput s, fixed2 lightDir, fixed atten)
        {   //difuso/ producto X = calcular la iluminacion
            half diff = dot(s.Normal, lightDir);
            float uv = (diff * 0.5) + 0.5;//La coordenada donde voy a ver el uv;
            float3 ramp = tex2D(_RampTex,uv);//Text2D regresa un color
            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * ramp;
            c.a = s.Alpha;
            return c;
        }
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Albedo.rgb;
        }

        ENDCG

        Pass
        {
            CGPROGRAM
            #pragma vertex  verte
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata //info
            {
                float4 vertex : POSITION;
                //float2 uv : TEXCORD0;
                float4 normal : NORMAL;
            };//NO olvidar colocar ; al final de struct


            ENDCG
        }//Multi-Channel Ramp
    }
}