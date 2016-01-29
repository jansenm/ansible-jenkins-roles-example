
ifndef DEBUG
.SILENT:
endif

RST2HTML=rst2html

all: roles/README.html

roles/README.html: roles/README.rst
	@echo "Converting roles/README.rst"
	cd roles; $(RST2HTML) README.rst > README.html

