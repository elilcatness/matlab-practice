while true
    disp('Меню');
    disp(['1. Решение трансцедентных уравнений' 10 ...
          '2. Интерполяция' 10 ...
          '0. Выход']);
    choice = input('Выберите пункт меню: ', 's');
    switch choice
        case '1'
            clc
            iter_solving_menu;
        case '2'
            clc
            interp_menu;
        case '0'
            disp('Bye!');
            break
        otherwise
            disp([10 'Такого пункта нет!' 10]);
    end
end