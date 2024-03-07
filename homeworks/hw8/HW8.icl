module HW8
import StdEnv

/*

	NEPTUN CODE: BET9FI
	NAME: Khayrullo Isomiddinov  
	
*/

/* 1. 
	  Define a Person record which contains name and height two fields,
	  with type of String and Real respectively. Write a function which takes a person
	  and a certain height, if the person is taller than 1.70, subtract their height by 1%

*/
::Person1 = { name :: String, tall :: Real}
John::Person1
John={name = "John", tall= 1.78}
Mike::Person1
Mike={name = "Mike", tall= 1.58}
Lily::Person1
Lily={name = "Lily", tall= 1.85}

ChangeHeight :: Person1 -> Person1
ChangeHeight x 
| x.tall > 1.70 = {name = x.name, tall = x.tall * 0.99 }
= {name = x.name, tall = x.tall }

//Start = ChangeHeight John // (Person1 "John" 1.7622)
//Start = ChangeHeight Mike // (Person1 "Mike" 1.58)
//Start = ChangeHeight Lily // (Person1 "Lily" 1.8315)

::Department = {
		deptno:: Int,
		dname :: String,
		loc :: String
	} 

::Employee = {
		ename :: String,
		sal :: Int,
		dept :: Department
	}
dept1 = { deptno = 10, dname = "Sales", loc = "New York" }
dept2 = { deptno = 20, dname = "Marketing", loc = "Los Angeles" }
dept3 = { deptno = 30, dname = "Human Resources", loc = "Chicago" }
dept4 = { deptno = 40, dname = "Finance", loc = "Houston" }
dept5 = { deptno = 50, dname = "IT", loc = "San Francisco" }

employee1 = { ename = "John Doe", sal = 700, dept = dept2 }
employee2 = { ename = "Jane Smith", sal = 500, dept = dept1 }
employee3 = { ename = "Tom Johnson", sal = 1800, dept = dept3 }
employee4 = { ename = "Sarah Lee", sal = 3000, dept = dept5 }
employee5 = { ename = "Mark Brown", sal = 2500, dept = dept4 }
employee6 = { ename = "Alex Wong", sal = 3200, dept = dept5 }
employee7 = { ename = "Emily Chen", sal = 1900, dept = dept3 }
employee8 = { ename = "Mike Davis", sal = 1700, dept = dept2 }
employee9 = { ename = "Lisa Kim", sal = 2100, dept = dept4 }
employee10 = { ename = "Kevin Patel", sal = 3300, dept = dept1 }
employee11 = { ename = "David Lee", sal = 2400, dept = dept2 }
employee12 = { ename = "Karen Brown", sal = 900, dept = dept1 }
employee13 = { ename = "Steven Kim", sal = 2000, dept = dept3 }
employee14 = { ename = "Jennifer Lee", sal = 4200, dept = dept5 }
employee15 = { ename = "Chris Johnson", sal = 1900, dept = dept4 }

employees = [employee1, employee2, employee3, employee4, employee5, employee6, employee7, employee8, employee9, employee10, employee11, employee12, employee13, employee14, employee15]

departments = [dept1, dept2, dept3, dept4, dept5]

/*	2
 	
 	a. Given a list of employees, and the department number. Return the average salary for the 
 	given department number.
 	
 	b. Return a list of tuples containing department names and average salaries(String,Int)
*/


countn :: [Employee] Int -> Int
countn [] n = 0
countn [x:xs] n
| (x.dept).deptno == n = 1 + countn xs n
= countn xs n

Aux :: [Employee] Int -> Int
Aux [] n = 0
Aux [x:xs] n
| (x.dept).deptno == n = x.sal + Aux xs n
= Aux xs n

AvgsalDepartment :: [Employee] Int -> Int
AvgsalDepartment list k = (Aux list k )/(countn list k)
 

AvgsalList :: [Department] [Employee] -> [(String,Int)]
AvgsalList [dep:deps] [] = []
AvgsalList [] emp = []
AvgsalList [dep:deps] emp = [(dep.dname, AvgsalDepartment emp (dep.deptno)) : AvgsalList deps emp]

//Start = AvgsalDepartment employees 20 //1600 
//Start = AvgsalDepartment employees 30  // 1900
//Start = AvgsalDepartment employees 40  // 2166
//Start = AvgsalDepartment employees 50	// 3466
//Start=AvgsalList departments employees //[("Sales",1566),("Marketing",1600),("Human Resources",1900),("Finance",2166),("IT",3466)]

