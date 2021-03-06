% Display

% print_line(+Line)
print_line([]).
print_line([ID|L]):-
    write(' '),
    atom(ID, Symbol), write(Symbol),
    write(' |'),
    print_line(L).

% print_matrix(+Matrix, +N)
print_matrix([],10).
print_matrix([L|T], N):-
    N < 10,
    write(' '),
    letter(N, Letter), write(Letter),
    write(' ||'),
    N1 is N + 1,
    print_line(L), nl,
    write('---||---|---|---|---|---|---|---|---|---|---|\n'),
    print_matrix(T, N1).

% print_board(+GameState) - Prints the current GameState of the board
print_board(GameState):-
    write('   ||   |   |   |   |   |   |   |   |   |   |\n'),
    write('   || 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |\n'),
    write('===||===|===|===|===|===|===|===|===|===|===|\n'),
    print_matrix(GameState, 0).

% display_points(+BlackPoints, +WhitePoints) - Prints Black and White Players' points
display_points(BlackPoints, WhitePoints):- 
    write('=> Black\'s Points: '), write(BlackPoints), nl,
    write('=> White\'s Points: '), write(WhitePoints), nl.

% display_game(+GameState, +Player) - Displays the current GameState of the board and the Player who plays next
display_game(GameState, Player):-
    nl,print_board(GameState),nl,  
    write('=============== '),
    player(Player, PlayerString, _, _),
    format('~s\'s turn', [PlayerString]),
    write(' ==============='), nl.
