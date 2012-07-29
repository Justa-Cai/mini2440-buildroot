#!/bin/sh
echo "--"
echo $MDEV $ACTION >> /tmp/log
echo ""
#MDEV=sda1
#ACTION=add
mount_path=/mnt/$MDEV

mdev_add() {
    case "$MDEV" in 
        mmcblk[0-9]p* | [hs]d[a-z][0-9]*)
            [ ! -d $mount_path ] && mkdir -p $mount_path
            mount /dev/$MDEV $mount_path
            ;;

        *)
            ;;
    esac
}

mdev_del() {
    case "$MDEV" in 
        mmcblk[0-9]p* | [hs]d[a-z][0-9]*)
            umount $mount_path
            ;;
        *)
            ;;
    esac
}


case "$ACTION" in
    add)
        mdev_add
        ;;
    
    remove)
        mdev_del
        ;;
    *)
        ;;
esac
    

