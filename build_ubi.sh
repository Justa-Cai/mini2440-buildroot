# UBI BUILD IMAGE TOOLS FOR MINI2440
set -e

# 以下这些信息 可以通过ubinfo 工具获取...
BLOCK_SIZE=15360
PAGE_SIZE=512
MAX_ERASE_SIZE=10000

PWD_PATH=`pwd`
SRC_PATH=${PWD_PATH}/output/target/
DEST_IMAGE_TMP=${PWD_PATH}/rootfs.ubi.tmp
DEST_IMAGE=${PWD_PATH}/rootfs.ubi

# clean env
rm -fv ${DEST_IMAGE}

# mkfs.ubifs 生成的镜像只能用于ubi分区的烧写，如果是要写入MTD分区，需要使用ubinize工具转换
chown -R root:root ${SRC_PATH} 
ls -l ${SRC_PATH}/bin/busybox 
mkfs.ubifs -m ${PAGE_SIZE} -e ${BLOCK_SIZE} -c ${MAX_ERASE_SIZE} -r ${SRC_PATH} ${DEST_IMAGE}

#ubinize -o ${DEST_IMAGE} -m 512 -p 16KiB -s 512 ubinize.cfg


# chmod 
chmod 777 ${DEST_IMAGE}
ls -lh ${DEST_IMAGE}


# cp 
cp -av ${DEST_IMAGE} /tftproot/mini2440/
