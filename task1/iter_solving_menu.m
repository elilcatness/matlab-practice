while true
    disp('Раздел 1. Решение трансцедентных уравнений');
    disp(['1. Решение без встроенных функций' 10 '2. Решение со встроенными функциями' 10 '0. Вернуться назад']);
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
            disp('Раздел 1. Решение трансцедентных уравнений без встроенных функций методом простых итераций');
        else
            disp('Раздел 1. Решение трансцедентных уравнений со встроенными функциями методом простых итераций');
        end
        disp(['1. Демонстрация' 10 '2. Настраиваемое решение' 10 '0. Вернуться назад']);
        choice = input('Выберите пункт меню: ', 's');
        switch choice
            case '1'
                iter_solve(use_builtins, true);
                clc
            case '2'
                iter_solve(use_builtins, false);
                clc
            case '0'
                clc
                break
            otherwise
                disp([10 'Такого пункта нет!' 10]);
                continue
        end
    end
end