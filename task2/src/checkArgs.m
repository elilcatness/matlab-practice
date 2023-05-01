function ok = checkArgs(args)
ok = true;
for i = 1:length(args) - 1
    if args(i + 1) <= args(i)
        ok = false;
        break
    end
end