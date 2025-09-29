%Facts
warehouse(warehouse1).
warehouse(warehouse2).
warehouse(warehouse3).
warehouse(warehouse4).

truck_at(truck1, warehouse1).
truck_at(truck2, warehouse2).
truck_at(truck3, warehouse3).

stored_at(package1, warehouse1).
stored_at(package2, warehouse2).
stored_at(package3, warehouse3).
stored_at(package4, warehouse4).

%Rules
can_pick_up(Truck, Package) :-
    truck_at(Truck, X),
    stored_at(Package, X).

can_move(Truck, From, To) :-
    truck_at(Truck, From),
    warehouse(To),
    From \= To.

can_deliver(Truck, Package, Destination) :-
   can_pick_up(Truck, Package),
   can_move(Truck, _, Destination).
   



    
