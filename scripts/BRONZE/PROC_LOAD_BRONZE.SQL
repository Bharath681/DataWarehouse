CREATE OR ALTER PROCEDURE BRONZE.LOAD_BRONZE AS 
BEGIN
	DECLARE @START_TIME DATETIME, @END_TIME DATETIME;
	SET @START_TIME = GETDATE();
	begin try

	SET @START_TIME = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+ 'SECONDS';


SET @START_TIME = GETDATE();
TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';

SET @START_TIME = GETDATE();
TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';


SET @START_TIME = GETDATE();
TRUNCATE TABLE bronze.erp_cust_AZ12;
BULK INSERT bronze.erp_cust_AZ12
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_AZ12.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';


SET @START_TIME = GETDATE();
TRUNCATE TABLE bronze.erp_LOC_A101;
BULK INSERT bronze.erp_LOC_A101
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';

SET @START_TIME = GETDATE();
TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
BULK INSERT bronze.erp_PX_CAT_G1V2
from 'C:\Users\bhara\Downloads\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
with(
firstrow = 2,
fieldterminator =',',
tablock
);
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';
end try 
begin catch
print'ERROR OCCURED DURING LOADING BRONZE LAYER'
end catch
SET @END_TIME = GETDATE();
PRINT '>>LOAD DURATION :' +CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) + 'MINUTES FOR WHOLE DATA ';
END
