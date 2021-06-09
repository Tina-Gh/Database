select CustomerId, CustFirstName, CustLastName
 from Customer
 where CustCountry = (select EmpCountry
					  from Employee
					  where ReportsTo is null)
 and CustState = (select EmpState
				  from Employee
				  where ReportsTo is null)
 and CustCity = (select EmpCity
				 from Employee
				 where ReportsTo is null);
