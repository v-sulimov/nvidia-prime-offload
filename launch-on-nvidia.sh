#!/bin/bash

# A custom script to launch applications on the NVIDIA dedicated GPU
# using NVIDIA PRIME Render Offload environment variables, replacing the need for 'prime-run'.
#
# Usage: ./launch-on-nvidia.sh <application_executable>

# Enable PRIME Render Offload (mandatory for both GLX and Vulkan)
export __NV_PRIME_RENDER_OFFLOAD=1

# Force GLX to use the NVIDIA driver (mandatory for OpenGL/GLX applications)
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# Restrict Vulkan to only report NVIDIA GPUs (helpful for Vulkan/Proton/DXVK)
export __VK_LAYER_NV_optimus=NVIDIA_only

# Check if an application was provided as an argument
if [ -z "$1" ]; then
    echo "Error: No application specified."
    echo "Usage: $0 <application_executable>"
    exit 1
fi

# Launch the application in the background using '&'.
echo "Launching '$1' using NVIDIA dGPU in the background..."
"$@" &
