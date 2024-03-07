module HW4
import StdEnv
import StdClass

/*

	NEPTUN CODE: BET9FI
	NAME: Khayrullo Isomiddinov
	
*/

/*1.
	Given a 2-dimensional list, save the specific number of every sublist in one list.
	If the length of the sublist is odd, keep the average of the first and the last elements.
	If the length of the sublist is even, which means it has 2 middle elements, so just keep the sum of 2 middle elements.
	The specific number should bigger than 0.
	For Ex: [[4,-4,-8,10],[3,0,3],[3,2,1,87],[2],[7,8,9]]
			[	 -12	,	 3  ,	 3 		, 2 ,   8 	] 
			[3,3,2,8] is result.
			
*/

aux :: [Int] -> Int
aux list
| length list == 2 = sum list
| isEven (length list) = sum (init (drop 1 list))
= (hd list + last list)/2

GetSublist :: [[Int]] -> [Int] 
GetSublist [] = []
GetSublist [x:xs]
| (aux x) > 0 = [ aux x : GetSublist xs]
= GetSublist xs

//Start =GetSublist  [[4,-4,-8,10],[3,0,3],[3,2,1,87],[2],[7,8,9]] 	// [3,3,2,8]
//Start =GetSublist  [[],[3],[0],[-2,1],[11,55,33]] 					// [3,22]
//Start =GetSublist  [[23,3,5],[-4,5],[2,6,8]] 						// [14,1,5]
//Start =GetSublist  [] 												// []


/*2
Pyramid Pattern Generator
Write a program that takes two argument,a list of tuples and a Int as input. 
The value of Int is one more than the base of Pyramid.
Each tuple consists of a character and an integer. 
The program should generate a pyramid pattern using these tuples. 
Each line of the pyramid pattern is created by placing the character from the tuple at the center, 
and it is repeated the number of times specified by the integer. 
The space on either side of the character pattern makes it look like a pyramid.

For example:[('o',9),('*',8),('#',7),('%',6),('@',5),('!',4),('&',3),('$',2),('^',1)] 10 (The ten is 9 + 1)
	"o o o o o o o o o
 	  * * * * * * * *
   	   # # # # # # #
        % % % % % %
         @ @ @ @ @
          ! ! ! !
           & & &
            $ $
             ^
 	 "

	Hint:
    The Int parameter can be used to calculate the number of " " needed.
	"\n" is a new line character, 
	"\b" is a backspace character,
	and spaces and backspaces can be used to create the pyramid effect.

*/


//generatePyramid :: [(Char,Int)] Int -> String
//generatePyramid tuple k

//Start= generatePyramid [('o',9),('*',8),('#',7),('%',6),('@',5),('!',4),('&',3),('$',2),('^',1)] 10
//Start=generatePyramid[('o',1),('*',2),('#',3)] 4
//Start=generatePyramid[('o',6),('*',5),('#',4),('%',3),('@',2),('!',1)] 7
//Start=generatePyramid[('o',9),('*',0),('#',7),('%',0),('@',5),('!',0),('&',3),('$',0),('^',1)] 10
//Start=generatePyramid[('o',1),('*',2),('#',0),('%',4),('@',0),('!',6),('&',0),('$',8),('^',0)] 10
