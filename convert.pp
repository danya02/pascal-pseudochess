{begin convert.pp}
function shallow_board(b:chessboard):chessboard;
var b1:chessboard;
var i,j:integer;
{
m     m   mm   mmmmm  mm   m mmmmm  mm   m   mmm 
#  #  #   ##   #   "# #"m  #   #    #"m  # m"   "
" #"# #  #  #  #mmmm" # #m #   #    # #m # #   mm
 ## ##"  #mm#  #   "m #  # #   #    #  # # #    #
 #   #  #    # #    " #   ## mm#mm  #   ##  "mmm"

Do NOT edit this without editing data_types.pp!!!}
begin
  for i:=1 to 8 do for j:=1 to 8 do b1.board[i,j]:=b.board[i,j];
  b1.my_alignment:=b.my_alignment;
  for i:=0 to 16 do b1.my_pieces[i]:=b.my_pieces[i];
  b1.my_pieces_num:=b.my_pieces_num;
end;

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

procedure apply_move(var b:chessboard; m:move);
begin
  b.board[m.x][m.y].piece:=m.piece;
  b.board[m.x][m.y].occupied:=true;
  b.board[m.x][m.y].alignment:=b.my_alignment;
  b.board[m.x][m.y].score:=piece2score(m.piece);
end;

{end convert.pp}
