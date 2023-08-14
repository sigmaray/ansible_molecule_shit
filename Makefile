install-deps:
	ansible-galaxy collection install community.general

run-virtualbox:
	ansible-playbook playbook.yml --inventory=./inventory-virtualbox.ini

run-local:
	ansible-playbook playbook.yml --connection=local

molecule-test:
	molecule test
