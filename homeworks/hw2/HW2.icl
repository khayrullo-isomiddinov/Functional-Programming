module HW2
import StdEnv

//Please write your name and neptun code here: BET9FI
/*
Your submission should not have any errors when running the code.

It is possible to get partial points for not working code, but please make sure you comment out the errors.

You'll receive a total of 100 points when you successfully solve both problems, with 50 points awarded for each.

You should not delete anything from the given code, given test cases should stay the same, but you can add 
your tests as well. Don't change the given function signatures. 

Make sure that you comment all 'Start'-s before submitting the code.
		 
*/
/*
Ex 1: Write a recursive function calculating the sum of the fifth power for specific sequences of numbers.

      Given a non-negative number n, compute the sum of numbers raised to the fifth power based on the following pattern:

      when n is odd number:
      1*1*1*1*1+3*3*3*3*3+ ... +(n-2)*(n-2)*(n-2)*(n-2)*(n-2)+n*n*n*n*n
      
      when n is even number:
      2*2*2*2*2+4*4*4*4*4+...+(n-2)*(n-2)*(n-2)*(n-2)*(n-2)+n*n*n*n*n
      
      Essentially this is the special sum of an equal difference series with a difference of 2
*/

fifthpower :: Int -> Int 
fifthpower n 
| n > 0 = n^5 + fifthpower (n-2)
= 0


//Start = fifthpower 1 // 1
//Start = fifthpower 2 // 32
//Start = fifthpower 6 // 8832
//Start = fifthpower 7 // 20176

/*Ex2:
       The digital square root of a number is obtained as follows:
       Given a number, square its digits. 
       Then, sum the squares of the digits of the number you obtain,and 
       continue this process until you have a single-digit number. 
       Write a recursive function that finds the digital square root 
       of a given positive integer first and then checks if the result is a prime number.
       
       Hint:Consider the prime numbers are less than 10.
*/

sumDigitsSquared :: Int -> Int
sumDigitsSquared x
| x < 10 = x^2
= (x rem 10)^2 + sumDigitsSquared (x/10) 


digSqrt :: Int -> Int
digSqrt n 
| sumDigitsSquared n < 10 = sumDigitsSquared n
= digSqrt (sumDigitsSquared n)

isPrime :: Int -> Bool
isPrime x
| x == 7 || x == 5 || x == 3 || x == 2 = True
= False

primeRoot:: Int -> Bool
primeRoot x
| isPrime (digSqrt x) = True
= False


//Start = primeRoot 6789 // False (because 6^2+7^2+8^2+9^2=230 and 2^2+3^2=13 then 1+3^2=10 and 1^2=1,1 is not a prime number)
//Start = primeRoot 123  // False 
//Start = primeRoot 12   // True