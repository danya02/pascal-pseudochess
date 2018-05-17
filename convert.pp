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
  shallow_board:=b1;
end;

function piece2score(p:string):integer;
begin
  case ord(p[1]) of
    75:piece2score:=9; {K}
    81:piece2score:=8; {Q}
    82:piece2score:=5; {R}
    78:piece2score:=3; {N}
    66:piece2score:=3; {B}
    80:piece2score:=1; {P}
    else begin
      wtf('Piece '+p+' unknown!');
      piece2score:=-666;
    end;
  end;
end;

function cell2int(c:string):integer;
begin
if length(c)=0 then wtf('Length zero!') else
  case ord(c[1]) of {Below, ords from A to H}
    65:cell2int:=1;
    66:cell2int:=2;
    67:cell2int:=3;
    68:cell2int:=4;
    69:cell2int:=5;
    70:cell2int:=6;
    71:cell2int:=7;
    72:cell2int:=8;
    else begin
      wtf('Cell letter '+c+' unknown!');
      cell2int:=1;
    end;
  end;
end;
function int2cell(c:integer):string;
begin
  case c of
    1:int2cell:='A';
    2:int2cell:='B';
    3:int2cell:='C';
    4:int2cell:='D';
    5:int2cell:='E';
    6:int2cell:='F';
    7:int2cell:='G';
    8:int2cell:='H';
    else begin
      wtf('Cell number '+inttostr(c)+' unknown!');
      int2cell:='W';
    end;
  end;
end;

function move2string(m:move):string;
var s:string;
begin
  s:=m.piece;
  s:=s+int2cell(m.x);
  s:=s+inttostr(m.y);
  move2string:=s;
end;
procedure apply_move(var b:chessboard; m:move);
begin
  b.board[m.x][m.y].piece:=m.piece;
  b.board[m.x][m.y].occupied:=true;
  b.board[m.x][m.y].alignment:=b.my_alignment;
  b.board[m.x][m.y].score:=piece2score(m.piece);
end;

{end convert.pp}
