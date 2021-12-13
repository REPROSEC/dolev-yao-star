CACHE_DIR     ?= $(DY_HOME)/.cache/symbolic
HINT_DIR      ?= $(DY_HOME)/.hints/symbolic

.PHONY: all verify clean

all:
	rm -f .depend.symbolic && $(MAKE) .depend.symbolic
	$(MAKE) verify

LIB_BASE_FST_FILES = $(addprefix $(DY_HOME)/,SecrecyLabels.fst CryptoEffect.fst GlobalRuntimeLib.fst LabeledRuntimeAPI.fst LabeledPKI.fst AttackerAPI.fst) $(addprefix $(DY_HOME)/symbolic/,CryptoLib.fst LabeledCryptoAPI.fst)
LIB_BASE_CMX_FILES = ocaml-symbolic/SecrecyLabels.cmx ocaml-symbolic/CryptoLib.cmx ocaml-symbolic/CryptoEffect.cmx ocaml-symbolic/GlobalRuntimeLib.cmx ocaml-symbolic/LabeledCryptoAPI.cmx ocaml-symbolic/LabeledRuntimeAPI.cmx ocaml-symbolic/LabeledPKI.cmx ocaml-symbolic/AttackerAPI.cmx

FSTAR_INCLUDE_DIRS = $(DY_HOME) $(DY_HOME)/symbolic

FSTAR_FLAGS = --cmi \
  --warn_error -331 \
  --cache_checked_modules --cache_dir $(CACHE_DIR) \
  --already_cached "+Prims +FStar +LowStar +C +Spec.Loops +TestLib" \
  $(addprefix --include ,$(FSTAR_INCLUDE_DIRS))

FSTAR = $(FSTAR_HOME)/bin/fstar.exe $(FSTAR_FLAGS) $(OTHERFLAGS)

ENABLE_HINTS = --use_hints --use_hint_hashes --record_hints # --query_stats

ALL_SOURCES = $(wildcard *.fst) $(wildcard *.fsti)

ROOTS = $(filter-out $(FIXME),$(ALL_SOURCES))

.depend.symbolic: $(HINT_DIR) $(CACHE_DIR)
	$(info $(ROOTS))
	$(FSTAR) --cmi --dep full $(ROOTS) --extract '* -Prims -LowStar -FStar' > $@

include .depend.symbolic

$(HINT_DIR):
	mkdir -p $@

$(CACHE_DIR):
	mkdir -p $@

$(CACHE_DIR)/%.checked: | .depend.symbolic $(HINT_DIR) $(CACHE_DIR)
	$(FSTAR) $< $(ENABLE_HINTS) --hint_file $(HINT_DIR)/$(notdir $*).hints

verify: $(addsuffix .checked, $(addprefix $(CACHE_DIR)/,$(ROOTS)))

# Targets for interactive mode

%.fst-in:
	$(info $(FSTAR_FLAGS) \
	  $(ENABLE_HINTS) --hint_file $(HINT_DIR)/$(basename $@).fst.hints)

%.fsti-in:
	$(info $(FSTAR_FLAGS) \
	  $(ENABLE_HINTS) --hint_file $(HINT_DIR)/$(basename $@).fsti.hints)

#OCaml extraction
CODEGEN=OCaml

ifeq ($(OS),Windows_NT)
  export OCAMLPATH := $(FSTAR_HOME)/bin;$(OCAMLPATH)
else
  export OCAMLPATH := $(FSTAR_HOME)/bin:$(OCAMLPATH)
endif

OCAMLOPT = ocamlfind opt -package fstarlib -thread -linkpkg -linkall -g -I ocaml-symbolic -w -8-20-26
OCAMLSHARED = ocamlfind opt -shared -package fstar-tactics-lib -g -I ocaml-symbolic -w -8-20-26

.PRECIOUS: %.ml
%.ml:
	$(FSTAR) --codegen $(CODEGEN) \
	    --include .. --odir ocaml-symbolic --extract_module $(basename $(notdir $(subst _,.,$@))) \
	    $(notdir $(subst _,.,$(subst .ml,.fst,$@)))

%.cmx: %.ml
	$(OCAMLOPT) -c $< -o $@



# Clean targets

SHELL=/bin/bash

clean:
	rm -rf ocaml-symbolic *~

distclean: clean
	rm -rf .cache/*

