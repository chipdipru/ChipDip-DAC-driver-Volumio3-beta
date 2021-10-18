#!/bin/sh

echo "Installing ChipDip DACs..."

sudo cp ChipDip-DAC-driver-Volumio3-beta/snd-soc-chipdip-dac-5.4.83-v7+.ko /lib/modules/`uname -r`/kernel/sound/soc/bcm/snd-soc-chipdip-dac.ko
sudo cp ChipDip-DAC-driver-Volumio3-beta/chipdip-dac.dtbo /boot/overlays/chipdip-dac.dtbo
sudo depmod

sed -i '4 a {"id":"chipdip-master-dac","name":"ChipDip DAC","overlay":"chipdip-dac","alsanum":"2","alsacard":"ChipDipDAC","mixer":"","modules":"","script":"","needsreboot":"yes"},' /volumio/app/plugins/system_controller/i2s_dacs/dacs.json

echo "Reboot to complete installation"
