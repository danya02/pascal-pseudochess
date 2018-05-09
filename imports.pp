{begin imports.pp}
//uses sysutils;
{Functions below are used as drop-in replacements for the non-Pascal ABC module sysutils.}
function inttostr(i:integer):string;
var s:string;
begin
  str(i,s);
  inttostr:=s;
end;
function strtoint(s:string):integer;
var i,e:integer;
begin
  val(s,i,e);
  strtoint:=i;
end;
{end imports.pp}

