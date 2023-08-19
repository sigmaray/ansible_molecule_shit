install-deps:
	ansible-galaxy collection install community.general

# run-virtualbox:
# 	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini

run-local:
	ansible-playbook playbook.yml --connection=local

molecule-test:
	molecule test

docker-build:
	docker build -t sigma-arch .

run-vagrant-virtualbox-arch:
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant destroy --force
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant up
	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant destroy --force

run-vagrant-virtualbox-debian:
	VAGRANT_VAGRANTFILE=Vagrantfile-debian vagrant destroy --force
	VAGRANT_VAGRANTFILE=Vagrantfile-debian vagrant up
	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini
	VAGRANT_VAGRANTFILE=Vagrantfile-debian vagrant destroy --force
