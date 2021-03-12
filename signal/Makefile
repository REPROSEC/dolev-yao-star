include ../Makefile

APP_BASE_FST_FILES=Signal.Messages.fst
APP_BASE_CMX_FILES=ocaml/Signal_Messages.cmx

APP_FST_FILES=Signal.Crypto.fst Signal.Core.fst Signal.Sessions.fst Signal.X3DH.fst Signal.DR.fst Signal.Test.fst
APP_CMX_FILES=ocaml/Signal_Crypto.cmx ocaml/Signal_Core.cmx ocaml/Signal_Sessions.cmx ocaml/Signal_X3DH.cmx ocaml/Signal_DR.cmx ocaml/Signal_Test.cmx

ALL_FST_FILES=$(LIB_BASE_FST_FILES) $(APP_BASE_FST_FILES) $(LIB_FST_FILES) $(APP_FST_FILES)
ALL_CMX_FILES=$(LIB_BASE_CMX_FILES) $(APP_BASE_CMX_FILES) $(LIB_CMX_FILES) $(APP_CMX_FILES)

ifeq ($(OS),Windows_NT)
  export OCAMLPATH := $(FSTAR_HOME)/bin;$(OCAMLPATH)
else
  export OCAMLPATH := $(FSTAR_HOME)/bin:$(OCAMLPATH)
endif

extract: $(ALL_FST_FILES) $(ALL_CMX_FILES)
test: $(ALL_FST_FILES) $(ALL_CMX_FILES) ocaml/test.exe

ocaml/test.exe: $(ALL_CMX_FILES)
	$(OCAMLOPT) $^ -o $@

copy-concrete:
	cp ../concrete/*_Crypto.ml ocaml
	rm ocaml/*.cmx

test-concrete: copy-concrete $(ALL_CMX_FILES)
	$(OCAMLOPT) $(HACL_CMX_FILES) $(ALL_CMX_FILES) -o ocaml/test-concrete.exe
