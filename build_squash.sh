# squashfs BUILD IMAGE TOOLS FOR MINI2440
set -e


PWD_PATH=`pwd`
SRC_PATH=${PWD_PATH}/output/target/
DEST_IMAGE=${PWD_PATH}/rootfs.squashfs

# clean env
rm -fv ${DEST_IMAGE}

# mkfs.squashfs
#mkfs.ubifs -m ${PAGE_SIZE} -e ${BLOCK_SIZE} -c 3706 -r ${SRC_PATH} ${DEST_IMAGE_TMP}

#ubinize -o ${DEST_IMAGE} -m 512 -p 16KiB ubinize.cfg
#ubinize -o ${DEST_IMAGE} -m 512 -p 16KiB -s 256 ubinize.cfg


# chmod 
chmod 777 ${DEST_IMAGE}
ls -lh ${DEST_IMAGE}


# cp 
cp -av ${DEST_IMAGE} /tftproot/mini2440/
