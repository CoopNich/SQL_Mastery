  
create table OilChangeLogs (
  oil_change_log_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  date_occured timestamp with time zone,
  vehicle_id int,
  FOREIGN KEY (vehicle_id) REFERENCES Vehicles (vehicle_id)
);

create table RepairTypes (
  repair_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50)
);

create table CarRepairTypeLogs (
  car_repair_type_log_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  date_occured timestamp with time zone,
  vehicle_id int,
  repair_type_id INT,
  FOREIGN KEY (vehicle_id) REFERENCES Vehicles (vehicle_id),
  FOREIGN KEY (repair_type_id) REFERENCES RepairTypes (repair_type_id)
);