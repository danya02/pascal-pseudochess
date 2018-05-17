{begin algorithm.pp}
function greedy_solver(var b:chessboard):move;
var x,y,i:integer;
var start_score,max_my_score,min_other_score,current_score:scores;
var max_my_move,min_other_move,current_move:move;
var edit_board:chessboard;
var s:string;
begin
  max_my_score.score_of_1:=0;
  max_my_score.score_of_2:=0;
  min_other_score.score_of_1:=9999;
  min_other_score.score_of_2:=9999;
  start_score:=get_hit_scores(b);
  for x:=1 to 8 do
    for y:=1 to 8 do
      if not b.board[x][y].occupied then
        for i:=1 to b.my_pieces_num do
          begin
            edit_board:=shallow_board(b);
            current_move.piece := b.my_pieces[i];
            current_move.x:=x;
            current_move.y:=y;
            apply_move(edit_board,current_move);
            current_score:=get_hit_scores(edit_board);
            if my_score(current_score,b)>my_score(max_my_score,b) then
              begin
                max_my_score:=current_score;
                max_my_move:=current_move;
              end;
            if other_score(current_score,b)<other_score(min_other_score,b) then
              begin
                min_other_score:=current_score;
                min_other_move:=current_move;
              end;
          end;
  output_alt_moves(max_my_score,min_other_score);
  readln(s);
  if delta_score(b,max_my_score,min_other_score)>0 then
    begin
      debug('Decided that my score will be higher.');
      greedy_solver:=max_my_move;
    end
  else
    begin
      debug('Decided that other score will be lower.');
      greedy_solver:=min_other_move;
    end;
end;
{end algorithm.pp}
