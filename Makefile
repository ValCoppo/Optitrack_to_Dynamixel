##################################################
# PROJECT:   DXL Protocol 2.0 sync_read_write
# AUTHOR:    Custom
##################################################

# Target executable
TARGET       := sync_read_write

# Where to stash object files
DIR_OBJS     := build/linux_sbc/.objects

# Your single source file
SOURCES      := main.cpp

# Map SOURCES → object paths under DIR_OBJS
OBJECTS      := $(patsubst %.cpp,$(DIR_OBJS)/%.o,$(SOURCES))

# Compiler settings
CC           := g++
CX           := g++
CCFLAGS      := -std=c++11 -O2 -Wall -Iinclude/dynamixel_sdk
CXFLAGS      := $(CCFLAGS)

# Linker flags
LIBRARIES    := -ldxl_sbc_cpp -lrt -lpthread

# Default rule
all: make_directory $(TARGET)

# Link step: pull in objects and link against LinuxSBC libs
$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ -Lbuild/linux_sbc $(LIBRARIES)

# Compile .cpp → .o
$(DIR_OBJS)/%.o: %.cpp
	$(CX) $(CXFLAGS) -c $< -o $@

# Ensure object directory exists
make_directory:
	mkdir -p $(DIR_OBJS)

# Clean up everything
clean:
	rm -rf $(TARGET) $(DIR_OBJS) core *~ *.a *.so *.lo

.PHONY: all clean make_directory
