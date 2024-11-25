CREATE TABLE Direction (
    DirectionID INT PRIMARY KEY IDENTITY(1,1), -- Campo clave primaria con incremento autom�tico
    MainStreet NVARCHAR(258), -- Calle principal
    SecondaryStreet NVARCHAR(258), -- Calle secundaria
    Neighborhood NVARCHAR(258), -- Barrio o vecindario
    City NVARCHAR(258) -- Ciudad
);

--Consultamos sus columnas
SELECT 
*
FROM 
dbo.Direction;
--Agregamos filas a la tabla: 
INSERT INTO Direction (MainStreet, SecondaryStreet, Neighborhood, City)
VALUES 
    ('Avenida Amazonas', 'Avenida Patria', 'La Mariscal', 'Quito'),
    ('Avenida Naciones Unidas', 'Avenida Shyris', 'I�aquito', 'Quito'),
    ('Avenida Col�n', 'Avenida 10 de Agosto', 'La Floresta', 'Quito'),
    ('Avenida Rep�blica', 'Avenida Mariana de Jes�s', 'La Carolina', 'Quito'),
    ('Avenida Sim�n Bol�var', 'Avenida Eloy Alfaro', 'El Inca', 'Quito'),
    ('Avenida 6 de Diciembre', 'Avenida Gaspar de Villarroel', 'Bellavista', 'Quito'),
    ('Avenida Los Chasquis', 'Avenida Mor�n Valverde', 'Quitumbe', 'Quito'),
    ('Avenida Galo Plaza Lasso', 'Avenida Real Audiencia', 'Carcel�n', 'Quito'),
    ('Avenida Diego de Almagro', 'Avenida Orellana', 'La Carolina', 'Quito'),
    ('Avenida Rep�blica de El Salvador', 'Avenida Portugal', 'I�aquito', 'Quito'),
    ('Avenida General Rumi�ahui', 'Calle Ilal�', 'Conocoto', 'Quito'),
    ('Calle Jos� Tamayo', 'Avenida Col�n', 'La Mariscal', 'Quito'),
    ('Avenida Maldonado', 'Avenida Teniente Hugo Ortiz', 'Chillogallo', 'Quito'),
    ('Calle Benalc�zar', 'Calle Garc�a Moreno', 'Centro Hist�rico', 'Quito'),
    ('Avenida C�rdova Galarza', 'Avenida Manuel C�rdova', 'Mitad del Mundo', 'Quito'),
    ('Avenida Universitaria', 'Avenida Am�rica', 'La Floresta', 'Quito'),
    ('Calle Guayaquil', 'Calle Chile', 'Centro Hist�rico', 'Quito'),
    ('Avenida Vicente Solano', 'Avenida Mariana de Jes�s', 'El Bosque', 'Quito'),
    ('Avenida Mariscal Sucre', 'Avenida Rodrigo de Ch�vez', 'La Magdalena', 'Quito'),
    ('Avenida Quitumbe �an', 'Avenida Rumichaca', 'Quitumbe', 'Quito');

-- Creamos la tabla Persona
CREATE TABLE Person (
    PersonID INT PRIMARY KEY IDENTITY(1,1), -- Clave primaria autoincrementable
    NamePerson NVARCHAR(258) NOT NULL, -- Nombre de la persona
    LastNamePerson NVARCHAR(258) NOT NULL, -- Apellido de la persona
    Email NVARCHAR(258) NOT NULL UNIQUE, -- Correo electr�nico �nico
    DirectionID INT NOT NULL, -- Clave for�nea hacia la tabla Direction
    FOREIGN KEY (DirectionID) REFERENCES Direction(DirectionID) -- Definici�n de la clave for�nea
);
--Consultamos la tabla person
SELECT * FROM dbo.Person;
--Llenamos 20 filas de la tabla persona
INSERT INTO Person (NamePerson, LastNamePerson, Email, DirectionID)
VALUES
    ('Juan', 'P�rez', 'juan.perez@example.com', 1),
    ('Mar�a', 'Gonz�lez', 'maria.gonzalez@example.com', 2),
    ('Carlos', 'Ram�rez', 'carlos.ramirez@example.com', 3),
    ('Ana', 'L�pez', 'ana.lopez@example.com', 4),
    ('Luis', 'Mart�nez', 'luis.martinez@example.com', 5),
    ('Sof�a', 'Hern�ndez', 'sofia.hernandez@example.com', 6),
    ('Diego', 'Vega', 'diego.vega@example.com', 7),
    ('Elena', 'Ortiz', 'elena.ortiz@example.com', 8),
    ('Miguel', 'Torres', 'miguel.torres@example.com', 9),
    ('Clara', 'Navarro', 'clara.navarro@example.com', 10),
    ('Gabriel', 'Jim�nez', 'gabriel.jimenez@example.com', 11),
    ('Paula', 'Castillo', 'paula.castillo@example.com', 12),
    ('Andr�s', 'Cruz', 'andres.cruz@example.com', 13),
    ('Luc�a', 'Mendoza', 'lucia.mendoza@example.com', 14),
    ('Mateo', 'Silva', 'mateo.silva@example.com', 15),
    ('Isabel', 'R�os', 'isabel.rios@example.com', 16),
    ('Hugo', 'C�rdenas', 'hugo.cardenas@example.com', 17),
    ('Diana', 'Reyes', 'diana.reyes@example.com', 18),
    ('Emilio', 'Salazar', 'emilio.salazar@example.com', 19),
    ('Valeria', 'Paredes', 'valeria.paredes@example.com', 20);

	--Creamos la tabla cliente: 
	CREATE TABLE Client (
    ClientID INT PRIMARY KEY, -- Clave primaria
    NumberOfPurchases INT DEFAULT 0, -- N�mero de compras como entero con valor predeterminado 0
    FOREIGN KEY (ClientID) REFERENCES Person(PersonID) -- Relaci�n de herencia con Person
	);

	--Consultamos la tabla client 
	SELECT * FROM dbo.Client;
	--Agregamos filas a la tabla client
	INSERT INTO Client (ClientID, NumberOfPurchases)
	VALUES 
    (1, 3),  -- Persona con PersonID = 1 y 3 compras
    (2, 0),  -- Persona con PersonID = 2 y 0 compras
    (3, 5),  -- Persona con PersonID = 3 y 5 compras
	(4, 5), (5, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5), 
	(11, 8),(12, 0), (13, 9), (14, 3), (15, 10),(16, 2), (17, 5), 
    (18, 4), (19, 0), (20, 7); 

	--Creamos la tabla de sucursal 
	CREATE TABLE BranchOffice (
    BranchOfficeID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    NameBranchOffice NVARCHAR(256) NOT NULL, -- Nombre de la sucursal
    DirectionID INT NOT NULL, -- Relaci�n con la tabla Direction
    FOREIGN KEY (DirectionID) REFERENCES Direction(DirectionID) -- Clave for�nea
	);


	--Consultamos 
	SELECT * FROM dbo.BranchOffice;
	--Agregamos filas 
	INSERT INTO BranchOffice (NameBranchOffice, DirectionID)
	VALUES 
    ('Sucursal Central', 1),  -- Relaci�n con DirectionID = 1
    ('Sucursal Norte', 2),    -- Relaci�n con DirectionID = 2
    ('Sucursal Sur', 3),      -- Relaci�n con DirectionID = 3
    ('Sucursal Este', 4),     -- Relaci�n con DirectionID = 4
    ('Sucursal Oeste', 5);    -- Relaci�n con DirectionID = 5


	-- Creamos la tabla de Ventor, pero primero agregamos mas personas:
	INSERT INTO Person (NamePerson, LastNamePerson, Email, DirectionID)
	VALUES
    ('Roberto', 'G�mez', 'roberto.gomez@gmail.com', 6),
    ('Claudia', 'Mart�nez', 'claudia.martinez@gmail.com', 7),
    ('Fernando', 'Lopez', 'fernando.lopez@gmail.com', 8),
    ('Andrea', 'S�nchez', 'andrea.sanchez@gmail.com', 9),
    ('Pablo', 'Torres', 'pablo.torres@gmail.com', 10),
    ('Luc�a', 'Morales', 'lucia.morales@gmail.com', 11),
    ('Santiago', 'Hern�ndez', 'santiago.hernandez@gmail.com', 12),
    ('Mariana', 'Castillo', 'mariana.castillo@gmail.com', 13),
    ('Jorge', 'Vega', 'jorge.vega@gmail.com', 14),
    ('Valeria', 'Paredes', 'valeria.paredes@gmail.com', 15),
    ('Daniel', 'C�rdenas', 'daniel.cardenas@gmail.com', 16),
    ('Elena', 'Navarro', 'elena.navarro@gmail.com', 17),
    ('Hugo', 'Reyes', 'hugo.reyes@gmail.com', 18),
    ('Carla', 'Jim�nez', 'carla.jimenez@gmail.com', 19),
    ('Manuel', 'Salazar', 'manuel.salazar@gmail.com', 20),
    ('Sof�a', 'R�os', 'sofia.rios@gmail.com', 6),
    ('Pedro', 'Vargas', 'pedro.vargas@gmail.com', 7),
    ('Camila', 'Ram�rez', 'camila.ramirez@gmail.com', 8),
    ('Gabriel', 'Silva', 'gabriel.silva@gmail.com', 9),
    ('Sara', 'Delgado', 'sara.delgado@gmail.com', 10);
	SELECT * FROM dbo.Person;
	-- ahora si creamos y agremamos vendedores:
	CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY, -- Clave primaria y clave for�nea hacia Person
    NumberOfSales INT DEFAULT 0, -- N�mero de ventas, inicia en 0
	EntryTime TIME NOT NULL, -- Hora de entrada
    ExitTime TIME NOT NULL, -- Hora de salida
    StartDate DATE NOT NULL, -- Fecha de inicio de trabajo
    Salary DECIMAL(10, 2) NOT NULL, -- Salario del vendedor
    BranchOfficeID INT NOT NULL, -- Relaci�n con la tabla BranchOffice
    FOREIGN KEY (VendorID) REFERENCES Person(PersonID), -- Herencia de Person
    FOREIGN KEY (BranchOfficeID) REFERENCES BranchOffice(BranchOfficeID) -- Relaci�n con BranchOffice
	);
	SELECT * FROM dbo.Vendor;

	--Agregamos vendedores:
	INSERT INTO Vendor (VendorID, NumberOfSales, EntryTime, ExitTime, StartDate, Salary, BranchOfficeID)
	VALUES 
    (21, 10, '08:00:00', '17:00:00', '2023-01-15', 500.00, 1),
    (22, 15, '09:00:00', '18:00:00', '2023-02-10', 550.00, 1),
    (23, 8, '08:30:00', '17:30:00', '2023-03-01', 520.00, 2),
    (24, 20, '07:00:00', '16:00:00', '2023-04-12', 600.00, 2),
    (25, 5, '09:00:00', '18:00:00', '2023-05-05', 480.00, 3),
    (26, 12, '08:00:00', '17:00:00', '2023-06-18', 530.00, 3),
    (27, 18, '07:30:00', '16:30:00', '2023-07-01', 590.00, 4),
    (28, 10, '08:00:00', '17:00:00', '2023-08-11', 500.00, 4),
    (29, 9, '09:00:00', '18:00:00', '2023-09-20', 510.00, 5),
    (30, 14, '07:00:00', '16:00:00', '2023-10-10', 580.00, 5),
    (31, 7, '08:30:00', '17:30:00', '2023-01-25', 490.00, 1),
    (32, 13, '08:00:00', '17:00:00', '2023-02-15', 540.00, 1),
    (33, 11, '09:00:00', '18:00:00', '2023-03-22', 520.00, 2),
    (34, 6, '07:30:00', '16:30:00', '2023-04-18', 470.00, 2),
    (35, 16, '08:00:00', '17:00:00', '2023-05-10', 580.00, 3),
    (36, 9, '09:00:00', '18:00:00', '2023-06-25', 510.00, 3),
    (37, 21, '07:00:00', '16:00:00', '2023-07-12', 600.00, 4),
    (38, 8, '08:30:00', '17:30:00', '2023-08-20', 495.00, 4),
    (39, 19, '08:00:00', '17:00:00', '2023-09-15', 610.00, 5),
    (40, 10, '09:00:00', '18:00:00', '2023-10-05', 500.00, 5);

	-- Creamos tabla de estado de venta: 
	CREATE TABLE SaleState (
    SaleStateID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    Completed BIT NOT NULL DEFAULT 0, -- Indica si la venta fue completada (0 o 1)
    Canceled BIT NOT NULL DEFAULT 0 -- Indica si la venta fue cancelada (0 o 1)
	);
	-- Insertamos valores
	INSERT INTO SaleState (Completed, Canceled)
	VALUES 
    (1, 0), -- Venta completada
    (0, 1), -- Venta cancelada
    (0, 0); -- Venta en proceso (ni completada ni cancelada)
	--mostramos 
	SELECT * FROM dbo.SaleState;

	--Creamos la tabla de ventas
	CREATE TABLE Sale (
    SaleID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    TotalToPay DECIMAL(10, 2) NOT NULL, -- Total a pagar
	Date DATE NOT NULL, -- Fecha de la venta
    PaymentMethod NVARCHAR(256) NOT NULL, -- M�todo de pago
    BranchOfficeID INT NOT NULL, -- Clave for�nea hacia BranchOffice
    VendorID INT NOT NULL, -- Clave for�nea hacia Vendor
    ClientID INT NOT NULL, -- Clave for�nea hacia Client
    SaleStateID INT NOT NULL, -- Clave for�nea hacia SaleState
    FOREIGN KEY (BranchOfficeID) REFERENCES BranchOffice(BranchOfficeID), -- Relaci�n con BranchOffice
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID), -- Relaci�n con Vendor
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID), -- Relaci�n con Client
    FOREIGN KEY (SaleStateID) REFERENCES SaleState(SaleStateID) -- Relaci�n con SaleState
	);
	--Consultamos
	SELECT * FROM dbo.Sale;
	--Agregamos datos: 
	INSERT INTO Sale (TotalToPay, Date, PaymentMethod, BranchOfficeID, VendorID, ClientID, SaleStateID)
	VALUES
    (100.50, '2024-11-01', 'Credit Card', 1, 21, 11, 1), -- Venta completada
    (200.75, '2024-11-02', 'Cash', 2, 22, 12, 2),       -- Venta cancelada
    (50.00, '2024-11-03', 'Debit Card', 3, 23, 17, 1),  -- Venta completada
    (300.00, '2024-11-04', 'Cash', 4, 24, 20, 3),       -- Venta en proceso
    (150.25, '2024-11-05', 'Credit Card', 5, 25, 2, 1); -- Venta completada

	-- Creamos tabla de proveedor : 
	CREATE TABLE Supplier (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    NameSupplier NVARCHAR(256) NOT NULL, -- Nombre del proveedor
    DirectionID INT NOT NULL, -- Clave for�nea hacia la tabla Direction
    FOREIGN KEY (DirectionID) REFERENCES Direction(DirectionID) -- Relaci�n con Direction
	);	
	--Agramos datos : 
	INSERT INTO Supplier (NameSupplier, DirectionID)
	VALUES
    ('Proveedor Central', 1),
    ('Distribuidora Norte', 2),
    ('Comercial Sur', 3),
    ('Suministros Este', 4),
    ('Log�stica Oeste', 5);
	--Visualizamos 
	SELECT * FROM dbo.Supplier;

	-- Creamos tabla del detalle del pedido
	CREATE TABLE SupplyDetail (
	SupplyDetailID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
	QuantitySupplied INT NOT NULL, -- Cantidad de ropa pedida
	SuplyDate DATE, -- Fecha de la entrega del pedido
	BranchOfficeID INT NOT NULL, -- Clave for�nea hacia la tabla BranchOffice
	SupplierID INT NOT NULL, -- Clave for�nea hacia la tabla Supplier
	FOREIGN KEY (BranchOfficeID) REFERENCES BranchOffice(BranchOfficeID),
	FOREIGN KEY (SupplierID) REFERENCEs Supplier(SupplierID)
	);
	-- Agregamos datos
	INSERT INTO SupplyDetail (QuantitySupplied, SuplyDate, BranchOfficeID, SupplierID)
	VALUES
	(117, '2024-11-01', 1, 1),
	(395, '2024-11-02', 2, 2),
	(47, '2024-11-03', 3, 3),
	(115, '2024-11-04', 4, 4),
	(63, '2024-11-05', 5, 5);
	-- Visualizaci�n de datos
	SELECT * FROM dbo.SupplyDetail;

	--Creamos la entidad estado de ropa: 
	CREATE TABLE ClothingState (
    ClothingStateID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    Wearable BIT NOT NULL DEFAULT 0 -- Indica si la ropa es usable (0 = No, 1 = S�)
	);
	--Agregamos 
	INSERT INTO ClothingState (Wearable)
	VALUES
    (1), -- Usable
    (0); -- No usable
	--Visualizamos 
	SELECT * FROM dbo.ClothingState;


	--Crear tabla de ropa:
	CREATE TABLE Clothes (
    ClothesID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
    Size INT NOT NULL, -- Talla
    Brand NVARCHAR(256) NOT NULL, -- Marca
    Material NVARCHAR(256) NOT NULL, -- Material
    Color NVARCHAR(256) NOT NULL, -- Color
    Price DECIMAL(10, 2) NOT NULL, -- Precio
    Type NVARCHAR(256) NOT NULL, -- Tipo de prenda
    Description NVARCHAR(MAX), -- Descripci�n opcional
    SupplierID INT NOT NULL, -- Relaci�n con el proveedor
    ClothingStateID INT NOT NULL, -- Relaci�n con el estado de ropa
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID), -- Clave for�nea con Supplier
    FOREIGN KEY (ClothingStateID) REFERENCES ClothingState(ClothingStateID) -- Clave for�nea con ClothingState
	);
	-- Visualizar 
	SELECT * FROM dbo.Clothes;
	--Agregamos :
	INSERT INTO Clothes (Size, Brand, Material, Color, Price, Type, Description, SupplierID, ClothingStateID)
	VALUES
    (32, 'Nike', 'Cotton', 'Red', 49.99, 'T-Shirt', 'Comfortable cotton t-shirt.', 1, 1), -- Usable, Proveedor 1
    (38, 'Adidas', 'Polyester', 'Blue', 59.99, 'Pants', 'Durable sport pants.', 2, 1),    -- Usable, Proveedor 2
    (42, 'Puma', 'Leather', 'Black', 120.00, 'Jacket', 'Stylish leather jacket.', 3, 1), -- Usable, Proveedor 3
    (36, 'H&M', 'Wool', 'Green', 30.00, 'Sweater', 'Warm wool sweater.', 4, 1),          -- Usable, Proveedor 4
    (40, 'Zara', 'Cotton', 'White', 25.00, 'Shirt', 'Casual white shirt.', 5, 1);        -- Usable, Proveedor 5


	-- Crear tabla SalesDetail
	CREATE TABLE SalesDetail(
	SalesDetailID INT IDENTITY(1,1) PRIMARY KEY, -- Clave primaria autogenerada
	AmountOfClothes INT NOT NULL, -- Cantidad de vendida de la ropa
	ClothesID INT NOT NULL, -- Clave for�nea hacia la tabla Clothes
	SaleID INT NOT NULL, -- Clave for�nea hacia la tabla Sale
	FOREIGN KEY (ClothesID) REFERENCES Clothes(ClothesID), -- Clave for�nea con Clothes
	FOREIGN KEY (SaleID) REFERENCES Sale(SaleID) -- Clave for�nea con Sale
	); 
	-- Agregamos :
	INSERT INTO SalesDetail (AmountOfClothes, ClothesID, SaleID)
	VALUES
	(13, 1, 1),
	(17, 2, 2),
	(14, 3, 3),
	(11, 4, 4),
	(12, 5, 5);
	-- Visualizaci�n
	SELECT * FROM dbo.SalesDetail;