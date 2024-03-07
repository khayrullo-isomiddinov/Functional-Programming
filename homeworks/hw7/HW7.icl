module HW7
import StdEnv

/*

	NEPTUN CODE: BET9FI
	NAME: Khayrullo Isomiddinov
	
*/

/*	1
	Write a function rotateArray that takes an array of integers and an integer. 
	The function should perform a right rotation on the array by n steps and return the resulting array.
	
	The rotation should be "right," meaning that each element shifts to the right by n positions, 
	and the elements that go beyond the right end reappear at the left end of the array.
	This task does not consider negative values of rotation steps.
*/

rotateArray :: {Int} Int -> {Int}
rotateArray myArray n = listToArray (rotateArrayAux (arrayToList myArray) n)

arrayToList :: {Int} -> [Int]
arrayToList arr = [x \\ x <-: arr]

listToArray :: [Int] -> {Int}
listToArray list = {c \\ c <- list}

rotateArrayAux :: [Int] Int -> [Int]
rotateArrayAux arr steps
| isEmpty arr = []
| otherwise = rotatedList
    
where
     len = length arr
     rotation = steps rem len
     rotatedList = drop (len - rotation) arr ++ take (len - rotation) arr

//Start = rotateArray {5, 15, 25, 35, 45} 5 // {5,15,25,35,45}
//Start = rotateArray {3, 6, 9, 12, 15} 0 // {3,6,9,12,15}
//Start = rotateArray {5, 15, 25, 35, 45} 4 // {15,25,35,45,5}
//Start = rotateArray {10, 20, 30, 40, 50} 7 // {40,50,10,20,30}
//Start = rotateArray {1, 2, 3, 4, 5} 2 // {4,5,1,2,3}



/* 2
	In an effort to support the transition to electric vehicles (EVs), 
	a network of EV charging stations has been set up across a country. 
	Each station is identified by a unique positive integer. 
	Over time, some stations become outdated or malfunction due to various reasons,
	requiring replacement with newer models.
	
	Write a function to manage the replacement of old charging stations with new ones. 
	
	The function will take three arrays of integers as input:
	Current Stations: An array representing the currently operational stations.
	Outdated Stations: An array representing the stations that need to be replaced, sorted by the order in which they will be replaced.
	New Stations: An array representing the new stations that will replace the outdated ones, sorted in the corresponding order of replacement.
 	Your function should return an updated array of the current stations after all replacements have been made.
 	
 	stationManagement  {15, 22, 34, 47, 53, 60} {22, 47, 15} {101, 102, 103}
 	Initial State:
	Current Stations: {15, 22, 34, 47, 53, 60}

	First Replacement:
	Outdated Station to Replace: 22
	New Station for Replacement: 101
	After replacement, the 22 in the current stations is replaced with 101.
	Updated Current Stations: {15, 101, 34, 47, 53, 60}

	Second Replacement:
	Outdated Station to Replace: 47
	New Station for Replacement: 102
	After replacement, the 47 in the current stations is replaced with 102.
	Updated Current Stations: {15, 101, 34, 102, 53, 60}

	Third Replacement:
	Outdated Station to Replace: 15
	New Station for Replacement: 103
	After replacement, the 15 in the current stations is replaced with 103.
	Updated Current Stations: {103, 101, 34, 102, 53, 60}
	
	Final Result:
	The final updated list of current stations after all replacements is {103, 101, 34, 102, 53, 60}.
 	
*/

stationManagement:: {Int} {Int} {Int} -> {Int}
stationManagement a b c = listToArray (station (arrayToList a) (arrayToList b) (arrayToList c))

aux :: [Int] [Int] -> [Int]
aux ls0 ls1 = [ x \\ x <- ls0 | not (isMember x ls1)]

station :: [Int] [Int] [Int] -> [Int]
station a b c = aux a b ++ c

//Start = stationManagement  {15, 22, 34, 47, 53, 60} {22, 47, 15} {101, 102, 103} //{103, 101, 34, 102, 53, 60}
//Start = stationManagement {2,4,9,3,8,7} {2,9,10,7} {10,6,5,11} // {5,4,6,3,8,11}
//Start = stationManagement {7,5,6,3,8} {5,3,2} {2,4,10} 		    // {7,10,6,4,8}
//Start = stationManagement {0,3,8,9} {} {} 				   // {0,3,8,9}
//Start = stationManagement {} {2,0,9,4} {8,3,5,6}			  // {}


