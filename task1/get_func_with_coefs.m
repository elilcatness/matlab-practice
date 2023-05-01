function [f, coefs] = get_func_with_coefs()
allowed_chars = '0123456789.+-/*t';
powers_count = 4;
[f, f_str] = gather_func('Введите функцию вида a*t^3 + b*t^2 + c*t + d: ', 't');
f_str = replace(replace(f_str, ' ', ''), '-', '+-');
multiplicants = split(f_str, '+');
raw_n = length(multiplicants);
n = 0;
for i = 1:raw_n
    if ~isempty(char(multiplicants(i)))
        n = n + 1;
    end
end
if n > 4
    error('Количество множителей должно быть не более четырёх!');
end
coefs = [NaN NaN NaN NaN];
for i = 1:raw_n
    m = char(multiplicants(i));
    if isempty(m)
        continue
    end
    if contains(string(m), "/t")
       error('t не должно быть в знаменателе'); 
    end
    m = replace(m, '*t', 't');
    m_arr = split(m, '^');
    m_arr_len = length(m_arr);
    if m_arr_len == 2
        coef = char(m_arr(1));
        power = char(m_arr(2));
    elseif m_arr_len == 1
        coef = char(m_arr(1));
        if ismember('t', coef)
            power = 1;
        else
            power = 0;
        end
    else
        error('Знаков степени у одного множителя должно быть не более одного!');
    end
    if coef == 't'
        coef = '1t';
    elseif string(coef) == "-t"
        coef = '-1t';
    end
    bad_m = false;
    for j = 1:m_arr_len
        if isa(m_arr(j), 'double')
            continue
        end
        m_char = char(m_arr(j));
        for k = 1:length(m_char)
            if ~ismember(m_char(k), allowed_chars)
                bad_m = true;
            end
        end
    end
    if bad_m
        error(['В слагаемом ' m ' запрещённый символ']);
    end
    if ~isa(power, 'double')
        power = str2num(power);
        if isnan(power)
            error(['Не удалось преобразовать степень слагаемого ' m ' в число']);
        end
    end
    if power > 0 && ~ismember('t', coef)
        power = 0;
    end
    coef = str2num(replace(coef, 't', ''));
    if isnan(coef)
        error(['Не удалось преобразовать слагаемое ' m ' в число']);
    end
    if mod(power, 1) ~= 0 || power < 0 || power > 3
        error(['Степень слагаемого ' m ' либо нецелая, либо < 0, либо > 3']);
    end
    if ~isnan(coefs(powers_count - power))
        error([m ': слагаемое с такой же степенью присутствует в уравнении ранее']);
    end
    coefs(powers_count - power) = coef;
end
for i = 1:length(coefs)
    if isnan(coefs(i))
        coefs(i) = 0;
    end
end
if coefs(3) == 0
    error('Коэффициент при t не должен быть равен нулю');
end
if coefs(1) == 0 && coefs(2) == 0
    error('Уравнение не должно быть линейным');
end