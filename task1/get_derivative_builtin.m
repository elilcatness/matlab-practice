function df = get_derivative_builtin(f)
syms t
df = eval(['@(t)' char(diff(f(t)))]);