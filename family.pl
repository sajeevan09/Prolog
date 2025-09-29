parent(alice, bob).
parent(bob, charlie).
parent(alice, eve).
parent(eve, david).
parent(david, frank).
male(bob).
male(charlie).
male(david).
male(frank).
female(alice).
female(eve).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
descendant(X, Y) :- ancestor(Y, X).

uncle(X, Y) :- parent(Z, Y), sibling(X, Z), male(X).
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).