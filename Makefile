#!/bin/bash
all: helloworld        
	@echo BEGIN make squashfs at `date`
	@echo $(TOPDIR)
	cd $(IMAGE_ROOT) && mkdir -p ./dev -m 715
	cd $(IMAGE_ROOT) && mkdir -p ./sys -m 715
	echo "V1.0.2" >$(IMAGE_ROOT)/version
	$(TOPDIR)/build/util/mksquashfs4.0 $(IMAGE_ROOT) \
		$(IMAGEPATH)/$(SQUASHFSFILE) -noappend -b 16384 -all-root \
		-pf $(TOPDIR)/build/dev.txt
	chmod 644 $(IMAGEPATH)/$(SQUASHFSFILE)
	@echo END make squashfs at `date`
helloworld:
	@echo helloworld
	@echo $(TOPDIR)
	cd $(APP_ROOT)/helloworld && $(CC) -o helloworld helloworld.c && $(OLDSTRIP) helloworld
	mv $(APP_ROOT)/helloworld/helloworld $(IMAGE_ROOT)/bin
	@echo END

