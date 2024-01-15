%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  
% Configuration of the blocks' world for planning
% Coder: Edjard Mota       
% Date   : 21/04/2021              
% Source:  Prolog Programming for AI, Ivan Bratko, 
%          4th edition
%          Chapter 17 - Representing actions 
%                       for planning          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% blocks world

block(a).
block(b).
block(c).
block(d).
block(e).
block(f).
place(1).
place(2).
place(3).
place(4).
%place(5).
%place(6).
%place(7).
%place(8).


%   ~                    ~
%                                   ===>    
%                                             a              d
%   b                    e                    b              e
%   a  c  ~  ~  ~  ~  f  d                 ~  c  ~  ~  ~  ~  f  ~
%   _  _  _  _  _  _  _  _                 _  _  _  _  _  _  _  _
%   1  2  3  4  5  6  7  8                 1  2  3  4  5  6  7  8
%  

%state1([clear(3),clear(4),clear(5),clear(6),clear(b),clear(c),clear(f),clear(e),on(a,1),on(b,a),on(c,2), on(d,8),on(e,d),on(f,7)]).


% plan([on(a,1), on(b,a), on(c,b), on(d,c), on(e,d), on(f,e), on(g,f), 
%      clear(g), clear(2), clear(3)],
%     [clear(1), on(c,2), on(b,a), on(c,b), on(d,c), on(e,d), on(f,e), on(g,f), clear(g), clear(3)],
%      P).
block(g).

%   ~                  ~
%   g                  g 
%   f                  f
%   e                  e
%   d          --->    d
%   c                  c
%   b                  b
%   a  ~  ~  ~      ~  a  ~  ~
%   _  _  _  _      _  _  _  _
%   1  2  3  4      1  2  3  4
%  

state1([clear(2),clear(3),clear(4),clear(g),on(a,1),on(b,a),on(c,b), on(d,c),on(e,d),on(f,e),on(g,f)]).
  

