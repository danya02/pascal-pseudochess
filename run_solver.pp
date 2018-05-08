{begin run_solver.pp}
function run_solver():string;
var b:chessboard;
var m:move;
begin
  parse_past(b);
  m:=greedy_solver(b);
  run_solver:=move2string(m);
end;
{end run_solver.pp}

