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

-- Create table Medical_histories
CREATE TABLE invoices (
    id BIGSERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);