module HW3
import StdEnv

/*

	NEPTUN CODE: BET9FI
	NAME:Isomiddinov Khayrullo
	
	REMEMBER: PLAGIARISM IS ZERO!

	Your submission should not have any errors when running the code.

	It is possible to get partial points for not working code, but please make sure you comment out the errors.

	You should not delete anything from the given code, given test cases should stay the same, but you can add 
	your tests as well. Don't change the given function signatures, however, you can add as many functions as 
	you wish, just make sure to name them appropriately (if function squares the number, call it 'square',
	'second_power', etc. and not 'f' or 'g'). The same goes for variable names. 

	Make sure that you comment all 'Start'-s before submitting the code.

*/


/*
1. Given a list of integer and the function will have to check if all elements of the list
are multiple of nine or even.
*/

collector9 :: [Int] -> [Int]
collector9 [] = []
collector9 [x:xs]
| x rem 9 == 0 = [x:collector9 xs]
= collector9 xs

evenCollector :: [Int] -> [Int]
evenCollector [] = []
evenCollector [x:xs]
| isEven x = [x : evenCollector xs]
= evenCollector xs

//Start = collector9 [1..10]

isAllEvenO9 :: [Int] -> Bool
isAllEvenO9 list
| collector9 list == list || evenCollector list == list = True
= False

//Start = isAllEvenO9 [2,10,16,4,8,100,0] 		// True 	// all even
//Start = isAllEvenO9 [1,4,5,8,10] 			// False 	// mixed numbers
//Start = isAllEvenO9 [18,63,9999,81] 			// True 	// all multiple of nine
//Start = isAllEvenO9 [-18,-9,190,999] 		// False	// mixed - //

/*2:

You are given a list of integers as input. Remove those numbers from the list, whose frequency are Even.

Example:
In the list [2,2,3,3,3,5,5,5,5,7,7,11,13,13,13,17,17,17,17], 
the frequency of the number 2,5,7,17 are even.Keep the other numbers and order.
Output: [3,3,3,11,13,13,13]
*/

Keep :: [Int] -> [Int]
Keep list = [i \\ i <- list | isOdd (count i list)]
	
	where count x xs = length [y \\ y <- xs | y == x]

//Start = Keep [2,2,3,3,3,5,5,5,5,7,7,11,13,13,13,17,17,17,17]//[3,3,3,11,13,13,13]
//Start = Keep []//[]
//Start = Keep [11,11,22,22,22,33,33,33,33]//[22,22,22]