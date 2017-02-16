function [ prob ] = sigmoidProb( y, x, w )

prob = 0;
if y==1
    prob=1/(1+exp(-x*w));
else
    prob=1-1/(1+exp(-x*w));
end

