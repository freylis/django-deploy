ARCHIVE:="django_deploy.tar"
CURRENT_DIR:=$(CURDIR)

release: start deploy

start:
	ansible-playbook -i django-deploy/hosts django-deploy/root-playbook.yml

deploy:
	tar -cf /tmp/$(ARCHIVE) *
	ansible-playbook -i django-deploy/hosts django-deploy/user-playbook.yml
	rm -rf /tmp/$(ARCHIVE)