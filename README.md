# NVIDIA PRIME Offload

A simple, universal shell script wrapper that launches any application using the dedicated NVIDIA GPU through the PRIME Render Offload mechanism.

This script streamlines the process of running demanding applications by setting the three required environment variables in a single, reusable command.

This script is especially useful on systems where `prime-run` is either unavailable, deprecated, or behaves inconsistently.

## Features

- Sets all necessary PRIME offload environment variables
- Works with OpenGL, Vulkan, DXVK, and VKD3D-Proton applications
- Launches the application in the background (non-blocking)
- No dependencies beyond a standard shell

## Installation

```bash
# Clone or download this repository, then install the script globally
sudo cp launch-on-nvidia.sh /usr/local/bin/launch-on-nvidia.sh
sudo chmod +x /usr/local/bin/launch-on-nvidia.sh
```

After installation, the command `launch-on-nvidia` will be available system-wide.

## Usage

```bash
launch-on-nvidia.sh <command> [arguments...]
```

### Examples

```bash
launch-on-nvidia.sh glxgears
launch-on-nvidia.sh blender
launch-on-nvidia.sh steam
```

## Verification

After launching any application with `launch-on-nvidia`, open another terminal and run:

```bash
nvidia-smi
```

You should see the launched process listed under the NVIDIA GPU processes table, confirming it is indeed running on the discrete GPU.
