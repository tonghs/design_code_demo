import UIKit

var str = "Hello, playground"

var s = "hello world"

print(s)


var myVariable = 42
myVariable = 42

let myConstant = 42

let explicitDouble: Double = 80

let widthLabel = s + String(myVariable)
"\(s)\(myVariable)"

var shoppingList = ["water", "blue paint"]

shoppingList[1]

var occupations = [
    "tonghs": "Caption",
    "zhang": "Machanic"
]

occupations["tonghs"] = "ooo"
occupations["ths"]

print(occupations)

shoppingList.append("test")

let emptyArry = [String]()
let emptyDict = [String: Float]()

shoppingList = []

let individualScores = [40, 50, 60, 104, 33]

var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "tonghs"
var greeting = "hello"

if let name = optionalName {
    greeting = "hello \(name)"
}

print(greeting)

optionalName = nil
greeting = optionalName ?? "thi"


let vegetable = "red pepper"

switch vegetable {
case "celery":
    print("is a celery")
case let x where x.hasPrefix("red"):
    print("maybe it's red pepper")
default:
    print("do not know what is it")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var largetstKind: String = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largetstKind = kind
        }
    }
}

print(largest)
print(largetstKind)


var m = 2

repeat {
    m *= 2
} while m < 100
print(m)


var n = 2

while n < 100 {
    n *= 2
}

print(n)


var total = 0

for i in 0..<4 {
    total += i
}

print(total)


func greet(person: String, day: String) -> String {
    return "hello \(person), today is \(day)"
}

greet(person: "tonghs", day: "12")


func greet(_ person: String, _ day: String) -> String {
    return "hello \(person), today is \(day)"
}

greet("tonghs", "14")


func greet(_ person: String, on day: String) -> String {
    return "hello \(person), today is \(day)"
}

greet("tonghs", on: "35")


func getNumbers(numbers: [Int]) -> (min: Int, max: Int, sum: Int) {
    var max: Int = numbers[0]
    var min: Int = numbers[0]
    
    var sum: Int = 0
    
    for number in numbers {
        if number > max {
            max = number
        } else if number < min {
            min = number
        }
        
        sum += number
        
    }
    return (min, max, sum)
}

let ret = getNumbers(numbers: [0, 1, 2, 3, 45, 10])
print(ret.min, ret.max, ret.sum)


func decrator() -> ((Int) -> Int) {
    func add(number: Int) -> Int {
        return number + number
    }
    
    return add
}

var inc = decrator()
print(inc(3))


func wrapper(f: ((Int) -> Int), number: Int) -> Int {
    return f(number)
}


func add(number: Int) -> Int {
    return number * 2
}

print(wrapper(f: add, number: 4))


var numbers = [20, 19, 7, 12]

let newArry = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    
    return result
})

print(newArry)


let newArry1 = numbers.map { (number: Int) -> Int in
    let result = 3 * number
    
    return result
}

print(newArry1)


let newArry2 = numbers.map {
    $0 * 3
}

print(newArry2)

let newArry3 = numbers.sorted { $0 < $1 }

print(newArry3)
