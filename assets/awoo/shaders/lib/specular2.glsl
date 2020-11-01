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
  awoo:shaders/lib/specular2.glsl
******************************************************/

// DEPRECATED
// EXPERIMENTAL
float gg_specular2(vec3 skyDir, vec3 fragNormal, vec3 fragScreenPos, vec3 cameraViewVector, float luminance)
{
    //Code readability.
    vec3 cvv = cameraViewVector;

    // Algebra
    float cosp = cos(asin(-cvv.y));
    float invCosp = 1/cosp;

    // Build the rotation matrix.
    mat3 R = mat3(
        cvv.z * invCosp,    cvv.x * cvv.y * invCosp,    -cvv.x,
        0,                  cosp,                       cvv.y,
        cvv.x * invCosp,    cvv.z * -cvv.y * invCosp,   cvv.z     
    );
    
    // Approximate the direction of the camera.
    vec3 viewDir = normalize(fragScreenPos * R);
    viewDir.y *= -1;

    // Calculate specular power based on luminance to give a sense of roughness on darker material.
    float power = pow(luminance,1.5) * 20;

    // Calculate the specular light.
    // return dot(skyDir, fragNormal)<0?0:max(0.0, dot(reflect(-skyDir, fragNormal), viewDir));
    return dot(skyDir, fragNormal)<=0?0:max(0.0, pow(dot(reflect(-skyDir, fragNormal), viewDir),power));

}