PREFIX ?= /usr/local

install: bin/vdeploy
	mkdir -p $(PREFIX)/$(dir $<)
	cp $< $(PREFIX)/$<

uninstall:
	rm -f $(PREFIX)/bin/vdeploy

.PHONY: install uninstall
