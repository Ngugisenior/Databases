% This program take the list from the key and deletes the Nth element%

deln(1,[_,Tail],Tail).

deln(N,[Head|Tail],[Head|S]):- X is N-1, deln(X,Tail,S).

