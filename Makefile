all: py-typecheck py-lint
	venv/bin/python -m pp_up

py-typecheck: venv/pip.done
	venv/bin/python -m mypy --strict pp_up

py-lint: venv/pip.done
	venv/bin/python -m pylint pp_up

build: venv/pip.done
	venv/bin/python setup.py sdist bdist_wheel
# Upload via venv/bin/python -m twine upload dist/pp_up-$VER*

venv/pip.done: venv setup.py
	venv/bin/python -m pip install .[develop]
	touch $@

venv:
	python3 -m venv venv
