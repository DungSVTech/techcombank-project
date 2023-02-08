#!
sudo su
sudo yum install wget -y
sudo wget <link xdr>
sudo yum -y install selinux-policy-devel
sudo mkdir -p /etc/panw
sudo tar xf xdr_linux_rpm.tar.gz
sudo cp cortex.conf /etc/panw/
sudo rpm --import cortex-xdr-agent.asc
sudo yum -y install ./cortex-7.9.0.82606.rpm