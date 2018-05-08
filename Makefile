all: concat compile

concat: clean
	cat imports.pp >> outp.pp
	cat log.pp >> outp.pp
	cat data_types.pp >> outp.pp
	cat debug.pp >> outp.pp
	cat convert.pp >> outp.pp
	cat score_actions.pp >> outp.pp
	cat parse_past.pp >> outp.pp
	cat get_hit.pp >> outp.pp
	cat algorithm.pp >> outp.pp
	cat run_solver.pp >> outp.pp
	cat main.pp >> outp.pp
clean:
	rm -f outp*

compile:
	fpc outp.pp
