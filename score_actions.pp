{begin score_actions.pp}
function my_score(s:scores, b:chessboard):integer;
begin
  if b.chessboard.my_alignment=1 then my_score:=s.score_of_1 else my_score:=s.score_of_2;
end;
function other_score(s:scores, b:chessboard):integer;
begin
  if b.chessboard.my_alignment=2 then my_score:=s.score_of_1 else my_score:=s.score_of_2;
end;

function delta_score(b:chessboard; s1,s2:scores):integer;
var t1,t2:integer;
begin
  if b.my_alignment=1 then
    begin
      t1:=s1.score_of_1-t1.score_of_2;
      t2:=s2.score_of_1-t2.score_of_2;
      d:=t2-t1;
    end
    else
      t1:=s1.score_of_2-t1.score_of_1;
      t2:=s2.score_of_2-t2.score_of_1;
    end;
  delta_score:=t2-t1;
end;
{end score_actions.pp}
