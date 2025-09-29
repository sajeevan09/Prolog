%Facts
student(alice).
student(bob).

course(ai).
course(database).

professor(dr_smith).
professor(dr_jones).

enrolled(alice, ai).
enrolled(bob, database).

teaches(dr_smith, ai).
teaches(dr_jones, database).

%Rules
passes(Student, Course) :-
    enrolled(Student, Course),
    score(Student, Course, Score),
    Score > 50.

%Rule: A student is taught by a specific professor if the professor teaches at least one of the students enrolled courses
taught_by(Student, Professor) :-
    enrolled(Student, Course),
    teaches(Professor, Course).

%Rule: Two students are classmates if they are enrolled in the same course
classmates(Student1, Student2) :-
    enrolled(Student1, Course),
    enrolled(Student2, Course),
    Student1 \= Student2.

% Example scores
score(alice, ai, 75).
score(bob, database, 45).

% Queries:
% 1. Find all students taught by Dr. Smith
% ?- teaches(dr_smith, _), enrolled(Student, _).
% Student = alice .


% 2. Find the courses that Alice and Bob are enrolled in
% ?- enrolled(alice, Course).
%  Course = ai.
% ?- enrolled(bob, Course).
% Course = database.

% 3. Check if a student is taught by a specific professor
% ?- taught_by(alice, dr_smith).
% true.
% ?- taught_by(bob, dr_smith).
% false.

% 4. Check if two students are classmates
% ?- classmates(alice, bob).
% false.