%q1:
s --> [2].
s --> u(Zeros), [2], v(Ones), {Zeros is 2*Ones}.

u(0) --> [].
u(Zeros) --> [0], u(Z), {Zeros is Z+1}.
u(Zeros) --> [1], u(Zeros).

v(0) --> [].
v(Ones) --> [1], v(O), {Ones is O+1}.
v(Ones) --> [0], v(Ones).

%q2:

s2 --> group1, group2, group3.
group1 --> colour1, nation1, pet1.
group2 --> colour2, nation2, pet2.
group3 --> colour3, nation3, pet3.

colour1 --> [red].
colour2 --> [blue].
colour3 --> [green].

nation1 --> [english].
nation2 --> [japanese].
nation3 --> [spanish].

pet1 --> [snail].
pet2 --> [jaguar].
pet3 --> [zebra].


%q3:
mkList(0, []).
mkList(Num, [Num | T]) :- N is Num - 1, N >= 0, mkList(N, T).

s3(0) --> [].
s3(N) --> {mkList(N,List), member(X,List), Y is N-X}, [X], s3(Y).
