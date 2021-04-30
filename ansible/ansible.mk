ansible-clean:
	git clean -fdx ansible_collections roles

ansible-dep:
	ansible-galaxy install -g -f -r $(TOPDIR)/ansible/requirements.yml
	ansible-galaxy install -g -f -r requirements.yml

ansible-test:
	ansible-inventory -i inventory --graph
	ansible-lint .

ansible-build:

ansible-deploy:
	ansible-playbook -i inventory main.yml

ansible-release:

ansible-facts:
	@env -u ANSIBLE_STDOUT_CALLBACK ansible -i inventory -m ansible.builtin.setup all
