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
        #pragma surface surf BasicBling
       
        half4 LightingBasicBling(SurfaceOutput s, half3 lightDir,half3 viewDir, half atten)
        
        { 
            half3 h = normalize (lightDir + viewDir);//Dir del brillo
            half diff = max(0, dot(s.Normal, lightDir));//Valor max de este
            //Hacer producto Cruz entre normal y h
            float nh = max(0, dot(s.Normal, h));
            //Calcular Especular
            float spec = pow(nh,48.0);//pow-potencia, valor, a cuanto
            half4 c;
            c.rgb = ((s.Albedo * _LightColor0.rgb) * diff * (spec * _LightColor0.rgb)) * atten;
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