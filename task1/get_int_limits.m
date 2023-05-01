function [a, b] = get_int_limits()
while true
    a = get_double('Введите начало отрезка: ');
    b = get_double('Введите конец отрезка: ');
    if a >= b
        disp('Начало отрезка должно быть меньше конца!');
    else
        break
    end
end