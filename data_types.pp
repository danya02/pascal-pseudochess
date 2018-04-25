{begin data_types.pp}
type cell = record
              occupied:boolean;
              piece:string;
              score:integer;
              alignment:integer;
              hit_by_1:boolean;
              hit_by_2:boolean;
            end;
type chessboard = record
                    board:array[1..8] of array[1..8] of cell;
                    my_alignment:integer;
                    my_pieces:array[0..16] of integer;
                  end;
{end data_types.pp}
