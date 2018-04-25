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
      wtf('Piece '+p+' unknown!');
      piece2score:=-666;
    end;
  end;
end;

function cell2int(c:string):integer;
begin
  case c of
    'A':cell2int:=1;
    'B':cell2int:=2;
    'C':cell2int:=3;
    'D':cell2int:=4;
    'E':cell2int:=5;
    'F':cell2int:=6;
    'G':cell2int:=7;
    'H':cell2int:=8;
    else begin
      wtf('Cell letter '+c+' unknown!');
      cell2int:=1;
    end;
  end;
end;
{end convert.pp}
