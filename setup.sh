#!/bin/bash

# Update system
sudo yum update -y

# Install essential build tools and C++ toolchain
sudo yum groupinstall -y "Development Tools"
sudo yum install -y cmake3 git
sudo yum install -y gcc gcc-c++ gdb make
sudo yum install -y pkgconfig
sudo yum install -y autoconf automake libtool

# Install NASM assembler
sudo yum install -y nasm

# Install GMP and other math libraries
sudo yum install -y gmp-devel
sudo yum install -y openssl-devel

# Install additional useful tools
sudo yum install -y htop # for monitoring CPU/memory usage
sudo yum install -y valgrind # for memory debugging if needed

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

# Create symlink for cmake3 if needed
sudo ln -sf /usr/bin/cmake3 /usr/bin/cmake

echo "Setup complete! System ready for compilation."

# Instructions for the user
echo "Next steps:"
echo "1. You are now in: $(pwd)"
echo "2. Run 'make' to build"
echo ""
echo "Useful commands:"
echo "- 'htop' to monitor system resources"
echo "- 'make -j$(nproc)' to compile using all CPU cores" 