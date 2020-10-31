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

#include awoo:shaders/lib/skydir.glsl
#include awoo:shaders/lib/specular.glsl
#include frex:shaders/api/world.glsl
#include frex:shaders/api/fragment.glsl
#include frex:shaders/lib/math.glsl
#include frex:shaders/api/camera.glsl

// Customizable
#define STRENGTH      0.5

varying vec3 rbv_modelPos;
varying vec3 rbv_cameraPos;

/******************************************************
  awoo:shaders/material/reflective_block.frag
******************************************************/

void frx_startFragment(inout frx_FragmentData data) 
{
    // This comment pretends to explain things to you but why would it? No one reads my code.
    float wt = frx_worldTime();
    float amb = frx_ambientIntensity();
    float sky = frx_smootherstep(0.03125, 1.0, data.light.y);
    float lum = frx_luminance(data.spriteColor.rgb);

    // Obtain the normal of the model.
    vec3 norm = data.vertexNormal * frx_normalModelMatrix();

    // Calculate the specular light.
    float spec = gg_specular(gg_skyDir(wt), norm, rbv_modelPos, rbv_cameraPos, lum);
    spec *= STRENGTH  * amb * sky;

    // Apply specular light I guess.
    data.spriteColor.rgb += vec3(spec);
}