function interpolation(use_builtins, demo)
if demo
    x = [1.2 1.5 1.7 2 2.4 2.6 3.1 3.3 3.5 3.9];
    y = [8.278 8.541 8.811 9.087 9.356 9.621 9.89 10.165 10.431 10.701];
    x_check = [1.25 3.55];
else
    while true
        x = get_vector_double('Введите вектор аргументов: ');
        if ~check_args(x)
            disp([10 'Аргументы должны быть даны в порядке ' ...
                  'возрастания' 10]);
            continue
        end
        y = get_vector_double('Введите вектор значений: ');
        if length(x) ~= length(y)
            disp([10 'Количество аргументов должно совпадать ' ...
                 'с количеством значений' 10]);
             continue
        end
        x_check = get_vector_double(['Введите вектор аргументов ' ...
                                   'для проверки: ']);
        break
    end
end
if use_builtins
    coefs = polyfit(x, y, length(x) - 1);
    disp('Полученные polyfit коэффициенты полинома N:');
    disp(coefs);
else
    N = get_poly_func(x, get_poly_coefs(x, y));
    disp('Полученный полином Ньютона N:');
    disp(N);
end
disp('Значения при проверочных аргументах');
plot_args = [linspace(x(1), x(length(x))), x(2:length(x) - 1)];
for i = 1:length(x_check)
    if use_builtins
        val = polyval(coefs, x_check(i));
    else
        val = N(x_check(i));
    end
    disp(['N(' num2str(x_check(i)) ') = ' num2str(val)]);
end
for i = 1:length(plot_args)
    for j = i + 1:length(plot_args)
        if i ~= j && plot_args(i) > plot_args(j)
            args_i = plot_args(i);
            plot_args(i) = plot_args(j);
            plot_args(j) = args_i;
        end
    end
end
hold on
if use_builtins
    plot(plot_args, polyval(coefs, plot_args));
    plot(x_check, polyval(coefs, x_check), 'r*');
else
    plot(plot_args, N(plot_args));
    plot(x_check, N(x_check), 'r*');
end
plot(x, y, 'black*');
xlabel('x');
ylabel('y');
hold off
