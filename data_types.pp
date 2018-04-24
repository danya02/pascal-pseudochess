{begin data_types.pp}
type cell = record
              occupied:boolean;
              score:integer;
              alignment:integer;
            end;
type chessboard = record
                    board:array[1..8] of array[1..8] of cell;
                    my_alignment:integer;
                  end;
{end data_types.pp}
