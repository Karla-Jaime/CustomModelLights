Shader "Custom/Tools"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white"{}
        _Albedo("Albedo", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white"{}
        _OutlineColor("Outline Color", Color) = (0,0,0,1)
        _OutlineSize("Outline Width", Range(0.001, 01)) = 0.05
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
            Cull Front

            CGPROGRAM
            #pragma vertex  vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata //info
            {
                float4 vertex : POSITION;
                //float2 uv : TEXCORD0;
                float4 normal : NORMAL;
            };//NO olvidar colocar ; al final de struct

            struct v2f { 
                float4 pos : SV_POSITION;
                 // posicion de los vertices ante de ser procesados
                fixed4 color : COLOR;
                //albedo antes de ser modificado
            };

            float4 _OutlineColor;
            float _OutlineSize;

            v2f vert(appdata v)
            { 
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                float3 norm   = normalize(mul ((float3x3)UNITY_MATRIX_IT_MV, v.normal));
                //para la profundidad, calcular posicion
                float2 offset = TransformViewToProjection(norm.xy);
                //solo x,y por que es una proyeccion
                //offset, la posicion en la que se encuentra la camara
                o.pos.xy += offset * o.pos.z * _OutlineSize;
                o.color = _OutlineColor;                                                
                return o;
            }
            //da la orden de mandar a llamar todo lo usado en v2f
            fixed4 frag(v2f i) : SV_Target
            {
                return i.color;//pintar 
            }
            ENDCG
        }//Multi-Channel Ramp
    }
}