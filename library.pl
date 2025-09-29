% Facts: Books and their categories
book('The Origin of Species', science).
book('The Elegant Universe', science).
book('Guns, Germs and Steel', history).
book('The Hobbit', fiction).
book('To Kill a Mockingbird', fiction).
book('A People’s History of the United States', history).

% Facts: Borrowed books by students
borrowed(john, 'The Origin of Species').
borrowed(john, 'The Hobbit').
borrowed(sarah, 'Guns, Germs and Steel').
borrowed(sarah, 'A People’s History of the United States').
borrowed(michael, 'The Elegant Universe').
borrowed(michael, 'Guns, Germs and Steel').

% Rule: Check if a student has borrowed exactly two books
borrowed_two_books(Student) :-
    borrowed(Student, Book1),
    borrowed(Student, Book2),
    Book1 \= Book2.

% Rule: Check if a student can borrow another book (max 2 books)
can_borrow(Student) :-
    \+ borrowed_two_books(Student).

% Rule: Check if a student has borrowed from a specific category
borrowed_from_category(Student, Category) :-
    borrowed(Student, Book),
    book(Book, Category).

% Rule: Find all students who borrowed from a specific category
students_borrowed_category(Category, Students) :-
    findall(Student, borrowed_from_category(Student, Category), Students).