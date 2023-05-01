function vec = get_vector_double(inputMsg)
while true
    vec = str2num(input(inputMsg, 's'));
    if isempty(vec)
        disp([10 'Введён пустой вектор или вектор с некорректными ' ...
              'символами. ' 10]);
    else
        break
    end
end