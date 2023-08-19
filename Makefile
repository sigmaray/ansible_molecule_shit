# install-deps:
# 	ansible-galaxy collection install community.general

create-venv:
	virtualenv .venv --python=python3.9
	pip3 install yamllint ansible-lint ansible molecule-docker
	ansible-galaxy collection install community.docker

run-local:
	ansible-playbook playbook.yml --connection=local

# run-virtualbox:
# 	ansible-playbook playbook.yml --inventory=./inventory-vagrant.ini

molecule-test:
	molecule test

docker-build-arch:
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
