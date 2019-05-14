%reading reads the input from the keyboard%

reading(_,[H|T]):- read(H),H\=end,reading(T).
reading([]).


%calculate the average%
%it calculates average with the below given condition%

avgerage([H|T],Avg):- length([_|T],N),sumList([H|T],Sum), Avg is Sum/N.
