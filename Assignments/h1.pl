numeral(0).
numeral(succ(X)) :- numeral(X).

pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

%Increment
incr(null,f1(null)).              %base case
incr(f0(X),f1(X)).                %f0(X) changes to f1(X)
incr(f1(X),f0(Y)) :- incr(X,Y).   %f1(X) changes to f0(y) where y will equal to f1(X) from above

%Valid pterms
legal(f0(null)).                  %base case
legal(Y) :- legal(X), incr(X,Y).  %a pterm is legal if X is legal and X can be a predecessor to Y

incR(X,Y):- legal(X), incr(X,Y).  %increment(X,Y) if legal pterm(X),

%Reverse
revers(P,RevP) :- revers(P, null, RevP).     %reverse using an accumulator with cases below where f0 is head and f1 is head and is appended to a tail
revers(null,Y, Y).                      %nothing left to reverse
revers(f0(X), T, Y) :- revers(X,f0(T), Y). %f0 is head and X is tail, recurse into X head and T is tail
revers(f1(X), T, Y) :- revers(X,f1(T), Y). %same as above

%normalize
normalize(null,f0(null)). %base null = null
normalize(f0(null),f0(null)). %2nd base case f0(null) = f0(null)
normalize(X, Y) :- revers(X, Z), normalize2(Z, A), revers(A, Y). %revers number then call normalize2, then revers back
normalize2(f1(X), f1(X)). %f1(X) remains as f1(X)
normalize2(f0(X), Y) :- normalize2(X, Y). %strip off f0 before we hit f1
