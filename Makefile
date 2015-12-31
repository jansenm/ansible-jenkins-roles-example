# Test


ifndef DEBUG
.SILENT:
endif

RST2HTML=rst2html

all: roles/README.html

roles/README.html: roles/README.rst
	@echo "Converting README.rst"
	$(RST2HTML) roles/README.rst > roles/README.html

