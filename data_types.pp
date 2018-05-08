{begin data_types.pp}
type cell = record
              occupied:boolean;
              piece:string;
              score:integer;
              alignment:integer;
              hit_by_1:boolean;
              hit_by_2:boolean;
            end;

{
m     m   mm   mmmmm  mm   m mmmmm  mm   m   mmm
#  #  #   ##   #   "# #"m  #   #    #"m  # m"   "
" #"# #  #  #  #mmmm" # #m #   #    # #m # #   mm
 ## ##"  #mm#  #   "m #  # #   #    #  # # #    #
 #   #  #    # #    " #   ## mm#mm  #   ##  "mmm"

Do NOT edit this without editing convert.pp!!!}
type chessboard = record
                    board:array[1..8] of array[1..8] of cell;
                    my_alignment:integer;
                    my_pieces:array[0..16] of string;
                    my_pieces_num:longint;
                  end;
type move = record
              piece: string;
              x,y:integer;
            end;
type scores = record
                score_of_1,score_of_2:integer;
              end;
{end data_types.pp}
