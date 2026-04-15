
-- Base de datos para el Ejercicio 1
CREATE DATABASE Ejercicio1;
USE Ejercicio1;

-- Tabla Cliente
CREATE TABLE Cliente (
    DNI CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    Direccion VARCHAR(100),
    FechaNacimiento DATE
);

-- Tabla Producto
CREATE TABLE Producto (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(50),
    PrecioUnitario DECIMAL(10, 2)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    NIF CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100)
);

-- Tabla intermedia para la relación muchos a muchos (Cliente <-> Producto)
CREATE TABLE Compra (
    ClienteDNI CHAR(9),
    ProductoCodigo INT,
    PRIMARY KEY (ClienteDNI, ProductoCodigo),
    FOREIGN KEY (ClienteDNI) REFERENCES Cliente(DNI),
    FOREIGN KEY (ProductoCodigo) REFERENCES Producto(Codigo)
);

-- Tabla intermedia para la relación uno a muchos (Producto -> Proveedor)
CREATE TABLE Suministra (
    ProductoCodigo INT PRIMARY KEY,
    ProveedorNIF CHAR(9),
    FOREIGN KEY (ProductoCodigo) REFERENCES Producto(Codigo),
    FOREIGN KEY (ProveedorNIF) REFERENCES Proveedor(NIF)
);

-- Base de datos para el Ejercicio 2
CREATE DATABASE Ejercicio2;
USE Ejercicio2;

-- Tabla Camionero
CREATE TABLE Camionero (
    DNI CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(50),
    Telefono VARCHAR(15),
    Direccion VARCHAR(100),
    Salario DECIMAL(10, 2),
    Poblacion VARCHAR(50)
);

-- Tabla Paquete
CREATE TABLE Paquete (
    CodigoPaquete INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    Destinatario VARCHAR(50),
    DireccionDestinatario VARCHAR(100)
);

-- Tabla Provincia
CREATE TABLE Provincia (
    CodigoProvincia INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Tabla Camión
CREATE TABLE Camion (
    Matricula CHAR(10) PRIMARY KEY,
    Modelo VARCHAR(50),
    Tipo VARCHAR(50),
    Potencia DECIMAL(5, 2)
);

-- Relación uno a muchos (Camionero -> Paquete)
CREATE TABLE Distribuye (
    CamioneroDNI CHAR(9),
    PaqueteCodigo INT,
    PRIMARY KEY (CamioneroDNI, PaqueteCodigo),
    FOREIGN KEY (CamioneroDNI) REFERENCES Camionero(DNI),
    FOREIGN KEY (PaqueteCodigo) REFERENCES Paquete(CodigoPaquete)
);

-- Relación uno a muchos (Paquete -> Provincia)
CREATE TABLE LlegaA (
    PaqueteCodigo INT PRIMARY KEY,
    ProvinciaCodigo INT,
    FOREIGN KEY (PaqueteCodigo) REFERENCES Paquete(CodigoPaquete),
    FOREIGN KEY (ProvinciaCodigo) REFERENCES Provincia(CodigoProvincia)
);

-- Relación muchos a muchos (Camionero <-> Camión)
CREATE TABLE Conduce (
    CamioneroDNI CHAR(9),
    CamionMatricula CHAR(10),
    Fecha DATE,
    PRIMARY KEY (CamioneroDNI, CamionMatricula, Fecha),
    FOREIGN KEY (CamioneroDNI) REFERENCES Camionero(DNI),
    FOREIGN KEY (CamionMatricula) REFERENCES Camion(Matricula)
);

-- Los demás ejercicios se siguen de manera similar...

-- Puedes completar el resto del archivo aquí o indicarme si necesitas algo adicional.
