
export VCPKG_ROOT=/home/listenai/Applications/vcpkg

export spdlog_DIR=${VCPKG_ROOT}/installed/x64-linux/share/spdlog
export fmt_DIR=${VCPKG_ROOT}/installed/x64-linux/share/fmt/
export Catch2_DIR=${VCPKG_ROOT}/installed/x64-linux/share/catch2
export asio_DIR=${VCPKG_ROOT}/installed/x64-linux/share/asio


cmake -G Ninja -B build && cmake --build build --config Release

wget https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
wget https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q1-update/+download/gcc-arm-none-eabi-4_9-2015q1-20150306-linux.tar.bz2
sudo tar -xvf gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2 -C /usr/local/
sudo tar -xvf gcc-arm-none-eabi-4_9-2015q1-20150306-linux.tar.bz2 -C /usr/local/

export TMP=/media/listenai/TsMax/Bluetooth/Tools_src/temp
mkdir ${TMP}
export GNUARMEMB_TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-10.3-2021.10/bin
cmake -G Ninja -B build -DCOMPILE_CONNECTIVITY=1 -DCONNECTIVITY_VERSION=1.0.0

cmake --build build --target compile_connectivity