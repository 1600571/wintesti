sudo apt-get update
sudo apt-get install -y git puppetmaster
sudo puppet module install puppetlabs/windows
cd /etc/puppet/modules
git clone https://github.com/1600571/wintesti.git
