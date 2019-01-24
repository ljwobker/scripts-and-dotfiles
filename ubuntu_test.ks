
#System language
lang en_US
langsupport en_US

#System keyboard
keyboard us

#System mouse
mouse

#System timezone
timezone America/New_York

#Root password
rootpw --disabled

#Initial user (user with sudo capabilities) 
user lwobker --fullname "LJ Wobker" --password notsecure

#Reboot after installation
reboot

#Use text mode install
text

#Install OS instead of upgrade
install

#Installation media
#cdrom
#nfs --server=server.com --dir=/path/to/ubuntu/
#url --url http://server.com/path/to/ubuntu/
#url --url ftp://server.com/path/to/ubuntu/
#url --url http://us.archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/

#System bootloader configuration
bootloader --location=mbr

#Clear the Master Boot Record
zerombr yes

#Partition clearing information
clearpart --all --initlabel

#Basic disk partition
part / --fstype ext4 --size 1 --grow --asprimary
part swap --size 2048
part /boot --fstype ext4 --size 256 --asprimary

#Advanced partition
#part /boot --fstype=ext4 --size=500 --asprimary
#part pv.aQcByA-UM0N-siuB-Y96L-rmd3-n6vz-NMo8Vr --grow --size=1
#volgroup vg_mygroup --pesize=4096 pv.aQcByA-UM0N-siuB-Y96L-rmd3-n6vz-NMo8Vr
#logvol / --fstype=ext4 --name=lv_root --vgname=vg_mygroup --grow --size=10240 --maxsize=20480
#logvol swap --name=lv_swap --vgname=vg_mygroup --grow --size=1024 --maxsize=8192

#System authorization infomation
auth  --useshadow  --enablemd5

#Network information
#network --bootproto=dhcp --device=eth0
network --bootproto=dhcp


#Firewall configuration
#firewall --disabled --trust=eth0 --ssh 

#Do not configure the X Window System
skipx

%packages
openssh-server
wget
curl
htop
kexec-tools


%pre

sleep 3

%end



%post --nochroot

(
    sed -i "s;quiet;quiet console=ttyS0;" /target/etc/default/grub
    sed -i "s;quiet;quiet console=ttyS0;g" /target/boot/grub/grub.cfg
) 1> /target/root/post_install.log 2>&1

wget http://192.168.15.150/MEBENEW
wget http://192.168.15.150/MEBENEW
wget http://192.168.15.150/MEBENEW

%end
