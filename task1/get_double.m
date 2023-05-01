function var = get_double(prompt)
while true
    var = str2double(input(prompt, 's'));
    if isnan(var)
        disp('Некорректный ввод!');
    else
        break
    end
end