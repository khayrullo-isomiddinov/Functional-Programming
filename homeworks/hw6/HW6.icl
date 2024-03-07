module HW6
import StdEnv
/*

	NEPTUN CODE: BET9FI
	NAME: Khayrullo Isomiddinov
	
*/
/*
	Given a list of tuple, whose first element is String and second element is list of Integer
	the task is to expand the given list of tuple into the list of tuple (String,[Int]).
	Reducing can be done as shown below:
	[("ewio",[20,78,90,75,29]),("duinhe",[65,75,85,95,100])] 
	
	For first tuple ("ewio",[20,78,90,75,29]) : The average value of the list is less than 75, so there is no need to expand this tuple.
					("duinhe",[65,75,85,95,100]) :The average value of the list is greater than 75 ,each number greater than 85 : ("duinhe",[85]),("duinhe",[95]),("duinhe",[100])
					
		
	The result will be [("duinhe",[85]),("duinhe",[95]),("duinhe",[100])]
	
	ps: If there is a flashback, check that the denominator is zero (the denominator cannot be zero)
*/

ExpandGrade :: [(String,[Int])]-> [(String, [Int])]

//Start = ExpandGrade [("ewio",[20,78,90,75,29]),("duinhe",[65,75,85,95,100])] 			// [("duinhe",[85]),("duinhe",[95]),("duinhe",[100])]
//Start = ExpandGrade [("abcd",[81,65,40,79,39]),("hbvs",[96,94,81,90,79]),("oifj",[98,78,88,99])] 	//[("hbvs",[96]),("hbvs",[94]),("hbvs",[90]),("oifj",[98]),("oifj",[88]),("oifj",[99])]
//Start = ExpandGrade [("fijs",[0]),("aoek",[]),("ojaf",[75,85])] 							// [("ojaf",[85])]
//Start = ExpandGrade [("fjao",[-20,-40]),("kpof",[95])] 								// [("kpof",[95])]
//Start = ExpandGrade [] //[]


/* 
	Given 2-D list of integer, 
	return the list of 3-element tuples 
	where 1st element is the integer from the given list, and 
	second element is its row index and 
	3rd element is its column index.
	Ex: [[7,5,8,4],
		 [3,2,9],
		 [6,1],
		 [0,-4]] is given, and
		 
	The result = [(7,0,0),(5,0,1),(8,0,2),(4,0,3),
	 			  (3,1,0),(2,1,1),(9,1,2)
	 			  (6,2,0),(1,2,1),
	 			  (0,3,0),(-4,3,1)]
*/

indexLocation :: [[Int]] -> [(Int,Int,Int)]

//Start = indexLocation [[7,5,8,4],[3,2,9],[6,1],[0,-4]] // [(7,0,0),(5,0,1),(8,0,2),(4,0,3),(3,1,0),(2,1,1),(9,1,2),(6,2,0),(1,2,1),(0,3,0),(-4,3,1)]
//Start = indexLocation [[],[8,9,2],[3,5,6,5]]	// [(8,1,0),(9,1,1),(2,1,2),(3,2,0),(5,2,1),(6,2,2),(5,2,3)]
//Start = indexLocation [[],[],[]] // []
//Start = indexLocation [] // []