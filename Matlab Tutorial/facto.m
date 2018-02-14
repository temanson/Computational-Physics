clear all;

n(1) = 0;
f(1) = 1;
for i = 2:10
    n(i) = i-1;
    f(i) = n(i)*f(i-1);
end
plot(n,f)