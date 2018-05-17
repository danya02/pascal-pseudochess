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
        if b.board[i][j].occupied then
          write(b.board[i][j].piece,b.board[i][j].alignment)
        else
          write('  ');
      writeln;
    end;
end;
procedure output_hits(b:chessboard);
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
        begin
          if b.board[j][i].hit_by_1 then write('1') else write(' ');
          if b.board[j][i].hit_by_2 then write('2') else write(' ');
        end;
      writeln;
    end;
end;
procedure output_alt_moves(a,b:scores);
begin
  info('Selecting between options of score ('+inttostr(a.score_of_1)+';'+inttostr(a.score_of_2)+') and ('+inttostr(b.score_of_1)+';'+inttostr(b.score_of_2)+')...')
end;
{end debug.pp}
