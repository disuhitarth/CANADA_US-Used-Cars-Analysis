/*
 * Download SQL Server from the web (from www.microsoft.com) and install on machine.
 * Then:
 *    1) Download data into some directory on the machine
 *    2) Open SQL Server Management Studio
 *    3) Set @LOADDIR in this script to the directory where you downloaded the files
 */

USE Used_Cars

DECLARE @LOADDIR VARCHAR(255) = 'C:\Users\mehta\Downloads\DAB 203 Project\Files';
DECLARE @SQL NVARCHAR(MAX);

--DROP TABLE US_Used_Car; 
CREATE TABLE US_Used_Car (
	id			VARCHAR(13) NOT NULL PRIMARY KEY
  ,vin          VARCHAR(17)
  ,price        FLOAT 
  ,miles        FLOAT 
  ,stock_no     VARCHAR(120)
  ,year         REAL 
  ,brand        NVARCHAR(50)
  ,model        VARCHAR(70)
  ,trim         VARCHAR(40)
  ,body_type    NVARCHAR(50)
  ,vehicle_type NVARCHAR(300)
  ,wheeldrive   VARCHAR(300)
  ,transmission VARCHAR(9)
  ,fuel_type    VARCHAR(270)
  ,engine_size  NUMERIC(3,1)
  ,engine_block VARCHAR(1)
  ,seller_name  VARCHAR(120)
  ,street       VARCHAR(440)
  ,city         VARCHAR(190)
  ,province     VARCHAR(200)
  ,zip          VARCHAR(100)
  ) ;

SET @SQL = '
BULK INSERT Used_Cars..US_Used_Car
    FROM ''@LOADDIR\US.csv''
	WITH (FIRSTROW = 2, FIELDTERMINATOR = '','',ROWTERMINATOR = ''0x0A'',
    MAXERRORS=100000);
';

SET @SQL = REPLACE(@SQL, '@LOADDIR', @LOADDIR)

EXEC(@SQL);

--DROP TABLE Canada_Used_Car; 
CREATE TABLE Canada_Used_Car (
	 id           VARCHAR(13) NOT NULL PRIMARY KEY
  ,vin          VARCHAR(17)
  ,price        FLOAT 
  ,miles        FLOAT 
  ,stock_no     VARCHAR(120)
  ,year         REAL 
  ,brand        NVARCHAR(50)
  ,model        VARCHAR(70)
  ,trim         VARCHAR(40)
  ,body_type    NVARCHAR(50)
  ,vehicle_type VARCHAR(300)
  ,wheeldrive   VARCHAR(300)
  ,transmission VARCHAR(9)
  ,fuel_type    VARCHAR(270)
  ,engine_size  NUMERIC(3,1)
  ,engine_block VARCHAR(1)
  ,seller_name  VARCHAR(120)
  ,street       VARCHAR(440)
  ,city         VARCHAR(190)
  ,province     VARCHAR(200)
  ,zip          VARCHAR(100)
) ;

SET @SQL = '
BULK INSERT Used_Cars..Canada_Used_Car
    FROM ''@LOADDIR\CA.csv''
	WITH (FIRSTROW = 2, FIELDTERMINATOR = '','',ROWTERMINATOR = ''0x0A'',
    MAXERRORS=100000)
';

SET @SQL = REPLACE(@SQL, '@LOADDIR', @LOADDIR)

EXEC(@SQL);







