%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% A Definition of the blocks' world for planning thiago
% Coder: Edjard Mota       
% Date   : 21/04/2021              
% Source:  Prolog Programming for AI, Ivan Bratko, 
%          4th edition
%          Chapter 17 - Representing actions 
%                       for planning          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% Definition of action move(Block, From, To)
% can(Action, Condition), where action and gosls are uninstantiated
can(move(Block,From,To),
    [clear(Block),clear(To),on(Block,From),different(Block,To), different(From,To), different(Block,From)]).

%----------------------------------------------------------
% adds(Action, Relationships): Action establishes new Relationships
adds(move(X,From,To),[on(X,To),clear(From)]). 

%----------------------------------------------------------
% deletes(Action, Relationships): Action destroy Relationships
deletes(move(X,From,To),[on(X,From),clear(To)]).

object(X):-
    place(X)
    ;
    block(X).
%----------------------------------------------------------
impossible(on(X,X),_).
impossible(on(X,Y),Goals):-
    member(clear(Y),Goals)
    ;
    member(on(X,Y1),Goals), Y1 \== Y   % Block cannot be in two places
    ;
    member(on(X1,Y), Goals), X1 \== X. % Two blocks cannot be at the same place
impossible(clear(X),Goals):-
    member(on(_,X),Goals).
    
