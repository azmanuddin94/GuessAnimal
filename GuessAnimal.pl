% guess(Animal)
% To run, type go.

go :- guess(Animal), 
       write('The animal is: '), 
       write(Animal), nl, undo.
 
guess(ostrich) :- ostrich, !. 
guess(penguin) :- penguin, !. 
guess(parrot) :- parrot, !. 
guess(vulture) :- vulture, !. 
guess(robin) :- robin, !. 
guess(eagle) :- eagle, !. 
guess(crow) :- crow, !.
guess(unknown). /* not found */ 
 
% animal rule
ostrich :- size, verify(does_not_fly), verify(large).
penguin :- size, verify(small), verify(does_not_fly). 
parrot :- fly, verify(multi_colored).
vulture :- size, fly, verify(large), verify(flys). 
robin :- fly, verify(large_beak), verify(red_colored). 
eagle :- size,fly, verify(has_crest),verify(is_bald).
crow :- fly. 

%class rule
size :- verify(large), !.
size :- verify(small).
fly :- verify(flys).

%question
ask(Question) :- 
        write('Does the animal have this attribute: '), 
        write(Question), write('? '), 
         read(Response), nl, 
         ( (Response == yes ; Response == y) 
         -> assert(yes(Question)) ; 
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1.  

%vefication
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 

%undo all yes/no assertions 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo. 