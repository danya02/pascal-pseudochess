all: fpc
fpc: concat compile-fpc
abc: concat compile-abc

concat: clean
	cat imports.pp >> outp.pas
	cat log.pp >> outp.pas
	cat data_types.pp >> outp.pas
	cat debug.pp >> outp.pas
	cat convert.pp >> outp.pas
	cat score_actions.pp >> outp.pas
	cat parse_past.pp >> outp.pas
	cat get_hit.pp >> outp.pas
	cat algorithm.pp >> outp.pas
	cat run_solver.pp >> outp.pas
	cat main.pp >> outp.pas
clean:
	rm -f outp*

compile-fpc:
	fpc outp.pas

compile-abc:
	mono compiler/pabcnetc.exe outp.pas
