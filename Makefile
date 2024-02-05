all: Makefile.coq
	$(MAKE) -f Makefile.coq all

clean: Makefile.coq
	$(MAKE) -f Makefile.coq cleanall

Makefile.coq: _CoqProject
	coq_makefile -f _CoqProject -o Makefile.coq

_CoqProject Makefile: ;

%: Makefile.coq
	$(MAKE) -f Makefile.coq $@

.PHONY: all clean

doc:
	../coq2html/coq2html -title "Robust Mean" -d html/ -Q . robustmean -coqlib https://coq.inria.fr/doc/V8.18.0/stdlib/ -external https://math-comp.github.io/htmldoc/ mathcomp.ssreflect -external https://math-comp.github.io/htmldoc/ mathcomp.algebra ./*.v ./*.glob

