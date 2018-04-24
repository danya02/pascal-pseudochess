all: concat compile

concat: clean
	cat main.pp >> outp.pp
clean:
	rm -f outp*

compile:
	fpc outp.pp
