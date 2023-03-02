#!/bin/bash
# Copyright 2022 Michael Smith <m@hacktheplanet.be>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as published
# by the Free Software Foundation.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

COMPILE_THREADS=10

# buildroot
pushd build/buildroot
make mrfusion_defconfig
make
popd

echo "COMPILING KERNEL"
# Linux
pushd build/linux-socfpga
make ARCH=arm mrfusion_defconfig
make ARCH=arm -j${COMPILE_THREADSe}
make ARCH=arm socfpga_cyclone5_socdk.dtb
popd
