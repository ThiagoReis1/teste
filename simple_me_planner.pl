%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% A simple means-ends planner
% Coder: Edjard Mota       
% Date   : 22/04/2021              
% Source:  Prolog Programming for AI, Ivan Bratko, 
%          4th edition
%          Chapter 17 - Representing actions 
%                       for planning          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% plan(State, Goals, Plan, FinalState)
plan(State, Goals, [], State):-
    satisfied(State,Goals).
plan(State, Goals, Plan, FinalState):-
    append(Plan,_,_),
    append(PrePlan,[Action|PostPlan],Plan),
    select(State,Goals,Goal),
    achieves(Action,Goal),
    can(Action,Condition),
    plan(State,Condition,PrePlan,MidState1),
    apply(MidState1,Action,MidState2),
    plan(MidState2,Goals,PostPlan,FinalState).

%----------------------------------------------------------
% satisfied(State, goal): Goals are true in State
satisfied(_,[]).
satisfied(State,[Goal|Goals]):-
    member(Goal,State),
    satisfied(State,Goals).                 

%----------------------------------------------------------
select(State, Goals, Goal):-
    member(Goal,Goals),
    \+ member(Goal,State).                   % goal not true


%----------------------------------------------------------
% achieves(Action, Goal): goal is in add-list of Action 
achieves(Action, Goal):-
    adds(Action,Goals),
    member(Goal, Goals).

%----------------------------------------------------------
% apply(State, Action, NewState): execution of Action at 
%                                 State produces NewState
apply(State, Action, NewState):-
    deletes(Action, DelList), % get properties to be deleted
    delete_all(State,DelList, State1), !,
    adds(Action, AddList),
    append(AddList, State1, NewState).

%----------------------------------------------------------
% delete_all(L1,L2,Diff) Diff is set-difference of L1 and L2
delete_all([],_,[]).
delete_all([X|L1],L2,Diff):-
    member(X,L2), !,
    delete_all(L1,L2,Diff).
delete_all([X|L1],L2,[X|Diff]):-
    delete_all(L1,L2,Diff).


member(X,[X|_]).
member(X,[_|T]):-
     member(X,T).

delete(X,[X|Tail],Tail).
delete(X,[Y|Tail],[Y|Tail1]):- 
   delete(X, Tail,Tail1).
    

