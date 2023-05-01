function [df, d_coefs] = get_derivative(coefs, x_str)
d_coefs = zeros(1, length(coefs));
df_str = '';
for i = 1:length(coefs) - 1
    power = length(coefs) - i;
    d_coefs(i + 1) = coefs(i) * power;
    if d_coefs(i + 1) > 0
        if i == 2
            sep = '';
        else
            sep = '+';
        end
        df_str = [df_str sep num2str(d_coefs(i + 1)) '*' x_str '^' num2str(power - 1)];
    elseif d_coefs(i + 1) < 0
        df_str = [df_str num2str(d_coefs(i + 1)) '*' x_str '^' num2str(power - 1)];
    end
end
if isempty(df_str)
    df_str = '0';
end
df = eval(['@(' x_str ')' df_str]);