function iter_solve(use_builtins, demo)
if demo
    f = @(t)t.^3 + 2*t.^2 + 4*t - 0.2;
    coefs = [1 2 4 -0.2];
    disp('Заданное трансцедентное уравнение: ');
    disp(f);
    a = 0;
    disp(['Левая граница интервала: ' num2str(a)]);
    b = 0.1;
    disp(['Правая граница интервала: ' num2str(b)]);
    eps = 0.001;
    disp(['Заданная точность: ' num2str(eps)]);
else
    while true
        try
            [f, coefs] = get_func_with_coefs();
            break
        catch err
            disp(err);
        end
    end
    eps = str2double(input('Введите точность: ', 's'));
    if eps <= 0
        disp('Точность должна быть больше нуля');
    elseif eps >= 1
        disp('Точность должна быть меньше единицы');
    end
    while true
        a = str2double(input('Введите левую границу: ', 's'));
        if isnan(a)
            disp([10 'Нужно ввести число!' 10]);
        else
            break
        end
    end
    while true
        b = str2double(input('Введите правую границу: ', 's'));
        if isnan(b)
            disp([10 'Нужно ввести число!' 10])
        elseif b <= a + 2 * eps
            disp([10 'Правая граница не может быть < левой границы + 2 точности' 10]);
        else
            break
        end
    end
end
[phi, phi_coefs] = get_phi_func(coefs, 't');
if ~use_builtins
    [dphi, ~] = get_derivative(phi_coefs, 't');
else
    dphi = get_derivative_builtin(phi);
end
t1 = find_root_iter(phi, dphi, a, b, eps);
if ~isnan(t1) && abs(t1) ~= Inf
    disp(['Найденный на отрезке корень: ' num2str(t1)]);
    x = a - 1:eps:b + 1;
    y = zeros(1, length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    hold on
    plot(x, y);
    plot([a - 1 b + 1], [0 0], 'k');
    plot(t1, 0, 'r*');
    xline(a, '--', 'a');
    xline(b, '--', 'b');
    grid on
    hold off
else
    disp([10 'Корень на отрезке не был найден'])
end
input('Нажмите Enter, чтобы продолжить...', 's');