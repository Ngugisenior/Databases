% This program generates all possible amstrong numbers%
% XYZ are the three digit numbers and below is the condition to
% generate the amstrong number%

between(1,9,X),between(0,9,Y),between(0,9,Z),(X**3+Y**3+Z**3)=:=(X*100+Y*10+Z).
