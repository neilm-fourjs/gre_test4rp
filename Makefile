# Automatic Makefile made by make4js by N.J.M.

export FGLLDPATH=$(GENERODIR)/gre/lib

FGLVER:=$(shell fglrun -V | head -1 | awk '{FS=" ";}{print $$2}')
TARGETDIR=bin-$(FGLVER)
FGLLDPATH=$(GREDIR)/lib

fgl_obj1 =  \
	 gre_test4rp.$(4GLOBJ)

fgl_frm1 =  \
	 filelist.$(FRMOBJ) \
	 gre_test4rp.$(FRMOBJ)

PRG1=gre_test4rp.42r

lib1=$(GREDIR)/lib/libgre.42x
#ARG1=./customer_files/printInvoices.xml
#ARG2=./customer_files/printInvoices.4rp
#ARG3=PDF
#ARG4=report.pdf

include ./Make_fjs.inc

$(TARGETDIR):
	mkdir $@

move: $(TARGETDIR) $(PRG1)
	$(info Moving Objects to bin-$(FGLVER) )
	@mv *.42? $(TARGETDIR)
