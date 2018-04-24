{begin parse_past.pp}
procedure parse_past(var b:chessboard);
var fdesc:text;
var move,coord1,coord2,piece:string;
var i,m,alignment,icoord1,icoord2:longint;
begin
  assign(fdesc,"cond.txt");
  reset(fdesc);
  read(fdesc,m);
  b.my_alignment:=1;
  if m mod 2<>0 then
    b.my_alignment:=2;
  for i:=1 to m do
    begin
      readln(fdesc,move);
      piece:=copy(move,1,1);
      coord1:=copy(move,2,1);
      coord2:=copy(move,3,1);
      alignment:=1 + (i mod 2);
      icoord1:=cell2int(coord1);
      icoord2:=strtoint(coord2);
      b.board[icoord1][icoord2].occupied:=true;
      b.board[icoord1][icoord2].alignment:=alignment;
      b.board[icoord1][icoord2].score:=piece2score(piece);
    end;
end;
{end parse_past.pp}
