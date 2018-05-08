{begin debug.pp}
procedure output_board(b:chessboard);
var i,j:longint;
begin
  writeln('My alignment: ',b.my_alignment);
  write('My pieces: ');
  for i:=1 to b.my_pieces_num do
    write(b.my_pieces[i],' ');
  writeln;
  writeln('Board:');
  for i:=1 to 8 do
    begin
      for j:=1 to 8 do
        write(b.board[i][j].piece,b.board[i][j].alignment);
      writeln;
    end;
end;
{end debug.pp}
