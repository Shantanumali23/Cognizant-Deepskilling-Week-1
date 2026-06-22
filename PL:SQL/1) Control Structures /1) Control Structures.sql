CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    CONSTRAINT fk_customer
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (1, 'Shantanu', 65, 15000, 'FALSE');
INSERT INTO Customers VALUES (2, 'Rahul', 45, 8000, 'FALSE');
INSERT INTO Customers VALUES (3, 'Amit', 70, 20000, 'FALSE');
INSERT INTO Customers VALUES (4, 'Priya', 30, 12000, 'FALSE');

INSERT INTO Loans VALUES (101, 1, 8.50, SYSDATE + 20);
INSERT INTO Loans VALUES (102, 2, 9.00, SYSDATE + 50);
INSERT INTO Loans VALUES (103, 3, 7.50, SYSDATE + 10);
INSERT INTO Loans VALUES (104, 4, 8.00, SYSDATE + 25);

COMMIT;

SELECT * FROM Customers;
SELECT * FROM Loans;

DECLARE
BEGIN
   DBMS_OUTPUT.PUT_LINE('Testing');
END;
/


BEGIN
FOR cust IN (
SELECT CustomerID
FROM Customers
WHERE Age > 60
)
LOOP
UPDATE Loans
SET InterestRate = InterestRate - 1
WHERE CustomerID = cust.CustomerID;


    DBMS_OUTPUT.PUT_LINE('Discount applied for Customer ID: '|| cust.CustomerID);
END LOOP;

COMMIT;


END;
/



DECLARE
BEGIN
    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP
        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE CustomerID = cust.CustomerID;

        DBMS_OUTPUT.PUT_LINE(
            'VIP Status Granted to Customer ID: '
            || cust.CustomerID
        );
    END LOOP;

    COMMIT;
END;
/


DECLARE
BEGIN
    FOR loan_rec IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE
        AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear '
            || loan_rec.Name
            || ', Loan ID '
            || loan_rec.LoanID
            || ' is due on '
            || loan_rec.DueDate
        );
    END LOOP;
END;
/