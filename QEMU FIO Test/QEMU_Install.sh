$sudo virt-install --name=vm_ubuntu --ram 4096 
\\--disk path=/home/yuejeong/ubuntu.img,size=20 --vcpus 2 --os-variant ubuntu20.04 
\\--network bridge:virbr0 --graphics none --console pty,target_type=serial 
\\--location /home/yuejeong/qemu1/ubuntu-20.04.3-live-serveramd64.iso,kernel=casper/vmlinuz,initrd=casper/initrd
\\--extra-args 'console=ttyS0,115200n8 serial'