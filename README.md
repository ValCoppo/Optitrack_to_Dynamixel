# run

This project is a port of https://github.com/b4be1/packet-client-linux, created by Boris Belousov (Ph.D) of the German Research Centre for Artificial Intelligence.
Created for use in Professor Yasemin Ozkan-Aydin's (Ph.D) lab at the University of Notre Dame by Val Coppo.


- **Dynamixel SDK (C++ core)** from ROBOTIS for controlling Dynamixel servos
- **PacketClient** code for receiving OptiTrack NatNet packets


---

## Prerequisites

- A Raspberry Pi 3b+ or higher with:
  - **Git**
  - **GNU Make**
  - **GCC/G++** (with C++11 support)
  - **pthread** and **rt** libraries (usually installed by default)

## Installation & Build

1. **Download or clone** this directory onto your board:

   ```bash
   git clone https://github.com/ValCoppo/Optitrack_to_Dynamixel my_project
   cd my_project
   ```

2. **Build** everything with a single command:

   ```bash
   make
   ```

   This will:

   1. Clone the DynamixelSDK repo into `third_party/dynamixel_sdk` (if not already present)
   2. Build the C++ SDK core (`libdxl_sbc_cpp.so`) under `third_party/dynamixel_sdk/c++/build/linux_sbc`
   3. Compile your combined PacketClient + Dynamixel code (`run.cpp`) into `build/run`

## Usage

After a successful build, run the application with:

```bash
./build/run <OptiTrack_IP> <Local_IP>
```

- **`<OptiTrack_IP>`**: IP address of your NatNet server (e.g., OptiTrack computer)
- **`<Local_IP>`**: IP address of your local ip on the Pi

The program will continuously stream position data from OptiTrack and send commands to your Dynamixel motors.

## Cleaning Up

To remove all generated files and force a rebuild of the SDK next time:

```bash
make clean
```


---

To remove all generated files and force a rebuild of the SDK next time:

make clean
