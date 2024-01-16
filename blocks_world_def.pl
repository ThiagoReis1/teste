%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% A Definition of the blocks' world example for planning
% Coder: Edjard Mota       
% Date   : 02/09/2021              
% Source:  Prolog Programming for AI, Ivan Bratko, 
%          4th edition
%          Chapter 17 - Representing actions 
%                       for planning          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% mario 

% blocks world

block(a).
block(b).
block(c).
place(1).
place(2).
place(3).
place(4).

% A possible representation for a state in the blocks world
% 
%        c 
%        a   b 
%        -------
% place  1 2 3 4
%  
state1([clear(2),clear(4),clear(b),clear(c),on(a,1),on(b,3),on(c,a)]).
  

