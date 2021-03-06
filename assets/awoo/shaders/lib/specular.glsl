/*
    Glossy Goodness Material Shader
    Copyright (C) 2020  spiralhalo

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/******************************************************
  awoo:shaders/lib/specular.glsl
******************************************************/

float gg_specular(vec3 skyDir, vec3 fragNormal, vec3 modelPos, vec3 cameraPos, float luminance)
{
   // Obtain the direction of the camera.
   vec3 viewDir = normalize(cameraPos - modelPos);

   // Calculate specular power based on luminance to give a sense of roughness on darker material.
   float power = pow(luminance,1.5) * 20;

   // Calculate the specular light.
   return max(0.0, pow(dot(reflect(-skyDir, fragNormal), viewDir),power));

}