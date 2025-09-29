% Doctors and their specializations
doctor(dr_smith, cardiology).
doctor(dr_jones, neurology).
doctor(dr_brown, orthopedics).

% Patients and their assigned doctors
patient(alice, dr_smith).
patient(mary, dr_smith).
patient(bob, dr_jones).
patient(charlie, dr_brown).

% Treatments and their corresponding specializations
treatment(angioplasty, cardiology).
treatment(beta_blockers, cardiology).
treatment(brain_surgery, neurology).
treatment(epilepsy_medication, neurology).
treatment(physical_therapy, orthopedics).
treatment(knee_surgery, orthopedics).

% A rule to check if a treatment is valid for a patient
valid_treatment_for_patient(Patient, Treatment) :-
    patient(Patient, Doctor),
    doctor(Doctor, Specialization),
    treatment(Treatment, Specialization).

% A rule to find all patients treated by a specific doctor
patients_of_doctor(Doctor, Patients) :-
    findall(Patient, patient(Patient, Doctor), Patients).

% A rule to check if a doctor can prescribe a given treatment
doctor_can_prescribe(Doctor, Treatment) :-
    doctor(Doctor, Specialization),
    treatment(Treatment, Specialization).

