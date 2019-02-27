Shader "Unlit/BasicBling"
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
       
        half4 LightingBasicBling(SurfaceOutput s, half3 lightDir, half atten)
        {
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