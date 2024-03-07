module HW5
import StdEnv

/*

	NEPTUN CODE: BET9FI
	NAME: Khayrullo Isomiddinov
	
	REMEMBER: PLAGIARISM IS ZERO!

	Your submission should not have any errors when running the code.

	It is possible to get partial points for not working code, but please make sure you comment out the
	errors.

	You should not delete anything from the given code, given test cases should stay the same, but 
	you can add 
	your tests as well. Don't change the given function signatures, however, you can add as many 
	functions as 
	you wish, just make sure to name them appropriately 
	(if function squares the number, call it 'square',
	'second_power', etc. and not 'f' or 'g'). 
	The same goes for variable names. 

	Make sure that you comment all 'Start'-s before submitting the code.

*/

/*	1
	You are given the Titius–Bode law to predict the distances of planets from the Sun:
						a = 0.4+ 0.3* 2^n
	Where a is the predicted distance in astronomical units (AU) and n is an integer.
	For input,you have a list of integers representing n values and a list of tuples containing 
	the name of the planet and its actual semi-major axis.
	Please print the a list of tuples containing the name of 
	the planet, its actual semi-major axis, and its predicted distance based on the Titius–Bode law. 
	Only include planets where the error between the actual and predicted distance 
	is less than or equal to 0.25 AU.
	
*/

//titiusBodeDistances :: [Int] [(String,Real)] -> [(String, Real, Real )]
//Start=titiusBodeDistances [-100, 0, 1, 2, 3, 4, 5, 6] [("Mercury",0.39),("Venus",0.72),("Earth",1.0),("Mars",1.52),("Ceres",2.77),("Jupiter",5.2),("Saturn",9.58),("Uranus",19.22)]
//[("Mercury",0.39,0.4),("Venus",0.72,0.7),("Earth",1,1),("Mars",1.52,1.6),("Ceres",2.77,2.8),("Jupiter",5.2,5.2)]


 
/*  2
	A list of tuple (String, Char, Int) and you need to transform the whole list of tuple into the
	list of integer (0 and 1) values which represents Boolean.
	The condition is that if the given string contains the given char at least the given integer times.
		
	1 represents True and 0 represents False.
	
	For example: [("pjifcoajofoj", 'o', 2), ("idsjodpcd", 'i', 2),............]
	
	Then the result will be [1,0,......]; Explanation: 
	
	for the first tuple: there are 3 'o' inside the given string and the given integer is 
	2, ('o' has at least 2 frequency inside the string), 
	so the first tuple is True and you store 1 for the 
	first tuple for the second tuple: there are 1 'i' inside 
	the given string and the given integer is 2, (the given string doesn't have at least 2 'i') so, 
	the second tuple is False and you store 0 for the second tuple.
*/

compare :: [Char] Char -> Int
compare [] c = 0
compare [x:xs] c
| c == x = 1 + compare xs c
= compare xs c

compare2 :: String Char -> Int
compare2 str c = compare (fromString str) c

compare3 :: String Char Int -> Int
compare3 str c k
| k <= compare2 str c = 1
= 0

checkEnoughFrequency :: [(String, Char, Int)] -> [Int]
checkEnoughFrequency [] = []
checkEnoughFrequency [(str, c, k) : xs ]
| compare3 str c k == 1 = [ 1 : checkEnoughFrequency xs]
= [ 0 : checkEnoughFrequency xs]

//Start = checkEnoughFrequency [("jofjsfoajof", 'f', 2), ("mxbawpedep", 'b', 2), ("pkaowacwidojoadw", 'w', 3)]		
// [1,0,1]
//Start = checkEnoughFrequency [("", 'o', 0), ("fds", 'i', 2)] 													// [1, 0]
//Start = checkEnoughFrequency [] 																				// []
//Start = checkEnoughFrequency [("fffff", 'f', 3),("ppppp", 'p', 5)] 												// [1,1]
