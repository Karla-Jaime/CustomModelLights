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

        float4 LightinToonRamp(SurfaceOutput s, fixed lightDir, fixed atten)
        {   //difuso/ producto X = calcular la iluminacion
            half diff = dot(s.Normal, lightDir);
            float uv = (diff 0.5) + 0.5;//La coordenada donde voy a ver el uv;

        }
        
        ENDCG
    }
}