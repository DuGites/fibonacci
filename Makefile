.PHONY: pycodestyle install-requirements start-dev-server run-migrations clean run-tests

print_msg = @printf "\n\033[1;34m***%s***\033[0m\n" "$(1)"

all:
	@echo 'pycodestyle               check pycodestyle compliance'
	@echo 'install-requirements      Install the necessary packages in the virtualenv'
	@echo 'start-dev-server          Start the Django Development Server'
	@echo 'run-migrations            Complete the Django migrations if you have db models'
	@echo 'run-tests                 Run all tests'
	@echo 'clean                     Clean __pycache__ and all compiled files'


install-requirements:
	$(call print_msg, Installing Requirements... )
	test -d venv3 || virtualenv -p python3 venv3
	pip install -r requirements.txt

clean:
	@find . -name "*.pyc" -exec rm -f {} \;
	@find . -name "__pycache__" -delete


pycodestyle: install-requirements
	$(call print_msg, Running pycodestyle... )
	@pycodestyle --max-line-length=79 *.py


start-dev-server: install-requirements
	$(call print_msg, Starting Dev Server... )
	@venv3/bin/python3 manage.py runserver


run-migrations: install-requirements
	$(call print_msg, Running Migrations... )
	@venv3/bin/python3 manage.py migrate


run-tests: clean
	$(call print_msg, Running Unit tests... )
	@venv3/bin/python3 manage.py test


coverage-tests:
	$(call print_msg, Running Coverage tests... )
	@coverage run --source='.' manage.py test series


coverage-reports: clean pycodestyle coverage-tests
	@coverage report | grep */tests.py | grep 100% >/dev/null || \
	{ echo 'Unit tests coverage is incomplete.'; exit 1; }

start-uwsgi: install-requirements
	$(call print_msg, Starting Uwsgi Server... )
	@touch uwsgi.log fib-app.log

	@uwsgi --ini uwsgi.ini
	$(call print_msg, Uwsgi Server started in background ... )

stop-uwsgi: install-requirements
	$(call print_msg, Stopping Uwsgi Server... )
	[ ! -f /tmp/fib-app.pid ] || uwsgi --stop /tmp/fib-app.pid
	$(call print_msg, Uwsgi Server Stopped... )
