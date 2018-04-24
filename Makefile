all: concat compile

concat: clean
	cat imports.pp >> outp.pp
	cat data_types.pp >> outp.pp
	cat convert.pp >> outp.pp
	cat parse_past.pp >> outp.pp
	cat main.pp >> outp.pp
clean:
	rm -f outp*

compile:
	fpc outp.pp
