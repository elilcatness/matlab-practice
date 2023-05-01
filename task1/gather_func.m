function [f, f_str] = gather_func(input_str, x_str)
if ~ischar(input_str) || ~ischar(x_str)
    error('Входными аргументами должны быть строки');
end
eval([x_str '=1;']);
while true
    clear err
    str = replace(input(input_str, 's'), ' ', '');
    str = replace(str, '=0', '');
    %str = replace(replace(str, 't', '*t'), '**', '*');
    %str = replace(str, '+*t', '+t');
    %str = replace(str, '-*t', '-t');
    try
        s = eval(str);
    catch err
        disp('Ошибка ввода функции!');
    end
    if ~exist('err', 'var')
        f = eval(['@(' x_str ')' str]);
        f_str = str;
        break
    end
end