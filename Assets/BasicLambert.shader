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
}
