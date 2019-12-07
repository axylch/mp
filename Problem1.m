for n = 0:1:99
    if find(n <= 9)
        x1 = (n.^2 - 7);
        stem(n,x1)
        hold on
    
    elseif find(n >= 10)
        x = n + 1;
        while x >= 10
            if x >= 10
                x2 = x - 10;
                x = x2;
                if x <= 9
                    x3 =(x.^2 - 7);
                    stem(n,x3)
                end
            end
        end
    end
end
