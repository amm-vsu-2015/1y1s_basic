program pr_4;

{$APPTYPE CONSOLE}
{
  Задача:
  На вход подается строка, состоящая из слов и заканчивающаяся точкой.

  Вывести только четные слова, в которых нет повторяющихся букв.

  Входные данные для проверки:
    1abc 2bca 3abc 4abc 5abc 6acc 7abb 8aabc 9aabc
    abc bca abc abc abc acc abb aabc aabc
}

uses
  SysUtils;

var
  rawStr, resStr, buffer: string;
  i, count: integer;
  switcher: boolean;
  abc: set of char;
begin

  write('str: ');
  readln(rawStr);

  { find last symbol }
  count := 1;
  for i:=1 to 255 do begin
    if (rawStr[i] <> '') then count := count + 1;
  end;

  { if dot not exists, add dot to end of string }
  if ((rawStr[count-1] <> '.') AND (count < 256)) then
  begin
    rawStr := rawStr + '.';
    count := count + 1;
  end;


  i:=1;
  switcher:=false;
  resStr:='';

  while (rawStr[i] <> '.') do begin

    { if  word type " a" or first symbol}
    if (((rawStr[i-1] = ' ') OR (i = 1)) AND (rawStr[i] <> ' ')) then begin
      writeln('check on symol: ', rawStr[i], '; is ', NOT(switcher));

      if (NOT(switcher)) then begin
        abc := []; buffer := '';

        { if not equals ' ' and not contains in Set of abc }
        while ((rawStr[i] <> ' ') AND (NOT(rawStr[i] in abc))) do begin

          { saving symbols to buffer }
          abc := abc + [rawStr[i]];
          buffer := buffer + rawStr[i];

          i := i + 1;
          if (rawStr[i] = '.') then break;
        end;

        // buffer := buffer + ' '; writeln(' [!] ', buffer);

        { if rawStr[i] equals ' ' and switch false -> i - symbol after saved word }
        { else if loop been breaked then rawStr[i] != ' ' }
        if ((rawStr[i] = ' ') OR (rawStr[i] = '.')) then resStr := resStr + buffer + ' ';

      end else begin
        i := i + 1;
      end;

      switcher := NOT(switcher);
    end else begin
      i := i + 1;
    end;
  end;

  writeln('RAW:    ', rawStr);
  writeln('RESULT: ', resStr);
  readln;
end.
