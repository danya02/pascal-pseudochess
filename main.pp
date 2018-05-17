{begin main.pp}
var b:chessboard;
var f:text;
begin
  assign(f,'hod.txt');
  rewrite(f);
  writeln(f,run_solver);
  close(f);
end.
{end main.pp}
