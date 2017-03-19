program Matrix_Max;

{$APPTYPE CONSOLE}
{
  Задача:
  Дана матрица 3х3, состоящая из вещественных чисел.
  Составить матричный вектор, состоящий из значений типа boolean на основе каждой
  строки в матрице А.

  Если в строке есть хотя бы одно значение большее или равное 0.5, то true, иначе false.
}

uses
  SysUtils;

const n = 3;
var
  i, j, res: integer;
  A: array[0..n,0..n] of real;
  boolAr: array[0..n] of boolean;

begin
randomize;

  // filling matrix
  for i:=1 to n do begin
    for j:=1 to n do begin
      A[i,j] := Random(10)/10;
      write(A[i,j]:4:2, ' ');
    end;
    writeln;
  end;

  writeln; writeln;

  //filling vector
  for i:=1 to n do begin
    boolAr[i] := false;
    for j:=1 to n do begin
      if (A[i,j] >= 0.50) then begin
        boolAr[i] := true;
        break;
      end;
    end;
  end;

    for i:=1 to n do begin
     writeln(boolAr[i]);
    end;

    readln;
end.
