all: ml/libhaclml.cmxa

ALL_ML_FILES=\
	ml/Lib_IntTypes.ml \
	ml/Lib_UpdateMulti.ml \
	ml/Lib_LoopCombinators.ml \
	ml/Lib_RawIntTypes.ml \
	ml/Lib_Sequence.ml \
	ml/Lib_ByteSequence.ml \
	ml/Spec_Blake2.ml \
	ml/Spec_Hash_Definitions.ml \
	ml/Spec_Loops.ml \
	ml/Spec_Hash_Lemmas0.ml \
	ml/Spec_Hash_PadFinish.ml \
	ml/Spec_SHA1.ml \
	ml/Spec_MD5.ml \
	ml/Spec_SHA2_Constants.ml \
	ml/Spec_SHA2.ml \
	ml/Spec_Agile_Hash.ml \
	ml/Spec_Agile_HMAC.ml \
	ml/Spec_HMAC_Test.ml \
	ml/Vale_Lib_Seqs_s.ml \
	ml/Vale_Def_Words_s.ml \
	ml/Vale_Def_Words_Four_s.ml \
	ml/Vale_Def_Words_Two_s.ml \
	ml/Vale_Def_Words_Seq_s.ml \
	ml/Vale_Def_Opaque_s.ml \
	ml/Vale_Def_Types_s.ml \
	ml/Vale_Math_Poly2_Defs_s.ml \
	ml/Vale_Math_Poly2_s.ml \
	ml/Vale_Math_Poly2_Bits_s.ml \
	ml/Vale_AES_GF128_s.ml \
	ml/Vale_AES_GHash_s.ml \
	ml/Spec_Agile_HKDF.ml \
	ml/Vale_Def_TypesNative_s.ml \
	ml/Vale_Lib_Bv_s.ml \
	ml/Vale_Math_Bits.ml \
	ml/Vale_Lib_Seqs.ml \
	ml/Vale_Def_Prop_s.ml \
	ml/Vale_AES_AES_s.ml \
	ml/Vale_AES_GCTR_s.ml \
	ml/Vale_Lib_Meta.ml \
	ml/Vale_Def_Words_Two.ml \
	ml/Vale_Arch_TypesNative.ml \
	ml/Vale_Def_Words_Seq.ml \
	ml/Vale_Arch_Types.ml \
	ml/Vale_AES_GCM_helpers.ml \
	ml/Vale_AES_GCTR.ml \
	ml/Lib_Meta.ml \
	ml/Spec_HMAC_DRBG_Test_Vectors.ml \
	ml/Vale_Math_Poly2_Defs.ml \
	ml/Spec_Frodo_Lemmas.ml \
	ml/Spec_Matrix.ml \
	ml/Spec_Frodo_Pack.ml \
	ml/Spec_SHA3_Constants.ml \
	ml/Spec_GaloisField.ml \
	ml/Spec_AES.ml \
	ml/Spec_AES_Test.ml \
	ml/Spec_Frodo_Random.ml \
	ml/Lib_Sequence_Lemmas.ml \
	ml/Spec_SHA3.ml \
	ml/Spec_Frodo_Gen.ml \
	ml/Spec_Frodo_Params.ml \
	ml/Spec_Frodo_Sample.ml \
	ml/Spec_Frodo_KEM_KeyGen.ml \
	ml/Spec_Frodo_Encode.ml \
	ml/Spec_Frodo_KEM_Encaps.ml \
	ml/Spec_Frodo_KEM_Decaps.ml \
	ml/Spec_Frodo_KEM.ml \
	ml/Vale_Math_Poly2.ml \
	ml/Spec_P256_Definitions.ml \
	ml/Spec_P256_Lemmas.ml \
	ml/Spec_P256.ml \
	ml/Spec_ECDSAP256_Definition.ml \
	ml/Spec_ECDSA.ml \
	ml/Spec_DH.ml \
	ml/Spec_Poly1305.ml \
	ml/Spec_Salsa20.ml \
	ml/Spec_SecretBox.ml \
	ml/Spec_SecretBox_Test.ml \
	ml/Spec_Curve25519_Lemmas.ml \
	ml/Vale_Math_Poly2_Lemmas.ml \
	ml/Vale_Math_Poly2_Bits.ml \
	ml/Vale_AES_GF128.ml \
	ml/Lib_Exponentiation.ml \
	ml/Lib_NatMod.ml \
	ml/Spec_RSAPSS.ml \
	ml/Spec_Chacha20.ml \
	ml/Spec_Chacha20Poly1305.ml \
	ml/Spec_Chacha20Poly1305_Test.ml \
	ml/Vale_AES_GCM_s.ml \
	ml/Spec_Salsa20_Test.ml \
	ml/Spec_Curve25519.ml \
	ml/Spec_Ed25519.ml \
	ml/Spec_Ed25519_Test.ml \
	ml/Spec_HMAC_DRBG.ml \
	ml/Spec_HMAC_DRBG_Test.ml \
	ml/Spec_Curve25519_Test.ml \
	ml/Vale_AES_OptPublic.ml \
	ml/Spec_Agile_Cipher.ml \
	ml/Spec_Cipher_Expansion.ml \
	ml/Spec_Blake2_Test.ml \
	ml/Spec_Box.ml \
	ml/Spec_Box_Test.ml \
	ml/Spec_SHA2_Test.ml \
	ml/Spec_Hash_Lemmas.ml \
	ml/Spec_Agile_AEAD.ml \
	ml/Spec_Agile_DH.ml \
	ml/Spec_Agile_HPKE.ml \
	ml/Spec_HPKE_Test.ml \
	ml/Spec_FFDHE.ml \
	ml/Spec_Chacha20_Test.ml \
	ml/Spec_HKDF_Test.ml \
	ml/Spec_Hash_Test.ml \
	ml/Spec_Poly1305_Test.ml \
	ml/Spec_SHA3_Test.ml \
	ml/Spec_Agile_CTR.ml \
	ml/Spec_Frodo_Test.ml \
	ml/Spec_GF128.ml

TAC = $(shell which tac >/dev/null 2>&1 && echo "tac" || echo "tail -r")

ALL_CMX_FILES = $(subst ml/Lib_Buffer.cmx,ml/Lib_Memzero0.cmx ml/Lib_Buffer.cmx,$(patsubst %.ml,%.cmx,$(shell echo $(ALL_ML_FILES) | $(TAC))))

ifeq ($(OS),Windows_NT)
  export OCAMLPATH := $(FSTAR_HOME)/bin;$(OCAMLPATH)
else
  export OCAMLPATH := $(FSTAR_HOME)/bin:$(OCAMLPATH)
endif

OCAMLOPT = ocamlfind opt -package fstarlib -linkpkg -g -I ml -w -8-20-26
OCAMLSHARED = ocamlfind opt -shared -package fstar-tactics-lib -g -I ml -w -8-20-26

ml/libhaclml.cmxa: $(filter-out ml/Meta_Interface.cmx,$(ALL_CMX_FILES))
	ocamlfind opt -a -o $@ -package fstarlib -g -I ml $^

.PRECIOUS: %.ml
%.cmx: %.ml
	$(OCAMLOPT) -c $< -o $@


