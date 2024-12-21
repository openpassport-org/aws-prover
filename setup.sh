#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Install essential build tools and C++ toolchain
sudo apt-get install -y build-essential cmake git
sudo apt-get install -y gcc g++ gdb make
sudo apt-get install -y pkg-config
sudo apt-get install -y autoconf automake libtool

# Install NASM assembler
sudo apt-get install -y nasm

# Install GMP and other math libraries
sudo apt-get install -y libgmp-dev
sudo apt-get install -y libssl-dev

# Install nlohmann-json
sudo apt-get install -y nlohmann-json3-dev

# Install additional useful tools
sudo apt-get install -y htop # for monitoring CPU/memory usage
sudo apt-get install -y valgrind # for memory debugging if needed

# Create workspace directory and navigate to the correct folder
mkdir -p ~/workspace
cd ~/workspace

# Navigate to the specific directory
cd prove_ecdsa_sha1_secp256r1_256_cpp || {
    echo "Error: Could not find prove_ecdsa_sha1_secp256r1_256_cpp directory"
    exit 1
}

# Set some environment variables for better performance
echo 'export MAKEFLAGS="-j$(nproc)"' >> ~/.bashrc # Use all CPU cores for make

echo "Setup complete! System ready for compilation."

# Instructions for the user
echo "Next steps:"
echo "1. You are now in: $(pwd)"
echo "2. Run 'make' to build"
echo ""
echo "Useful commands:"
echo "- 'htop' to monitor system resources"
echo "- 'make -j$(nproc)' to compile using all CPU cores" 