-- Create database Clinic
CREATE DATABASE Clinic;

-- Create table patients
CREATE TABLE patients (
    id BIGSERIAL PRIMARY KEY, 
    name VARCHAR,
    date_of_birth DATE 
);

-- Create table Medical_histories
CREATE TABLE medical_histories(
    id BIGSERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR 
); 

-- Create table invoices
CREATE TABLE invoices (
    id BIGSERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);

-- Create table Medical_treatments
CREATE TABLE medical_treatments (
    medical_histories_id INT REFERENCES medical_histories(id),
    treatments_id INT REFERENCES treatments(id)
);

-- Create table treatments
CREATE TABLE treatments (
    id BIGSERIAL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

-- Create table invoice_items
CREATE TABLE invoice_items (
    id BIGSERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    FOREIGN KEY invoice_id INT REFERENCES invoices(id),
    FOREIGN KEY treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_items(invoice_id);
CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON medical_treatments(medical_histories_id);
CREATE INDEX ON medical_treatments(treatment_id);