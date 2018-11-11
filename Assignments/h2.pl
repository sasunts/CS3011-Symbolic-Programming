% Write a DCG that accepts strings of the form u2v where u and v are strings
% over the alphabet {0, 1} such that the number of 0’s in u is twice the number
% of 1’s in v

%q1:
s --> u(Count), [2], v(Count).

u(0)-->[].
u(succ(Count)) --> [0],u(Count).
u(Count) --> [1],u(Count).


v(0)-->[].
v(succ(Count)) --> [1],v(Count).
v(Count) --> [0],v(Count).


%q2:

s --> group1, group2, group3.
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
