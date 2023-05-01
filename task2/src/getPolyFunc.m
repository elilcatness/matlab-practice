function func = getPolyFunc(args, coefs)
if length(args) ~= length(coefs)
    error(['Количество аргументов должно быть равно количеству' ...
           'коэффициентов'])
end
s = num2str(coefs(1));
mult = '';
for i = 2:length(args)
    if coefs(i) > 0
        strCoef = ['+' num2str(coefs(i))];
    else
        strCoef = [num2str(coefs(i))];
    end
    mult = [mult '.*' '(x-' num2str(args(i - 1)) ')'];
    s = [s strCoef mult];
end
func = eval(['@(x)' s]);