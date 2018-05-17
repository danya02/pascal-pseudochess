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
procedure pawn(i,j,alignment:integer; var p:chessboard);
begin
  mark_as_hit(p,i-1,j-(alignment-2),alignment);
  mark_as_hit(p,i+1,j-(alignment-2),alignment);
end;
procedure rook(i,j,alignment:integer; var p:chessboard);
var lim1,lim2,lim3,lim4:boolean;
var k:integer;
begin
  if (i-k>0) then                     
    lim1:=lim1 or p.board[i-k][j].occupied;
  if (i+k<9) then
    lim2:=lim2 or p.board[i+k][j].occupied;
  if (j-k>0) then
    lim3:=lim3 or p.board[i][j-k].occupied;
  if (j+k<9) then
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
procedure bishie(i,j,alignment:integer; var p:chessboard);
var lim1,lim2,lim3,lim4:boolean;
var k:integer;
begin 
  for k:=1 to 8 do 
    begin
      if (i-k>0) and (j-k>0) then                     
        lim1:=lim1 or p.board[i-k][j-k].occupied;
      if (i-k>0) and (j+k<9) then
        lim2:=lim2 or p.board[i-k][j+k].occupied;
      if (i+k<9) and (j-k>0) then
        lim3:=lim3 or p.board[i+k][j-k].occupied;
      if (i+k<9) and (j+k<9) then
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
end;
procedure knight(i,j,alignment:integer; var p:chessboard);
begin
  mark_as_hit(p,i+2,j+1,alignment);                   
  mark_as_hit(p,i+2,j-1,alignment);                   
  mark_as_hit(p,i+1,j+2,alignment);                   
  mark_as_hit(p,i+1,j-2,alignment);                   
  mark_as_hit(p,i-2,j+1,alignment);                   
  mark_as_hit(p,i-2,j-1,alignment);                   
  mark_as_hit(p,i-1,j+2,alignment);                   
  mark_as_hit(p,i-1,j-2,alignment);                   
end;
procedure queen(i,j,alignment:integer; var p:chessboard);
begin
  rook(i,j,alignment,p);
  bishie(i,j,alignment,p);
end;
procedure king(i,j,alignment:integer; var p:chessboard);
begin
  mark_as_hit(p,i+1,j+1,alignment);                   
  mark_as_hit(p,i+1,j,alignment);                   
  mark_as_hit(p,i+1,j-1,alignment);                   
  mark_as_hit(p,i,j-1,alignment);                   
  mark_as_hit(p,i-1,j-1,alignment);                   
  mark_as_hit(p,i-1,j,alignment);                   
  mark_as_hit(p,i-1,j+1,alignment);                   
  mark_as_hit(p,i,j+1,alignment); 
end;
procedure get_hit(var p:chessboard);
var i,j:integer;
begin
  for i:=1 to 8 do
    for j:=1 to 8 do
      begin
        p.board[i][j].hit_by_1:=false;
        p.board[i][j].hit_by_2:=false;
      end;
  for i:=1 to 8 do
    for j:=1 to 8 do
      if p.board[i][j].occupied then
        begin
          with p.board[i][j] do
            case ord(piece[1]) of
              80: pawn(i,j,alignment,p); {P}
              82: rook(i,j,alignment,p); {R}
              66: bishie(i,j,alignment,p); {B}
              78: knight(i,j,alignment,p); {N}
              81: queen(i,j,alignment,p); {Q}
              75: king(i,j,alignment,p); {K}
              else wtf('Unknown piece "'+piece+'" encountered while parsing hits!'); 
              end;
            end;
 end;

function get_hit_scores(var b:chessboard):scores;
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
