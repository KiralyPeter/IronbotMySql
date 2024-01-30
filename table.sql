CREATE TABLE `Users` (
  `Id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(100) NOT NULL COMMENT 'MD5 hashed pswd',
  `PasswordSalt` varchar(100) NOT NULL COMMENT 'MD5 hash-salt',
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20),
  `Mobile` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Zip` varchar(5) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `BillingAddressId` integer DEFAULT null,
  `Status` int NOT NULL DEFAULT 0 COMMENT '0: Validating, 1: Enabled, 2: Deleted',
  `IsValidated` bit NOT NULL DEFAULT 0,
  `ValidationUrl` varchar(250) NOT NULL,
  `IsAdmin` bit NOT NULL DEFAULT 0,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `Users` (
    `Id`, 
    `Username`, 
    `PasswordHash`, 
    `PasswordSalt`, 
    `Email`, 
    `Phone`, 
    `Mobile`, 
    `FirstName`, 
    `LastName`, 
    `Country`, 
    `City`, 
    `Zip`, 
    `Address`, 
    `BillingAddressId`, 
    `Status`, 
    `IsValidated`, 
    `ValidationUrl`, 
    `IsAdmin`, 
    `TimeStamp`) 
    VALUES (
        NULL, 
        'peter', 
        'pwhas', 
        'pwsalt', 
        'peter@gmail.com', 
        '12345', 
        '123443', 
        'Peter', 
        'Kiraly', 
        'Hungary', 
        'MiklosCty', 
        '2310', 
        'Iskola street', 
        '1', 
        '0', 
        b'0', 
        'url', 
        b'0', 
        current_timestamp()
        );


CREATE TABLE `shortuser` (
  `Id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL, 
  `Email` varchar(50) NOT NULL,  
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `shortuser` (`Id`, `Username`, `Email`, `TimeStamp`) VALUES (NULL, 'peter', 'peter@valahol.com', current_timestamp());