module HW1
import StdEnv

//Please write your name and neptun code here: Khayrullo Isomiddinov BET9FI
/*
Your submission should not have any errors when running the code.

It is possible to get partial points for not working code, but please make sure you comment out the errors.

You'll receive a total of 100 points when you successfully solve both problems, with 50 points awarded 
for each.

You should not delete anything from the given code, given test cases should stay the same, but you can add 
your tests as well. Don't change the given function signatures. 

Make sure that you comment all 'Start'-s before submitting the code.

    Hint : 
        1. To abort with a message you can use the 'abort' function. (= abort "any text").        
        2. Hint:use toInt,toReal,toString functions when you need them.
		 
*/
/*
Ex 1: 
 A leap year is a year that contains an additional day, February 29th, making it 366 days 
 long instead of the usual 365 days. Leap years are necessary to keep our calendar in alignment 
 with the Earth's revolutions around the Sun.

 A year is a leap year if the following conditions are satisfied: 

 The year is multiple of 400.
 The year is a multiple of 4 and not a multiple of 100.
 
 Please write function(s) to return 
 how many year(s) later is the next leap year when the year is not a leap year,
 (!Ignore the situation that the next leap year is in more than 4 years)
 print "This year is a leap year.",when the year is a leap year.
 
*/
isLeap :: Int -> Bool
isLeap x
| x rem 400 == 0 = True
| (x rem 4 == 0) && (x rem 100 <> 0) = True
= False 

leapyear :: Int -> Int 
leapyear x 
| isLeap x = abort "This year is a leap year!"
| isLeap (x + 1) = 1
| isLeap (x + 2) = 2
| isLeap (x + 3) = 3
| isLeap (x + 4) = 4


// Count even digits:



//Start = leapyear 2024 //"This year is a leap year."
//Start = leapyear 2023 //1
//Start = leapyear 2026 //2
//Start = leapyear 2000 //"This year is a leap year."
//Start = leapyear 2100 //4
//Start = leapyear 1900

/*
 Ex 2:
 Define the Area Calculator which can calculate the area of Circle,Square,Equilateral triangle 
 ('c','s','t').Please return the right results.
 If meeting other characters,return 0.
 
 If the character is 'c',given the diameter of a circle, find the area of the circle. pi=3.14
 If the character is 's',given the side lengths of a square, find the area of the square.
 If the character is 't',given the side lengths of a equilateral triangle, find the area of the equilateral triangle.
 The Square Root of Three=1.732
 */

c :: Int -> Real
c x = (3.14 * (toReal(x) / 2.0)^2.0)

//Start = c 2
 
s :: Int -> Real
s x = (toReal x) * (toReal x)

//Start = s 5

t :: Int -> Real
t x = (1.732 / 4.0) * (toReal x)^2.0

//Start = t 2
 
areacalculator :: Char Int -> Real
areacalculator n k
| n == 'c' = c k
| n == 's' = s k
| n == 't' = t k

//Start = areacalculator 'c' 2 //3.14
//Start = areacalculator 's' 5  //25
//Start= areacalculator 't' 2 //1.732
