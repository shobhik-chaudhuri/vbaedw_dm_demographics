/*
Created: 5/28/2024
Modified: 12/16/2024
Project: Demographics
Model: VBA EDW Demographics
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table EDW_DEMOGRAPHICS.VETERAN_DIM

CREATE TABLE EDW_DEMOGRAPHICS.VETERAN_DIM(
  VETERAN_DIM_ID Number NOT NULL,
  VETERAN_ID Number NOT NULL,
  RACE_DIM_ID Number NOT NULL,
  SEX_DIM_ID Number NOT NULL,
  VETERAN_ADDRESS_DIM_SID Number NOT NULL,
  GENDER_DIM_ID Number DEFAULT -99 NOT NULL,
  SSN Varchar2(9 ),
  FILE_NUMBER Varchar2(9 ),
  VETERAN_EXISTS_CODE Varchar2(5 ),
  OEI_PERSON_ID Varchar2(255 ),
  MPI_ACTIVE_ICN Varchar2(255 ),
  MPI_ACTIVE_ICN_FULL Varchar2(255 ),
  VADIR_VS_PERSON_SID Number,
  EDI_PI Number,
  PERSON_DIM_SID Number,
  PARTICIPANT_IDENTIFIER Number,
  BIRLS_VETERAN_ID Number,
  USVETS_ID Number,
  FIRST_NAME Varchar2(50 ),
  MIDDLE_NAME Varchar2(50 ),
  LAST_NAME Varchar2(50 ),
  NAME_SUFFIX Varchar2(20 ),
  NAME_SOURCE Varchar2(1 ),
  NAME_MATCH_CODE Varchar2(4 ),
  NAME_MATCH_PCT Number,
  SEX_CODE_PRIMARY Varchar2(1 ),
  RACE_DESC_PRIMARY Varchar2(30 ),
  DATE_OF_BIRTH Date,
  DATE_OF_BIRTH_SOURCE Varchar2(1 ),
  DATE_OF_BIRTH_MATCH_CODE Varchar2(5 ),
  DATE_OF_DEATH Date,
  DATE_OF_DEATH_SOURCE Varchar2(1 ),
  DATE_OF_DEATH_MATCH_CODE Varchar2(5 ),
  VA_EMPLOYEE_IND Varchar2(1 ),
  ETHNICITY_DESC Varchar2(30 ),
  BEGIN_DATE Date,
  END_DATE Date,
  CURRENT_RECORD_IND Varchar2(1 ),
  CONGRESSIONAL_DISTRICT Varchar2(30 ),
  CREATE_DATE Date,
  UPDATE_DATE Date
)
TABLESPACE EDW_DEMOGRAPHICS
STORAGE (INITIAL 100M NEXT 100M PCTINCREASE 0)
/

-- Create indexes for table EDW_DEMOGRAPHICS.VETERAN_DIM

CREATE INDEX IX_Gender Dim --> Veteran Dim ON EDW_DEMOGRAPHICS.VETERAN_DIM (GENDER_DIM_ID)
/

CREATE INDEX IX_Race Dim --> Veteran Dim ON EDW_DEMOGRAPHICS.VETERAN_DIM (RACE_DIM_ID)
/

CREATE INDEX IX_Veteran Address Dim --> Veteran Dim ON EDW_DEMOGRAPHICS.VETERAN_DIM (VETERAN_ADDRESS_DIM_SID)
/

CREATE INDEX IX_Sex Dim --> Veteran Dim ON EDW_DEMOGRAPHICS.VETERAN_DIM (SEX_DIM_ID)
/

-- Add keys for table EDW_DEMOGRAPHICS.VETERAN_DIM

ALTER TABLE EDW_DEMOGRAPHICS.VETERAN_DIM ADD CONSTRAINT PK_VETERAN_DIM PRIMARY KEY (VETERAN_DIM_ID)
   USING INDEX TABLESPACE EDW_DEMOGRAPHICS
   STORAGE (INITIAL 25M NEXT 25M PCTINCREASE 0)
/

-- Table and Columns comments section

COMMENT ON TABLE EDW_DEMOGRAPHICS.VETERAN_DIM IS 'Type 2 dimension table with Current Record Indicator.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VETERAN_DIM_ID IS 'Primary key for Veteran Dim. Every record in the table has unique identifier.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VETERAN_ID IS 'The unique identifier for the veteran given by the VBA EDW.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.RACE_DIM_ID IS 'Foreign key from RACE_DIM.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.SEX_DIM_ID IS 'Foreign key from SEX_DIM.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VETERAN_ADDRESS_DIM_SID IS 'Foreign key from VETERAN_ADDRESS_DIM.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.GENDER_DIM_ID IS 'Foreign key from GENDER_DIM.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.SSN IS 'The claimant''s social security number.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.FILE_NUMBER IS 'Identifies the record of a claimant or beneficiary uniquely. In most cases, the File Number will be the veteran''''s social security number (SSN). However, not everyone eligible has a SSN (e.g., Philippines nationals, former service members), so an eight-digit claim number assigned by BIRLS will be used if there is no SSN.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VETERAN_EXISTS_CODE IS 'String in alphabetic order that indicates which systems contain this veteran record'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.OEI_PERSON_ID IS 'Person ID from OEI - The primary key identifier of a Veteran. It is a hashed Social Security Number (SSN) compiled from the Master Person Index (MPI) and U.S. Veterans Elegibility Trends and Statistics (USVETS) datasets.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.MPI_ACTIVE_ICN IS 'The first ten digits of the active VA Internal Control Number (ICN).'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.MPI_ACTIVE_ICN_FULL IS 'The full 16-digit active Internal Control Number (ICN) with delimiter character and checksum.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VADIR_VS_PERSON_SID IS 'Unique identifier from VADIR.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.EDI_PI IS 'The unique identifier assigned to a person to establish their identity within the DoD. DMDC generates this data element when a person is created in DEERS. The data elements are also referred to as EDI, EDI_PI, DoD ID, or the DoD ID Number. It is used in both ''system to system'' and manual business processes across all DoD organizations to exchange a persons data. Source: VADIR.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.PERSON_DIM_SID IS 'The system identifier to uniquely identify an occurrence of a record in Person Dimension table in the EDW. Data in that table is sourced from the Corporate DB.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.PARTICIPANT_IDENTIFIER IS 'A unique identifier of the Participant in the Corporate Database.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.BIRLS_VETERAN_ID IS 'Veteran ID from BIRLS.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.USVETS_ID IS 'Identifier from USVETS.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.FIRST_NAME IS 'The first name of a person.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.MIDDLE_NAME IS 'The middle name of a person.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.LAST_NAME IS 'The last name of a person.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.NAME_SUFFIX IS 'The suffix of a person.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.NAME_SOURCE IS 'Source system for Name based on business rules (C=Corporate, B=BIRLS, O=OEI, V=VADIR).'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.NAME_MATCH_CODE IS 'String containing source systems in alphabetic order, that indicates which ones match the value of the standardized name columns.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.NAME_MATCH_PCT IS 'Percentage of matches of name across sources where veteran record exists. If percentage is 1, this indicates that the name matches across systems where the veteran record exists.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.SEX_CODE_PRIMARY IS 'Degenerate dimension containing the value of SEX_CODE from the SEX_DIM table. Values are "M","F" and "U".'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.RACE_DESC_PRIMARY IS 'Degenerate dimension containing the value of RACE_DESC from the RACE_DIM table. Value set is "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American",Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White".'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_BIRTH IS 'The date in which a person was born.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_BIRTH_SOURCE IS 'Source system for Date of Birth based on business rules (C=Corporate, B=BIRLS, O=OEI, V=VADIR, U=USVETS).'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_BIRTH_MATCH_CODE IS 'String containing source systems in alphabetic order, that indicates which ones match the value of the standardized DATE_OF_BIRTH.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_DEATH IS 'The date when a person has died.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_DEATH_SOURCE IS 'Source system for Date of Birth based on business rules (C=Corporate, B=BIRLS, O=OEI, V=VADIR, U=USVETS).'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.DATE_OF_DEATH_MATCH_CODE IS 'String containing source systems in alphabetic order, that indicates which ones match the value of the standardized DATE_OF_DEATH.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.VA_EMPLOYEE_IND IS 'Indicates the Veterans Affairs employee.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.ETHNICITY_DESC IS 'The description associated with a claimant''s ethnicity which is available from OEI only.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.BEGIN_DATE IS 'Begin date from which the record is valid.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.END_DATE IS 'End date to which the record is valid.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.CURRENT_RECORD_IND IS 'Type 2 dimensions with current record with ''Y'' and historical records with value ''N''.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.CONGRESSIONAL_DISTRICT IS 'For potential future use.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.CREATE_DATE IS 'Date record was inserted into table.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_DIM.UPDATE_DATE IS 'Date record was updated. This will populated for records where CURRENT_RECORD_IND="N".'
/

-- Table EDW_DEMOGRAPHICS.RACE_DIM

CREATE TABLE EDW_DEMOGRAPHICS.RACE_DIM(
  RACE_DIM_ID Number NOT NULL,
  RACE DESC Varchar2(30 ),
  RACE_DESC_SOURCE Varchar2(1 ),
  RACE_DESC_CORP Varchar2(30 ),
  RACE_DESC_OEI Varchar2(30 ),
  RACE_DESC_USVETS Varchar2(30 ),
  RACE_DESC_VADIR Varchar2(30 ),
  RACE_MATCH_CODE Varchar2(5 ),
  LENGTH_RACE_MATCH_CODE Integer,
  RACE_MATCH_PCT Number
)
/

-- Add keys for table EDW_DEMOGRAPHICS.RACE_DIM

ALTER TABLE EDW_DEMOGRAPHICS.RACE_DIM ADD CONSTRAINT PK_RACE_DIM PRIMARY KEY (RACE_DIM_ID)
/

-- Table and Columns comments section

COMMENT ON TABLE EDW_DEMOGRAPHICS.RACE_DIM IS 'Race Dimension of the Veteran. This provides the "primary" value of Race determined by business rules. Also provides the value of Race from all sources where data is available.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DIM_ID IS 'Dimension key.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE DESC IS 'Description of Race. Value set is "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American",Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White".'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DESC_SOURCE IS 'Source system used based on business rules defined in SEX_CODE (U=USVETS, V=VADIR). If veteran does not exist in either VADIR or USVETS, then ''X''.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DESC_CORP IS 'Value of Race from CORP standardized to the values of "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American","Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White". If value of Race is NULL, then "Multiple Race/Unknown Race". If veteran not in CORP, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DESC_OEI IS 'Value of Race from OEI standardized to the values of "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American",Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White". If veteran not in OEI, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DESC_USVETS IS 'Value of Race from USVETS standardized to the values of "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American",Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White". If veteran not in USVETS, then X.
'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_DESC_VADIR IS 'Value of Race from VADIR standardized to the values of "American Indian/Alaska Native","Asian","Asian or Pacific Islander Unspecified","Black/African American",Multiple Race/Unknown Race","Native Hawaiian/Pacific Islander","Other","White". If veteran not in VADIR, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_MATCH_CODE IS 'Using the RACE_DESC, create a string, in alphabetic order, that indicates which systems contain that value.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.LENGTH_RACE_MATCH_CODE IS 'Length of string of the RACE_MATCH_CODE column. Provides a measure of source system matches for data quality purposes.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.RACE_DIM.RACE_MATCH_PCT IS 'Percentage of matches of race code across sources where veteran record exists. If percentage is 100, this indicates that the value of race code is the same for the columns RACE_DESC_CORP, RACE_DESC_OEI, RACE_DESC_VADIR and RACE_DESC_USVETS where the values != ''X''.'
/

-- Table EDW_DEMOGRAPHICS.SEX_DIM

CREATE TABLE EDW_DEMOGRAPHICS.SEX_DIM(
  SEX_DIM_ID Number NOT NULL,
  SEX CODE Varchar2(1 ),
  SEX_DESC Varchar2(30 ),
  SEX_CODE_SOURCE Varchar2(1 ),
  SEX_CODE_BIRLS Varchar2(1 ),
  SEX_CODE_CORP Varchar2(1 ),
  SEX_CODE_OEI Varchar2(1 ),
  SEX_CODE_USVETS Varchar2(1 ),
  SEX_CODE_VADIR Varchar2(1 ),
  SEX_MATCH_CODE Varchar2(5 ),
  LENGTH_SEX_MATCH_CODE Integer,
  SEX_MATCH_PCT Number
)
/

-- Add keys for table EDW_DEMOGRAPHICS.SEX_DIM

ALTER TABLE EDW_DEMOGRAPHICS.SEX_DIM ADD CONSTRAINT PK_SEX_DIM PRIMARY KEY (SEX_DIM_ID)
/

-- Table and Columns comments section

COMMENT ON TABLE EDW_DEMOGRAPHICS.SEX_DIM IS 'Sex Dimension of the Veteran. This provides the "primary" value of Sex determined by business rules. Also provides the value of Sex from all sources where data is available.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX CODE IS 'Sex Code. Values are "M","F" and "U".'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_DESC IS 'Sex Description. Values are "FEMALE", "MALE" and "UNKNOWN".'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_SOURCE IS 'Source system used based on business rules defined in SEX_CODE (C=Corporate, B=BIRLS, O=OEI, V=VADIR, U=USVETS).'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_BIRLS IS 'Sex code from BIRLS. If veteran not in BIRLS, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_CORP IS 'Sex code from CORP. If veteran not in CORP, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_OEI IS 'Sex code from OEI. If veteran not in OEI, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_USVETS IS 'Sex code from USVETS. If veteran not in USVETS, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_CODE_VADIR IS 'Sex code from VADIR. If veteran not in VADIR, then X.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_MATCH_CODE IS 'Using the SEX_CODE, create a string, in alphabetic order, that indicates which systems contain that value.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.LENGTH_SEX_MATCH_CODE IS 'Length of string of the SEX_MATCH_CODE column. Provides a measure of source system matches for data quality purposes.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.SEX_DIM.SEX_MATCH_PCT IS 'Percentage of matches of sex code across sources where veteran record exists. If percentage is 100, this indicates that the value of race code is the same for the columns SEX_CODE_BIRLS, SEX_DESC_CORP, SEX_DESC_OEI, SEX_DESC_VADIR and SEX_DESC_USVETS where the values != ''X''.'
/

-- Table EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM

CREATE TABLE EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM(
  VETERAN_ADDRESS_DIM_SID Number NOT NULL,
  VETERAN_ADDRESS_SOURCE Varchar2(1 ),
  ADDRESS_DIM_SID Number CONSTRAINT SYS_C00108083 NOT NULL,
  PARTICIPANT_ID Number(15,0),
  ADDRESS_LINE_ONE Varchar2(50 ),
  ADDRESS_LINE_TWO Varchar2(35 ),
  ADDRESS_LINE_THREE Varchar2(35 ),
  BAD_ADDRESS_IND Varchar2(1 ),
  CITY_NAME Varchar2(30 ),
  COUNTRY_TYPE_NAME Varchar2(50 ),
  COUNTY_NAME Varchar2(30 ),
  EFT_WAIVER_TYPE_NAME Varchar2(50 ),
  EMAIL_ADDRESS_ID Varchar2(254 ),
  FMS_ADDRESS_CODE_TEXT Varchar2(2 ),
  FOREIGN_POSTAL_CODE Varchar2(16 ),
  LOCATION_NAME Varchar2(50 ),
  MILITARY_POSTAL_TYPE_CODE Varchar2(12 ),
  MILITARY_POST_OFFICE_TYPE_CODE Varchar2(12 ),
  POSTAL_CODE Varchar2(2 ),
  PROVINCE_NAME Varchar2(35 ),
  PARTICIPANT_ADDRESS_ID Number(15,0),
  PARTICIPANT_ADDRESS_TYPE_NAME Varchar2(50 ),
  TREASURY_SEQUENCE_NUMBER Number(4,0),
  TERRITORY_NAME Varchar2(35 ),
  ZIP_PREFIX_NUMBER Varchar2(5 ),
  ZIP_FIRST_SUFFIX_NUMBER Varchar2(4 ),
  ZIP_SECOND_SUFFIX_NUMBER Varchar2(2 ),
  TREASURY_ADDRESS_LINE_ONE Varchar2(20 ),
  TREASURY_ADDRESS_LINE_TWO Varchar2(20 ),
  TREASURY_ADDRESS_LINE_THREE Varchar2(20 ),
  TREASURY_ADDRESS_LINE_FOUR Varchar2(20 ),
  TREASURY_ADDRESS_LINE_FIVE Varchar2(20 ),
  TREASURY_ADDRESS_LINE_SIX Varchar2(20 ),
  SHARED_ADDRESS_IND Varchar2(1 ),
  ADDRESS_EFFECTIVE_DATE Date,
  ADDRESS_END_DATE Date,
  ADDRESS_TYPE Varchar2(12 ),
  STATE_NAME Varchar2(30 ),
  COUNTRY_CODE Varchar2(3 ),
  CRC_NUMBER Number,
  BEGIN_EFFECTIVE_DATE Date CONSTRAINT SYS_C00108084 NOT NULL,
  END_EFFECTIVE_DATE Date CONSTRAINT SYS_C00108085 NOT NULL,
  CURRENT_RECORD_IND Varchar2(2 ) CONSTRAINT SYS_C00108086 NOT NULL,
  DW_LOAD_DATE Date CONSTRAINT SYS_C00108087 NOT NULL,
  ADDRESS_VALID_GEO_DIM_SID Number,
  GEOCODING_STATUS Varchar2(10 ),
  CONGRESSTIONAL_DISTRICT Varchar2(3 ),
  MAIL_SCORE Varchar2(2 ),
  MATCH_CODE Varchar2(4 ),
  ZIP_9DIGIT Varchar2(12 ),
  POST_CD_NEW Varchar2(4 )
)
NO INMEMORY
/

-- Add keys for table EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM

ALTER TABLE EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM ADD CONSTRAINT PK_ADDRESS_DIM PRIMARY KEY (VETERAN_ADDRESS_DIM_SID)
/

-- Table and Columns comments section

COMMENT ON TABLE EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM IS 'Veteran Address is sourced from Corporate and VADIR. VETERAN_ADDRESS_SOURCE denotes source of records.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.VETERAN_ADDRESS_DIM_SID IS 'Primary key for the Veteran Address Dimension table.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.VETERAN_ADDRESS_SOURCE IS 'Source of address. Initiall with have either C for Corporate and V for VADIR.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_DIM_SID IS 'Primary Key from the Address Dimension source table in Corporate'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.PARTICIPANT_ID IS 'PARTICIPANT ADDRESS PARTICIPANT IDENTIFIER'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_LINE_ONE IS 'This is the first line of the address. This usually contains the street number and name.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_LINE_TWO IS 'This is the second line of the address.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_LINE_THREE IS 'This is the third line of the address.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.BAD_ADDRESS_IND IS 'This will indicate if the address existing for the person is valid or not.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.CITY_NAME IS 'The name of the city where the address is located. IN the U.S. this is required.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.COUNTRY_TYPE_NAME IS 'PARTICIPANT ADDRESS COUNTRY TYPE NAME'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.COUNTY_NAME IS 'The name of the county where the address is located.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.EFT_WAIVER_TYPE_NAME IS 'A word or phrase that provides a unique description of an EFT WAIVER TYPE.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.EMAIL_ADDRESS_ID IS 'This is the entire e-mail address of the person.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.FMS_ADDRESS_CODE_TEXT IS 'FMS Address Code'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.FOREIGN_POSTAL_CODE IS 'The distinct postal code used by a country to route mail to residences or businesses.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.LOCATION_NAME IS 'The name of an affiliate of an organization. An example would be Univ of MD Bookstore on one address for the PTCPNT/ORG of University of Maryland.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.MILITARY_POSTAL_TYPE_CODE IS 'A representation of a finite, pre-determined value or status that applies to a type of a MILITARY POSTAL. See VBA Corporate Architecture web site for the exact values.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.MILITARY_POST_OFFICE_TYPE_CODE IS 'A representation of a finite, pre-determined value or status that applies to a type of a MILITARY POST OFFICE. See VBA Corporate Architecture web site for the exact values.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.POSTAL_CODE IS 'Postal Code'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.PROVINCE_NAME IS 'A geographic area within a country usually containing one of more population centers where residences and businesses exist.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.PARTICIPANT_ADDRESS_ID IS 'PTCPNT_ADDRS_ID: a sequential number that is the unique key of this table'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.PARTICIPANT_ADDRESS_TYPE_NAME IS 'A word or phrase that provides a unique description of a PARTICIPANT ADDRESS'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_SEQUENCE_NUMBER IS 'PARTICIPANT ADDRESS DEPARTMENT OF TREASURY SEQUENCE NUMBER.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TERRITORY_NAME IS 'A geographic area within a country where residences and businesses exist.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ZIP_PREFIX_NUMBER IS 'Zip Code'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ZIP_FIRST_SUFFIX_NUMBER IS 'This is the final four digits of a nine (9) digit zip code.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ZIP_SECOND_SUFFIX_NUMBER IS 'This is the final two digits of a nine (9) digit zip code.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_ONE IS 'Treasury interface address line 1'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_TWO IS 'Treasury interface address line 2'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_THREE IS 'Treasury interface address line 3'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_FOUR IS 'Treasury interface address line 4'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_FIVE IS 'Treasury interface address line 5'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.TREASURY_ADDRESS_LINE_SIX IS 'Treasury interface address line 6'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.SHARED_ADDRESS_IND IS 'This indicates, for example, that a Fiduciary or POA represents more than one beneficiary or veteran and therefore the sharing of addresses is supported. When the value of this indicator is Y the following edits apply on insert or update: ADDRS_ONE_TXT and ADDRS_TWO_TXT must not exceed 20 characters ADDRS_THREE_TXT must be null PTCPNT_SHORT_NM for this PTCPNT_ID in the PTCPNT table must be populated'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_EFFECTIVE_DATE IS 'Date address is effective'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_END_DATE IS 'Date address is no longer effective'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_TYPE IS 'Determines address type (US, Foreign, other or unknown)'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.STATE_NAME IS 'Fully spelled state name'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.COUNTRY_CODE IS '3 digit country code'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.CRC_NUMBER IS 'Number generated by CRC to uniquely identify each row'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.BEGIN_EFFECTIVE_DATE IS 'Date the row becomes the current row'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.END_EFFECTIVE_DATE IS 'Date the row is no longer the current row'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.CURRENT_RECORD_IND IS 'Indicator that indicates if the row is the current row'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.DW_LOAD_DATE IS 'Date the row was loaded into the DW'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.VETERAN_ADDRESS_DIM.ADDRESS_VALID_GEO_DIM_SID IS 'The unique system identifier of the Address Validated Geocode Dimension table.'
/

-- Table EDW_DEMOGRAPHICS.GENDER_DIM

CREATE TABLE EDW_DEMOGRAPHICS.GENDER_DIM(
  GENDER_DIM_ID Number DEFAULT -99 NOT NULL,
  GENDER_DESC Varchar2(30 )
)
/
INSERT INTO GENDER_DIM(GENDER_DIM_ID, GENDER_DESC)
VALUES (-99,'TBD')
/
COMMIT
/


-- Add keys for table EDW_DEMOGRAPHICS.GENDER_DIM

ALTER TABLE EDW_DEMOGRAPHICS.GENDER_DIM ADD CONSTRAINT PK_GENDER_DIM PRIMARY KEY (GENDER_DIM_ID)
/

-- Table and Columns comments section

COMMENT ON TABLE EDW_DEMOGRAPHICS.GENDER_DIM IS 'Gender Dimension. For future use purposes when Gender is available in source systems. Initially there will be a single record in this table with values of GENDER_DIM_ID=-99 and GENDER_CODE=TBD.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.GENDER_DIM.GENDER_DIM_ID IS 'Unique Identifier (surrogate key) for Gender.'
/
COMMENT ON COLUMN EDW_DEMOGRAPHICS.GENDER_DIM.GENDER_DESC IS 'Gender Description.'
/


