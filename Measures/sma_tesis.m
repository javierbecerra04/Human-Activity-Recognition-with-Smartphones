function sma_val = sma_tesis(x,y,z)
    sma_val= sum(abs(x)+abs(y)+abs(z))/length(x);
end