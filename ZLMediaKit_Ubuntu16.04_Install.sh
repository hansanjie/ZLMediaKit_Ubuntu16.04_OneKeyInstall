#--------开始编译安装流媒体ZLMediaKit-------
# 更新包索引
sudo apt-get update

# 安装编译器
sudo apt-get install -y build-essential

# 安装cmake
sudo apt-get install -y cmake

# 安装依赖库
# 安装openssl，用于rtmp复杂握手模式和https/rtsps功能
sudo apt-get install -y libssl-dev

# 如果需要安装ffmpeg
sudo apt-get install -y ffmpeg

# 国内用户推荐从同步镜像网站gitee下载，安装ZLMediaKit
cd $HOME
git clone --depth 1 https://gitee.com/xia-chu/ZLMediaKit
cd ZLMediaKit
# 千万不要忘记执行这句命令
git submodule update --init
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# 构建完成后，可找到MediaServer执行文件在以下目录
# 替换Release为Debug可以获取debug版本
cd $HOME/ZLMediaKit/release/linux/Release
# 以守护进程模式启动
./MediaServer -d &

#--------结束编译安装流媒体ZLMediaKit-------