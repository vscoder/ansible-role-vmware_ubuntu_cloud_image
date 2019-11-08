# VARIABLES

# molecule executable path
MOLECULE?=./.venv/bin/molecule

install_ansible_venv:
	test -d ./.venv || python3 -m venv ./.venv
	./.venv/bin/pip install -r requirements.txt
	echo To activate python virtual environment, run command:
	echo . ./.venv/bin/activate

install_ansible_virtualenv:
	test -d ./.venv || virtualenv ./.venv
	./.venv/bin/pip install -r requirements.txt
	echo To activate python virtual environment, run command:
	echo source ./.venv/bin/activate

molecule_static_analyse:
	. ./.venv/bin/activate && \
	${MOLECULE} lint && \
	${MOLECULE} syntax
