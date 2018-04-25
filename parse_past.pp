{begin parse_past.pp}
procedure parse_past(var b:chessboard);
var fdesc:text;
var move,coord1,coord2,piece:string;
var i,m,alignment,icoord1,icoord2:integer;
var pawns,bshops,knights,rooks,queens,kings:integer;
begin
  pawns:=8;bshops:=2;knights:=2;rooks:=2;queens:=1;kings:=1;
  assign(fdesc,'cond.txt');
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
      b.board[icoord1][icoord2].piece:=piece;
      if alignment = b.my_alignment then
        begin
          case piece of 
            'P':dec(pawns);
            'B':dec(bshops);
            'N':dec(knights);
            'R':dec(rooks);
            'Q':dec(queens);
            'K':dec(kings);
            else wtf('Piece '+piece+' not found!');
          end;
        end;
    end;
  for i:=0 to 16 do
    b.my_pieces[i]:=0;
  for i:=1 to pawns do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=1;
    end;
  for i:=1 to bshops do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=3;
    end;
  for i:=1 to knights do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=3;
    end;
  for i:=1 to rooks do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=5;
    end;
  for i:=1 to queens do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=8;
    end;
  for i:=1 to kings do
    begin
      inc(b.my_pieces[0]);
      b.my_pieces[b.my_pieces[0]]:=9;
    end;
end;
{end parse_past.pp}
