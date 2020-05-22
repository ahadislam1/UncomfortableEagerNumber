/*
Create a function or method that when given a time (a string in HH:MM format) give this smallest angle created between the hour and minute hands on a circular wall clock.

A circlular wall clock is... a circle
A circle is 360 degrees.

There are 12 hour positions.
Dividing 360 / 12 = 30
Each hour is 30 degrees

There are 60 minute posiitions.
Dividing 360/ 60 = 6
Each minute is 6 degrees

At 3:00, the hour hand is at 3
the minnute hand is at 12.

The smallest angle made between the two hands is 90 degrees.

At 4:45, the hour hand is at 4
The minute hand is at 9

The smallest angle made between the two hands is 150 degrees.

*/

func timeToTuple(_ time: String) -> (Double, Double) {
  //time is a string displayed as "HH:MM"
  //we'll also assume the time is in a 12h format.

  // seperates the string by the colon, and gives us two elements [HH, MM]
  let stringArray = time.split(separator: ":")

  // converts each string to integer
  let doubleArray = stringArray.compactMap { Double($0) }

  return (doubleArray[0], doubleArray[1])

}


func smallestAngle(_ time: String) -> Double {
  let tuple = timeToTuple(time)

  // initializing the hours and minutes
  let hour = tuple.0
  let minute = tuple.1

  // minute / 60 allows us to show the exact position of the hourhand.
  let hourInDegrees = (hour + (minute / 60)) * 30
  let minuteInDegrees = minute * 6

  let angle = abs(hourInDegrees - minuteInDegrees)
  let secondAngle = 360 - angle
  return angle < secondAngle ? angle : secondAngle
}

print(smallestAngle("3:52"))
print(smallestAngle("3:00"))
print(smallestAngle("3:45"))