include ../Makefile

APP_BASE_FST_FILES=ISOKem.Messages.fst ISOKem.Sessions.fst
APP_BASE_CMX_FILES=ocaml/ISOKem_Messages.cmx ocaml/ISOKem_Sessions.cmx

APP_FST_FILES=ISOKem.Protocol.fst ISOKem.Debug.fst
APP_CMX_FILES=ocaml/ISOKem_Protocol.cmx ocaml/ISOKem_Debug.cmx

ALL_FST_FILES=$(LIB_BASE_FST_FILES) $(APP_BASE_FST_FILES) $(LIB_FST_FILES) $(APP_FST_FILES)
ALL_CMX_FILES=$(LIB_BASE_CMX_FILES) $(APP_BASE_CMX_FILES) $(LIB_CMX_FILES) $(APP_CMX_FILES)

extract: $(ALL_FST_FILES) $(ALL_CMX_FILES)
test: $(ALL_FST_FILES) $(ALL_CMX_FILES) ocaml/test.exe

ocaml/test.exe: $(ALL_CMX_FILES)
	$(OCAMLOPT) $^ -o $@

copy-concrete:
	cp ../concrete/*_Crypto.ml ocaml
	rm ocaml/*.cmx

test-concrete: copy-concrete $(ALL_CMX_FILES)
	$(OCAMLOPT) $(HACL_CMX_FILES) $(ALL_CMX_FILES) -o ocaml/test-concrete.exe
