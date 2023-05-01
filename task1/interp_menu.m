while true
    disp('Раздел 2. Интерполяция');
    disp(['1. Решение без встроенных функций' 10 ...
          '2. Решение со встроенными функциями' 10 ...
          '0. Вернуться назад']);
    choice = input('Выберите пункт меню: ', 's');
    switch choice
        case '1'
            use_builtins = false;
        case '2'
            use_builtins = true;
        case '0'
            clc
            break
        otherwise
            disp([10 'Такого пункта нет!' 10]);
            continue
    end
    clc
    while true
        if ~use_builtins
            disp(['Раздел 2. Интерполяция без встроенных функций ' ...
                 'с помощью многочлена Ньютона']);
        else
            disp(['Раздел 2. Интерполяция со встроенными функциями ' ...
                  'с помощью многочлена Ньютона']);
        end
        disp(['1. Демонстрация' 10 '2. Настраиваемое решение' 10 ...
              '0. Вернуться назад']);
        choice = input('Выберите пункт меню: ', 's');
        switch choice
            case '1'
                interpolation(use_builtins, true);
            case '2'
                interpolation(use_builtins, false);
            case '0'
                clc
                break
            otherwise
                disp([10 'Такого пункта нет!' 10]);
                continue
        end
    end
end