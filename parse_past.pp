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
  readln(fdesc,m);
  b.my_alignment:=1;
  if m mod 2=1 then
    b.my_alignment:=2;
  for i:=1 to m do
    begin
      readln(fdesc,move);
      piece:=copy(move,1,1);
      coord1:=copy(move,2,1);
      coord2:=copy(move,3,1);
      alignment:=1+(i mod 2);
      icoord1:=cell2int(coord1);
      icoord2:=9-strtoint(coord2);
      b.board[icoord1][icoord2].occupied:=true;
      b.board[icoord1][icoord2].alignment:=alignment;
      b.board[icoord1][icoord2].score:=piece2score(piece);
      b.board[icoord1][icoord2].piece:=piece;
      if alignment = b.my_alignment then
        begin
          case ord(piece[1]) of 
            80:dec(pawns);
            66:dec(bshops);
            78:dec(knights);
            82:dec(rooks);
            81:dec(queens);
            75:dec(kings);
            else wtf('Piece "'+piece+'" not found!');
          end;
        end;
    end;
  b.my_pieces_num:=0;
  for i:=1 to pawns do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='P';
    end;
  for i:=1 to bshops do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='B';
    end;
  for i:=1 to knights do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='N';
    end;
  for i:=1 to rooks do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='R';
    end;
  for i:=1 to queens do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='Q';
    end;
  for i:=1 to kings do
    begin
      inc(b.my_pieces_num);
      b.my_pieces[b.my_pieces_num]:='K';
    end;
end;
{end parse_past.pp}
