COMPASS = $(shell type compass 2>/dev/null)
STEPUP = $(shell type stepup 2>/dev/null)
DATE = $(shell date +'%Y_%m_%d_%H%M%S')

starman:
	starman -IMy-Web-App/lib --listen :5000 --workers 5 --preload-app My-Web-App/script/my_web_app.psgi

server:
	perl My-Web-App/script/my_web_app_server.pl

deps_perl:
	cpanm -n Module::Install Module::Install::Catalyst
	cpanm -n --installdeps ./My-Web-App/

db_deploy:
	perl bin/db_deploy.pl

db_create_ddl:
	perl bin/db_create_ddl.pl
