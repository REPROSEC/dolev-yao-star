include ../Makefile

APP_BASE_FST_FILES=Signal.Messages.fst
APP_BASE_CMX_FILES=ocaml-symbolic/Signal_Messages.cmx

APP_FST_FILES=Signal.Crypto.fst Signal.Core.fst Signal.Sessions.fst Signal.X3DH.fst Signal.DR.fst Signal.Test.fst
APP_CMX_FILES=ocaml-symbolic/Signal_Crypto.cmx ocaml-symbolic/Signal_Core.cmx ocaml-symbolic/Signal_Sessions.cmx ocaml-symbolic/Signal_X3DH.cmx ocaml-symbolic/Signal_DR.cmx ocaml-symbolic/Signal_Test.cmx

ALL_FST_FILES=$(LIB_BASE_FST_FILES) $(APP_BASE_FST_FILES) $(LIB_FST_FILES) $(APP_FST_FILES)
ALL_CMX_FILES=$(LIB_BASE_CMX_FILES) $(APP_BASE_CMX_FILES) $(LIB_CMX_FILES) $(APP_CMX_FILES)

extract: $(ALL_FST_FILES) $(ALL_CMX_FILES)
test: $(ALL_FST_FILES) $(ALL_CMX_FILES) ocaml-symbolic/test.exe

ocaml-symbolic/test.exe: $(ALL_CMX_FILES)
	$(OCAMLOPT) $^ -o $@

