-- =========================================
-- TABLE CREATION
-- =========================================

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);

-- =========================================
-- SAMPLE DATA
-- =========================================

INSERT INTO Accounts VALUES (101,'Shantanu','Savings',10000);
INSERT INTO Accounts VALUES (102,'Rahul','Savings',15000);
INSERT INTO Accounts VALUES (103,'Amit','Current',20000);

INSERT INTO Employees VALUES (1,'Priya','IT',50000);
INSERT INTO Employees VALUES (2,'Rohit','IT',60000);
INSERT INTO Employees VALUES (3,'Anjali','HR',45000);

COMMIT;

-- =========================================
-- SCENARIO 1
-- PROCESS MONTHLY INTEREST
-- =========================================

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly Interest Applied Successfully');
END;
/

-- Execute Procedure

BEGIN
    ProcessMonthlyInterest;
END;
/

-- =========================================
-- SCENARIO 2
-- UPDATE EMPLOYEE BONUS
-- =========================================

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_percent / 100)
    WHERE Department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Bonus Updated Successfully');
END;
/

-- Execute Procedure

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

-- =========================================
-- SCENARIO 3
-- TRANSFER FUNDS
-- =========================================

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from_account;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Fund Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account Not Found');
END;
/

-- Execute Procedure

BEGIN
    TransferFunds(101,102,2000);
END;
/

-- =========================================
-- VERIFY RESULTS
-- =========================================

SELECT * FROM Accounts;

SELECT * FROM Employees;