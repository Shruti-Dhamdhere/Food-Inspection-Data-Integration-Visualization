/*

 * ER/Studio Data Architect SQL Code Generation

 * Project :      Midterm.DM1

 *

 * Date Created : Sunday, February 25, 2024 12:37:36

 * Target DBMS : Microsoft SQL Server 2019

 */



/* 

 * TABLE: Dim_DATE 

 */



CREATE TABLE Dim_DATE(

    Date_SK              int             NOT NULL,

    Create_Date          date            NOT NULL,

    WorkflowFile_Name    varchar(100)    NOT NULL,

    Day                  varchar(10)     NOT NULL,

    Week                 varchar(10)     NOT NULL,

    Month                varchar(10)     NOT NULL,

    Year                 varchar(10)     NOT NULL,

    CONSTRAINT date_PK PRIMARY KEY NONCLUSTERED (Date_SK)

)



go





IF OBJECT_ID('Dim_DATE') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_DATE >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_DATE >>>'

go



/* 

 * TABLE: Dim_FACILITY_TYPE 

 */



CREATE TABLE Dim_FACILITY_TYPE(

    facility_SK         int             NOT NULL,

    Create_Date         date            NOT NULL,

    WorkflowFileName    varchar(100)    NOT NULL,

    facility_type       varchar(100)    NULL,

    CONSTRAINT facility_PK PRIMARY KEY NONCLUSTERED (facility_SK)

)



go





IF OBJECT_ID('Dim_FACILITY_TYPE') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_FACILITY_TYPE >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_FACILITY_TYPE >>>'

go



/* 

 * TABLE: Dim_INSPECTION_TYPE 

 */



CREATE TABLE Dim_INSPECTION_TYPE(

    Inspection_Type_SK    int             NOT NULL,

    Create_Date           date            NOT NULL,

    WorkflowFileName      varchar(100)    NOT NULL,

    Inspection_Result     varchar(100)    NULL,

    Inspection_Type       varchar(100)    NULL,

    CONSTRAINT Inspection_PK PRIMARY KEY NONCLUSTERED (Inspection_Type_SK)

)



go





IF OBJECT_ID('Dim_INSPECTION_TYPE') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_INSPECTION_TYPE >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_INSPECTION_TYPE >>>'

go



/* 

 * TABLE: Dim_LOCATION 

 */



CREATE TABLE Dim_LOCATION(

    Location_SK         int               NOT NULL,

    Create_Date         date              NOT NULL,

    WorkflowFileName    varchar(100)      NOT NULL,

    Street_Address      varchar(100)      NOT NULL,

    City                varchar(50)       NULL,

    State               varchar(50)       NULL,

    Zipcode             varchar(50)       NULL,

    LAT_LONG            decimal(38, 0)    NULL,

    CONSTRAINT Location_PK PRIMARY KEY NONCLUSTERED (Location_SK)

)



go





IF OBJECT_ID('Dim_LOCATION') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_LOCATION >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_LOCATION >>>'

go



/* 

 * TABLE: Dim_RESTAURANT 

 */



CREATE TABLE Dim_RESTAURANT(

    Restaurant_SK       int             NOT NULL,

    Create_Date         date            NOT NULL,

    WorkflowFileName    varchar(100)    NOT NULL,

    Restaurant_Name     varchar(100)    NULL,

    DBA                 varchar(100)    NULL,

    AKA                 varchar(100)    NULL,

    CONSTRAINT Reastaurent_PK PRIMARY KEY NONCLUSTERED (Restaurant_SK)

)



go





IF OBJECT_ID('Dim_RESTAURANT') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_RESTAURANT >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_RESTAURANT >>>'

go



/* 

 * TABLE: Dim_RISK 

 */



CREATE TABLE Dim_RISK(

    Risk_SK             int                NOT NULL,

    Create_Date         date               NOT NULL,

    WorkflowFileName    varchar(100)       NOT NULL,

    Risk                numeric(38, 0)    NULL,

    Result_Score        numeric(10, 0)     NULL,

    Total_Score         numeric(10, 0)     NULL,

    CONSTRAINT Risk_PK PRIMARY KEY NONCLUSTERED (Risk_SK)

)



go





IF OBJECT_ID('Dim_RISK') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_RISK >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_RISK >>>'

go



/* 

 * TABLE: Dim_VIOLATION 

 */



CREATE TABLE Dim_VIOLATION(

    Violation_SK             int              NOT NULL,

    Create_Date              date             NOT NULL,

    WorkflowFileName         varchar(100)     NOT NULL,

    Violation_Description    varchar(1000)    NULL,

    Violation_Code           int              NULL,

    CONSTRAINT Violation_PK PRIMARY KEY NONCLUSTERED (Violation_SK)

)



go





IF OBJECT_ID('Dim_VIOLATION') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_VIOLATION >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_VIOLATION >>>'

go



/* 

 * TABLE: FACT_INSPECTION 

 */



CREATE TABLE FACT_INSPECTION(

    facility_SK           int    NOT NULL,

    Date_SK               int    NOT NULL,

    Location_SK           int    NOT NULL,

    Restaurant_SK         int    NOT NULL,

    Violation_SK          int    NOT NULL,

    Inspection_Type_SK    int    NOT NULL,

    Risk_SK               int    NOT NULL,

    Violation_Score       int    NULL,

    CONSTRAINT Fact_PK PRIMARY KEY NONCLUSTERED (facility_SK, Date_SK, Location_SK, Restaurant_SK, Violation_SK, Inspection_Type_SK, Risk_SK)

)



go





IF OBJECT_ID('FACT_INSPECTION') IS NOT NULL

    PRINT '<<< CREATED TABLE FACT_INSPECTION >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE FACT_INSPECTION >>>'

go



/* 

 * TABLE: FACT_INSPECTION 

 */



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_FACILITY_TYPE1 

    FOREIGN KEY (facility_SK)

    REFERENCES Dim_FACILITY_TYPE(facility_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_DATE2 

    FOREIGN KEY (Date_SK)

    REFERENCES Dim_DATE(Date_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_LOCATION3 

    FOREIGN KEY (Location_SK)

    REFERENCES Dim_LOCATION(Location_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_RESTAURANT4 

    FOREIGN KEY (Restaurant_SK)

    REFERENCES Dim_RESTAURANT(Restaurant_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_VIOLATION5 

    FOREIGN KEY (Violation_SK)

    REFERENCES Dim_VIOLATION(Violation_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_INSPECTION_TYPE6 

    FOREIGN KEY (Inspection_Type_SK)

    REFERENCES Dim_INSPECTION_TYPE(Inspection_Type_SK)

go



ALTER TABLE FACT_INSPECTION ADD CONSTRAINT RefDim_RISK7 

    FOREIGN KEY (Risk_SK)

    REFERENCES Dim_RISK(Risk_SK)

go