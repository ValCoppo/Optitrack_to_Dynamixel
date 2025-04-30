Optitrack To Dynamixel 

This project provides a simple, self‑contained setup to build and run a continuous data stream application that integrates:

Dynamixel SDK (C++ core) from ROBOTIS for controlling Dynamixel servos

PacketClient code for receiving OptiTrack NatNet packets



Prerequisites

Raspberry Pi

Git

GNU Make

GCC/G++ (with C++11 support)

pthread and rt libraries (usually installed by default)

Installation & Build

Download or clone this directory onto your board:

git clone <your-repo-url> robot
cd robot

Build the project with:

make

This will:

Clone the DynamixelSDK repo into third_party/dynamixel_sdk (if not already present)

Build the C++ SDK core (libdxl_sbc_cpp.so) under third_party/dynamixel_sdk/c++/build/linux_sbc

Compile your combined PacketClient + Dynamixel code (run.cpp) into build/run

Usage

After a successful build, run the application with:

./build/run <OptiTrack_IP> <Local_IP>

<OptiTrack_IP>: IP address of your NatNet server (e.g., OptiTrack computer)

<Local_IP>: IP address of your local interface on the Pi

The program will continuously stream position data from OptiTrack and send commands to your Dynamixel motors.

Cleaning Up

To remove all generated files and force a rebuild of the SDK next time:

make clean
