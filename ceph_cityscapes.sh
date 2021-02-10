# Download devkit
git clone https://github.com/mcordts/cityscapesScripts /opt/repo/UPSNet/lib/dataset_devkit/cityscapesScripts

# Download coco format anntations

mkdir -p /mnt/data/cityscapes/annotations

if [ ! -f /mnt/data/cityscapes/annotations/instancesonly_gtFine_train.json ]; then
    curl http://www.yuwenxiong.com/dataset/cityscapes/annotations/instancesonly_gtFine_train.json -o /mnt/data/cityscapes/annotations/instancesonly_gtFine_train.json
fi

if [ ! -f /mnt/data/cityscapes/annotations/instancesonly_gtFine_val.json ]; then
    curl http://www.yuwenxiong.com/dataset/cityscapes/annotations/instancesonly_gtFine_val.json -o /mnt/data/cityscapes/annotations/instancesonly_gtFine_val.json
fi

if [ ! -f /mnt/data/cityscapes/annotations/cityscapes_fine_val.json ]; then
    curl http://www.yuwenxiong.com/dataset/cityscapes/annotations/cityscapes_fine_val.json -o /mnt/data/cityscapes/annotations/cityscapes_fine_val.json
fi

cd /mnt/data/cityscapes

if [ ! -d images ]; then
    mkdir images
    cp /mnt/data/cityscapes/leftImg8bit/train/*/*.png images
fi

if [ ! -d labels ]; then
    mkdir labels
    cp /mnt/data/cityscapes/gtFine/train/*/*labelIds.png labels
fi

if [ ! -d panoptic ]; then
    curl http://www.yuwenxiong.com/dataset/cityscapes/annotations/panoptic.zip -o panoptic.zip
    unzip -q panoptic.zip
fi

