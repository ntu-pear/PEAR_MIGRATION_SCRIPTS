CREATE TABLE allergies
(
    id SERIAL PRIMARY KEY,
    allergic_to VARCHAR NOT NULL,
    reaction VARCHAR NOT NULL,
    notes VARCHAR NOT NULL
);

INSERT INTO allergies
    (allergic_to, reaction, notes)
VALUES
    ('Fish', 'Diarrhea', 'EFW'),
    ('Peanuts', 'Nausea', 'WELCOME'),
    ('Eggs', 'Sneezing', 'GYHH'),
    ('Corn', 'Rashes', 'GGUU'),
    ('Meat', 'Sneezing', 'TY'),
    ('Tree nuts', 'Swelling', 'HELLO THERE'),
    ('Milk', 'Sneezing', 'TEST');
