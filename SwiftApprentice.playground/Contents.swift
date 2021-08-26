import UIKit

var str = "Hello, playground"


for index in stride(from: 10, to: 22, by: 4){
    print(index)
}

for index in stride(from: 10, through: 22, by: 4) {
    print(index)
}

func incrementAndPrint(_ value: inout Int){

    value += 1
    print(value)
}
var result:Int? = 30
print(result)

var authorName :String? = "liuningbo"
var authorAge :Int? = 30

var unwrapperAuthorName = authorName!
print(authorName)

if let unwrappedAuthorName = authorName {
    print(unwrapperAuthorName)
} else {
    print("No author")
}

var players = ["Alice","Bob","Cindy","Dan"]
print(players.isEmpty)
if players.count < 2 {
    print("We need at least two players")
} else {
    print("Let's start !")
}
var currentPlayer = players.first

print(currentPlayer as Any)
print(players.last as Any)

currentPlayer = players.min()
print(currentPlayer )

print([2,3,3].first as Any)
print([2,3,1].min() as Any)
if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
} else {
    print("currentPlayer nobody")
}
var firstPlayer = players[0]
print("first player is \(firstPlayer)")

let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1],upcomingPlayersSlice[2])

func isEliminated(_ player :String) ->Bool {
    !players.contains(player)
}
print(isEliminated("Bob"))

players.append("Eli")
players += ["Gina"]
players.insert("Frank", at: 5)
print(players)
var removedPlayer = players.removeLast()
print(players)

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")
print(players)

players[4] = "Franklin"
print(players)

let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

for player in players {
    print(player)
}

for (index,player) in players.enumerated() {
    print("\(index + 1).\(player)")
}

func sumOfElements (in array :[Int]) -> Int {
    
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
    
    
}

var namesAndScores = ["Anna":2,"Brian":2,"Craig":8,"Donna":6]

print(namesAndScores["Greg"] as Any)

var bobData = ["name":"Bob",
               "profession":"Card player",
               "country":"USA"]

bobData.updateValue("CA", forKey: "state")
print(bobData)
bobData["city"] = "San Francisco"
print(bobData)
bobData.removeValue(forKey: "state")
print(bobData)
bobData["city"] = nil
print(bobData)

for (play,score) in namesAndScores {
    print("\(play) - \(score)")
    
}

var multiplyClosure: (Int,Int) -> Int
//1、
/*
var multPlyClosure = {
    (a :Int ,b :Int) -> Int in
    
    return a * b
    
    
}
*/

//2、

multiplyClosure = {
    (a :Int ,b: Int) -> Int in
    
    a * b
}

//3、
/*
multiplyClosure = {
    $0 * $1
}
*/
let result1 = multiplyClosure(2,4)
print(result1)

func operateOnNumbers (_ a :Int , _ b : Int , operation :(Int,Int) -> Int) -> Int {
    
    let result = operation(a,b)
    
    print(result)
    
    return result

}

let addClosure = {
    (a : Int ,b :Int) in
    a + b
}

operateOnNumbers(4, 2, operation: addClosure)

operateOnNumbers(4,2) { (a :Int, b :Int) -> Int in
    
    a + b
}
operateOnNumbers(4, 2, operation: +)

func sequenced(first:() -> Void ,second :() -> Void)
{
    first()
    second()
}

sequenced {
    print("Hello ,",terminator :"")
} second: {
    print("world.")
}

let voidClosure :() -> Void = {
    
    print("Swift Apprentice is awesome")
}
let values  = [1,2,3,4,5,6]
values.forEach {
    
    print("\($0):\($0 * $0)")
}

var prices = [1.5,10,4.99,2.30,8.19]

let largePrices = prices.filter {
    $0 > 5
}
print(largePrices)

let largePrices1 = prices.first {
    
    $0 > 5
}
print(largePrices1)


let salePrices = prices.map{
    
    $0 * 0.9
}
print(salePrices)

let userInput = ["0","11","haha","42"]
let number1 = userInput.map {
    
    Int($0)
}
print(number1)

let numbers2 = userInput.compactMap{
    Int($0)
}
print(numbers2)

let userInputNested = [["0","1"],["a","b","c"],["🐶"]]

let allUserInput = userInputNested.flatMap{
    
    $0
}
print(allUserInput)

let sum = prices.reduce(0){
    
    $0 + $1
}
print(sum)


let stock = [1.5 :5 ,10 :2 ,4.99 :20,2.30:5,8.19:30]



let stockSum = stock.reduce(0) {
    
    $0 + $1.key * Double($1.value)
  
}

print(stockSum)


let allStockSum = stock.reduce(into: []){
    (result,this:(key:Double,value :Int)) in
    
    print(this.key,this.value)
    
    
}


let farmAnimals = ["🐎":5 ,"🐱":10 ,"🐑":50,"🐶":1]

let allAnimals = farmAnimals.reduce(into: []) { (result, this:(key:String,value:Int)) in
    
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}
print(allAnimals)
print(prices)


let removedFirst = prices.dropFirst()
print(removedFirst)

let removFirstTwo = prices.dropFirst(2)
print(removFirstTwo)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

print(removeLast)
print(removeLastTwo)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)

print(firstTwo)
print(lastTwo)


prices.removeAll(){
    
    $0 > 2
}
print(prices)

func isPrime (_ number :Int) -> Bool {
    if number == 1 {return false}
    if number == 2 || number == 3 {return true}
    
    
    
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

var primes :[Int] = []

var i = 1

while primes.count < 10 {
    if isPrime(i) {
        primes.append(i)
    }
    i += 1
}

primes.forEach {
    
    print($0)
}


let primes1 = (1...).lazy
    .filter{isPrime($0)}
    .prefix(10)
primes1.forEach {
    print($0)
}
let string = "Matt"

for char in string {
    print(char)
}
let stringLength = string.count
print(stringLength)
//let fourthChar = string[3]
//print(fourthChar)

let cafeNormal = "cafe"
let cafeCombinning = "cafe\u{0301}"

cafeNormal.count
cafeCombinning.count

cafeNormal.unicodeScalars.count
cafeCombinning.unicodeScalars.count

for codePoint in cafeNormal.unicodeScalars {
    print(codePoint.value)
}

for codePoint in cafeCombinning.unicodeScalars {
    print(codePoint.value)
}



