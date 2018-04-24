{begin convert.pp}
function piece2score(p:string):integer;
begin
  case p of
    'K':piece2score:=9;
    'Q':piece2score:=8;
    'R':piece2score:=5;
    'N':piece2score:=3;
    'B':piece2score:=3;
    'P':piece2score:=1;
  else begin
    writeln('WTF! Piece ',p,' unknown!');
    piece2score:=-666;
  end;
end;

function cell2int(c:string):integer;
begin
  case c of
    'A':cell2num:=1;
    'B':cell2num:=2;
    'C':cell2num:=3;
    'D':cell2num:=4;
    'E':cell2num:=5;
    'F':cell2num:=6;
    'G':cell2num:=7;
    'H':cell2num:=8;
  else begin
    writeln('WTF! Cell letter ',c,' unknown!');
    cell2num:=1;
  end;
end;
{end convert.pp}
