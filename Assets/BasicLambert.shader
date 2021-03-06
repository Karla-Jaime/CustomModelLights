﻿Shader "Unlit/BasicLambert"
{
   Properties
   {
       _Albedo("Albedo", Color) = (1,1,1,1)
   }

   SubShader
   {
       Tags
       {
           "Queue" = "Geometry"
       }
   

   CGPROGRAM 
        #pragma surface surf BasicLambert
        //Da orden a la superficie , se crea el modelo de luz 
        //Al ser la luz un color es half4 (0,0,0,0) vertices 
        //Nom del Model de Luz Lighting+Nombre del modelo //Atten intencidad con la que recibe la luz
        half4 LightingBasicLambert(SurfaceOutput s, half3 lightDir, half atten)
        {
            //
            half  NdotL = dot(s.Normal, lightDir); 
            half4 c; //c abreviación de Luz
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);//Es una palabra recerbada de Unity. 
            c.a = s.Alpha;
            return c;
        } 

        float4  _Albedo;
        
        struct Input //Indica que cosas recibe 
        {
            float2 uv_MainText;
        };
                // o por que es de salida 
        void surf(Input IN,inout SurfaceOutput o )
        {
            o.Albedo = _Albedo.rgb;

        }
   ENDCG
   }
}