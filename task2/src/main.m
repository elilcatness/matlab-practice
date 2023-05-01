x = [1.2 1.5 1.7 2 2.4 2.6 3.1 3.3 3.5 3.9];
y = [8.278 8.541 8.811 9.087 9.356 9.621 9.89 10.165 10.431 10.701];
x_check = [1.25 3.55];
% while true
%     x = getVectorDouble('Введите вектор аргументов: ');
%     if ~checkArgs(x)
%         disp([10 'Аргументы должны быть даны в порядке возрастания' 10]);
%         continue
%     end
%     y = getVectorDouble('Введите вектор значений: ');
%     if length(x) ~= length(y)
%         disp([10 'Количество аргументов должно совпадать с количеством' ...
%              'значений' 10]);
%          continue
%     end
%     % x_check = [1.25 3.55];
%     x_check = getVectorDouble('Введите вектор аргументов для проверки: ');
%     break
% end
disp('Полученный полином Ньютона N:');
N = getPolyFunc(x, getPolyCoefs(x, y));
disp('Значения при проверочных аргументах:');
plot_args = [linspace(x(1), x(length(x))), x(2:length(x) - 1)];
for i = 1:length(x_check)
    disp(['N(' num2str(x_check(i)) ') = ' num2str(N(x_check(i)))]);
%     if ~ismember(x_check(i), plot_args)
%         plot_args = [plot_args x_check(i)];
%     end
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
plot(plot_args, N(plot_args));
xlabel('x');
ylabel('y');
plot(x, y, 'black*');
plot(x_check, N(x_check), 'r*');
hold off