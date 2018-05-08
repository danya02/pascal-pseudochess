{begin algorithm.pp}
function greedy_solver(b:chessboard):move;
var x,y:integer;
var start_score,max_my_score,min_other_score:scores;
var max_my_move,min_other_move,current_move:move;
var edit_board:chessboard;
begin
  start_score:=get_hit_scores(b);
  for x:=1 to 8 do
    for y:=1 to 8 do
      if not b.board[x][y].occupied then
        for pi:=1 to b.my_pieces_num do
          begin
            edit_board:=shallow_board(b);
            current_move.piece = b.my_pieces[pi];
            current_move.x:=x;
            current_move.y:=y;
          end;
end;
{end algorithm.pp}
