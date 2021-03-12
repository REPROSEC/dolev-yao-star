include ../Makefile

APP_BASE_FST_FILES=ISODH.Messages.fst ISODH.Sessions.fst
APP_BASE_CMX_FILES=ocaml/ISODH_Messages.cmx ocaml/ISODH_Sessions.cmx

APP_FST_FILES=ISODH.Protocol.fst ISODH.Debug.fst
APP_CMX_FILES=ocaml/ISODH_Protocol.cmx ocaml/ISODH_Debug.cmx

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
