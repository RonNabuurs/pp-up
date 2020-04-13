all: py-typecheck
	venv/bin/python -m pp_up

py-typecheck: venv/pip.done
	venv/bin/python -m mypy --strict pp_up

venv/pip.done: venv setup.py
	venv/bin/python -m pip install .[develop]
	touch $@

venv:
	python3 -m venv venv
