{begin run_solver.pp}
function run_solver():string;
var b:chessboard;
var m:move;
var s:string;
begin
  parse_past(b);
  get_hit_scores(b);
  output_hits(b);
  readln(s);
  m:=greedy_solver(b);
  m.y:=9-m.y;
  apply_move(b,m);
  get_hit_scores(b);
  output_hits(b);
  readln(s);
  run_solver:=move2string(m);
end;
{end run_solver.pp}
