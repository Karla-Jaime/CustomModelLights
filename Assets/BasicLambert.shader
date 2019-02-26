Shader "Unlit/BasicLambert"
{
   Properties
   {
       _Albedo("Albedo" Color) = (1,1,1,1)
   }

   SubShader
   {//Lista de instruciones especiales
       Tags
       {
           "Queue" = "Geometry"
       }
   }

   CGPROGRAM 
        #pragma surface surf BasicLambert
        //Da orden a la superficie , se crea el modelo de luz 
        //Al ser la luz un color es half4 (0,0,0,0) vertices 
        //Nom del Model de Luz Lighting+Nombre del modelo
        half4 LightingBasicLambert(SurfaceOutput s, half3 lightDir, half atten)
        {
            //
            half  NdotL = dot(s.Normal, lightDir);
        } 


   ENDCG

}
