{begin get_hit.pp}
procedure mark_as_hit(var p:chessboard;x,y,alignment:integer);
begin
  if (x>8) or (x<1) or (y>8) or (y<1) then
    info('Cell out of range, not marking.')
  else begin
    if alignment=1 then begin p.board[x][y].hit_by_1:=true; debug('Cell ('+inttostr(x)+';'+inttostr(y)+') hit by alignment 1.');end
    else if alignment=2 then begin p.board[x][y].hit_by_2:=true; debug('Cell ('+inttostr(x)+';'+inttostr(y)+') hit by alignment 2.');end
    else wtf('There is no alignment '+inttostr(alignment)+'!');
  end;
end;
procedure get_hit(var p:chessboard);
var i,j,k:integer;
var lim1,lim2,lim3,lim4,lim5,lim6,lim7,lim8:boolean;
begin
  for i:=1 to 8 do
    for j:=1 to 8 do
      begin
        p.board[i][j].hit_by_1:=false;
        p.board[i][j].hit_by_2:=false;
      end;
  for i:=1 to 8 do
    for j:=1 to 8 do
      begin lim1:=false;lim2:=false;lim3:=false;lim4:=false;lim5:=false;lim6:=false;lim7:=false;lim8:=false;
       if p.board[i][j].occupied then
        begin
          with p.board[i][j] do
            case piece of
              'P': begin
                     mark_as_hit(p,i-1,j-(alignment-2),alignment);
                     mark_as_hit(p,i+1,j-(alignment-2),alignment);
                   end;
              'B': for k:=1 to 8 do
                     begin
                       lim1:=lim1 or p.board[i-k][j-k].occupied;
                       lim2:=lim2 or p.board[i-k][j+k].occupied;
                       lim3:=lim3 or p.board[i+k][j-k].occupied;
                       lim4:=lim4 or p.board[i+k][j+k].occupied;
                       if not lim1 then
                         mark_as_hit(p,i-k,j-k,alignment);
                       if not lim2 then
                         mark_as_hit(p,i-k,j+k,alignment);
                       if not lim3 then
                         mark_as_hit(p,i+k,j-k,alignment);
                       if not lim4 then
                         mark_as_hit(p,i+k,j+k,alignment);
                     end;
              'N': begin
                     mark_as_hit(p,i+2,j+1,alignment);                   
                     mark_as_hit(p,i+2,j-1,alignment);                   
                     mark_as_hit(p,i+1,j+2,alignment);                   
                     mark_as_hit(p,i+1,j-2,alignment);                   
                     mark_as_hit(p,i-2,j+1,alignment);                   
                     mark_as_hit(p,i-2,j-1,alignment);                   
                     mark_as_hit(p,i-1,j+2,alignment);                   
                     mark_as_hit(p,i-1,j-2,alignment);                   
                   end;
              'R': for k:=1 to 8 do
                     begin
                       lim1:=lim1 or p.board[i-k][j].occupied;
                       lim2:=lim2 or p.board[i+k][j].occupied;
                       lim3:=lim3 or p.board[i][j-k].occupied;
                       lim4:=lim4 or p.board[i][j+k].occupied;
                       if not lim4 then
                         mark_as_hit(p,i-k,j,alignment);
                       if not lim4 then
                         mark_as_hit(p,i+k,j,alignment);
                       if not lim4 then
                         mark_as_hit(p,i,j-k,alignment);
                       if not lim4 then
                         mark_as_hit(p,i,j+k,alignment);
                     end;
              'Q': for k:=1 to 8 do
                     begin
                       lim1:=lim1 or p.board[i-k][j-k].occupied;
                       lim2:=lim2 or p.board[i-k][j+k].occupied;
                       lim3:=lim3 or p.board[i+k][j-k].occupied;
                       lim4:=lim4 or p.board[i+k][j+k].occupied;
                       lim5:=lim5 or p.board[i-k][j].occupied;
                       lim6:=lim6 or p.board[i+k][j].occupied;
                       lim7:=lim7 or p.board[i][j-k].occupied;
                       lim8:=lim8 or p.board[i][j+k].occupied;
                       if not lim1 then
                         mark_as_hit(p,i-k,j-k,alignment);
                       if not lim2 then
                         mark_as_hit(p,i-k,j+k,alignment);
                       if not lim3 then
                         mark_as_hit(p,i+k,j-k,alignment);
                       if not lim4 then
                         mark_as_hit(p,i+k,j+k,alignment);
                       if not lim5 then
                         mark_as_hit(p,i-k,j,alignment);
                       if not lim6 then
                         mark_as_hit(p,i+k,j,alignment);
                       if not lim7 then
                         mark_as_hit(p,i,j-k,alignment);
                       if not lim8 then
                         mark_as_hit(p,i,j+k,alignment);
                     end;
              'K': begin
                     mark_as_hit(p,i+1,j+1,alignment);
                     mark_as_hit(p,i,j+1,alignment);
                     mark_as_hit(p,i-1,j+1,alignment);
                     mark_as_hit(p,i-1,j,alignment);
                     mark_as_hit(p,i-1,j-1,alignment);
                     mark_as_hit(p,i,j-1,alignment);
                     mark_as_hit(p,i+1,j-1,alignment);
                     mark_as_hit(p,i+1,j,alignment);
                   end;
              end;
            end;
        end;
end;

function get_hit_scores(b:chessboard):scores;
var csc:scores;
var x,y:integer;
begin
  get_hit(b);
  csc.score_of_1:=0;
  csc.score_of_2:=0;
  for x:=1 to 8 do
    for y:=1 to 8 do
      if b.board[x][y].occupied then
        begin
          if b.board[x][y].alignment=1 then
            if b.board[x][y].hit_by_2 then
              csc.score_of_2:=csc.score_of_2+piece2score(b.board[x][y].piece);
          if b.board[x][y].alignment=2 then
            if b.board[x][y].hit_by_1 then
              csc.score_of_1:=csc.score_of_1+piece2score(b.board[x][y].piece);
        end;
  get_hit_scores:=csc;
end;
{end get_hit.pp}
