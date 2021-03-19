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


class Shape {
    var numberOfSides = 0
    
    func simpleDesc() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}


var shape = Shape()
shape.numberOfSides = 7

var shapeDesc = shape.simpleDesc()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDesc() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var namedShape = NamedShape(name: "testShape")


class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesc() -> String {
        return "A Square with sides of length \(sideLength)"
    }
}

let square = Square(sideLength: 2, name: "square")
square.area()
square.simpleDesc()


class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * self.sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
}

var triangle = EquilateralTriangle(sideLength: 3, name: "triangle")

triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength
triangle.simpleDesc()


var optionalSquare: Square? = Square(sideLength: 4, name: "optional square")

var sideLength = optionalSquare?.sideLength

optionalSquare = nil

optionalSquare?.sideLength


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    init(sideLength: Double, name: String) {
        square = Square(sideLength: sideLength, name: name)
        triangle = EquilateralTriangle(sideLength: sideLength, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(sideLength: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDesc() -> String {
        switch self {
        case .ace:
            return "ace"
        case .two:
            return "two"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
ace.simpleDesc()

let three = Rank.three
three.simpleDesc()
three.rawValue

let king = Rank.king

king.simpleDesc()
king.rawValue

if let newRank = Rank(rawValue: 2) {
    _ = newRank.simpleDesc()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


protocol ExampleProtocol {
    var simpleDesc: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDesc: String = "A very simple class."
    var anotherProperty: Int = 500
    
    func adjust() {
        simpleDesc += " Now 100% adjusted"
    }
}

var a = SimpleClass()

a.adjust()

let aDesc = a.simpleDesc



struct SimpleStructure: ExampleProtocol {
    
    var simpleDesc: String = "A simple structure"
    
    mutating func adjust() {
        simpleDesc += " (adjusted)"
    }
}


var b = SimpleStructure()
b.adjust()
b.simpleDesc



extension Int: ExampleProtocol {
    var simpleDesc: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

print(9.simpleDesc)

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has toner" {
        throw PrinterError.noToner
    }
    
    return "Job Sent"
}

do {
    let printerResponse = try send(job: 400, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 400, toPrinter: "Never has toner")
    print(printerResponse)
} catch PrinterError.noToner {
    print("no toner")
} catch PrinterError.onFire {
    print("onFire")
} catch {
    print(error)
}


let printerSuccess = try? send(job: 300, toPrinter: "aaa")
let printerFailure = try? send(job: 500, toPrinter: "Never has toner")


var fridgeIsOpen = false
let fridgeContent: [String] = ["milk", "egg", "leftovers"]


func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    
    defer {
        fridgeIsOpen = false
    }
    
    return fridgeContent.contains(food)
}

print(fridgeIsOpen)
fridgeContains("banana")
print(fridgeIsOpen)

var result = [Int]()



func makeArry<Item>(repeating item: Item, times: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<times {
        result.append(item)
    }
    
    return result
}

makeArry(repeating: "a", times: 5)


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [4])
anyCommonElements([1, 2, 3], [3, 4])


func makeInt() -> some Equatable {
    Int.random(in: 1...10)
}

func makeStr() -> some Equatable {
    return "aaa"
}

let int1 = makeInt()
let int2 = makeInt()

int1
int2

int1 == int2

let ssss = makeStr()


func doSth(str: String?) -> String {
    guard let v = str, str != "" else {
        return "not ok"
    }

    return "ok" + v
}

doSth(str: nil)
doSth(str: "")
doSth(str: "tonghs")
