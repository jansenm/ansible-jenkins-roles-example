
ifndef DEBUG
.SILENT:
endif

RST2HTML=rst2html

all: roles/README.html README.html

%.html: %.rst
	@echo "Converting $*.rst"
	$(RST2HTML) $*.rst > $*.html


