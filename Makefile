# install-deps:
# 	ansible-galaxy collection install community.general

create-venv:
	virtualenv .venv --python=python3.9
	pip3 install yamllint ansible-lint ansible molecule-docker molecule-plugins
	ansible-galaxy collection install community.docker

run-local:
	ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml

# run-virtualbox:
# 	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini

molecule-test:
	molecule test

docker-build-arch:
	docker build -t sigma-arch .

run-vagrant-arch:
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant destroy --force
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant up
	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini
	VAGRANT_VAGRANTFILE=Vagrantfile-arch vagrant destroy --force

run-vagrant-ubuntu:
	VAGRANT_VAGRANTFILE=Vagrantfile-ubuntu vagrant destroy --force
	VAGRANT_VAGRANTFILE=Vagrantfile-ubuntu vagrant up
	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini
	VAGRANT_VAGRANTFILE=Vagrantfile-ubuntu vagrant destroy --force
