import UIKit

/*
Funções
*/
func printName(name: String) {
    print("\(name)")
}

// printName(name: "Humberto Castro")

func getFirstLetter(name: String) -> Character? {
    return name.first
}

// getFirstLetter(name: "Nat")

// Nano Challenge
// 1. Fazer função que verifica se o número é par ou não. Retorna um booleano
// 2. Criar uma função que recebe uma data como parâmetro e retorna a data com um ano a mais.

func isEven(value: Int) -> Bool {
    return value % 2 == 0
}

isEven(value: 9)

func addYears(date: Date, years: Int) -> Date? {
    let calendar = Calendar.current
    return calendar.date(byAdding: .year, value: years, to: date)
}

var dataNascimentoBebe: Date? = nil
dataNascimentoBebe = Date()

addYears(date: Date(), years: 3)

// =================================================
// Estrutura de condição (if/else/switch/case/enum)
// =================================================

let age = 43

var isChild: Bool = false
var isTeenager: Bool = false
var isAdult: Bool = false
var isOld: Bool = false

if age < 11 {
    isChild = true
} else if age < 18 {
    isTeenager = true
} else if age < 60 {
    isAdult = true
} else {
    isOld = true
}

switch age {
case 0...11:
    isChild = true

case 12...18:
    isTeenager = true

case 18...59:
    isAdult = true
    
default:
    isOld = true
}

enum Age {
    case child
    case teenager
    case adult
    case old
}

var ageEnum: Age

if age < 11 {
    ageEnum = .child
    
} else if age < 18 {
    ageEnum = .teenager
    
} else if age < 60 {
    ageEnum = .adult
    
} else {
    ageEnum = .old
}

switch age {
case 0...11:
    ageEnum = .child

case 12...18:
    ageEnum = .teenager

case 18...59:
    ageEnum = .adult
    
default:
    ageEnum = .old
}

// Nano Challenge
// Criar um enum com três tipos de semaforos 🟡🟢🔴
// Fazer uma função que recebe o valor do enum e printa se é amarelo, vermelho ou verde
// Emoji: Control + CMD + Espaço

enum Semaphore: String {
    case yellow = "🟡"
    case green = "🟢"
    case red = "🔴"
}


func printSemaphore(semaphore: Semaphore) {
    print(semaphore.rawValue)
}

printSemaphore(semaphore: .green)

// ============================================
// Estruturas de repetição e Arrays
// ============================================

// Como instanciar arrays
var intList: [Int] = [1, 2, 3, 4, 5, 6]
var intList2 = Array<Int>()
var intList3 = [1, 2, 3, 4, 5]
var intList4 = [Int]()
intList.append(7)
intList.first
intList.last
intList.contains(9)

for i in intList {
    // print(i)
}

intList.forEach { value in
    //print(value)
}

var i = 0
repeat {
    print(intList[i])
    i = i + 1
} while( i < intList.count)

// i == intList.count == 7
while i > 0 {
    i = i - 1
    print(intList[i])
}

// Nano Challenges
// 1. Faça uma função que recebe um array e retorna a soma dos valores
// Dado um array de inteiros [2,3,-5,6,-1,7, 5] some todos.
func sum(list: [Int]) -> Int {
    var sum = 0
    list.forEach { value in
        sum += value
        // sum = sum + value
    }
    return sum
}

sum(list: [2,3,-5,6,-1,7, 5])

// 2. Faça um função que recebe um array e retorna um outro array só com números ímpares
func odds(list: [Int]) -> [Int] {
    var oddList = [Int]()
    list.forEach { value in
        if value % 2 != 0 {
            oddList.append(value)
        }
    }
    
    return oddList
}

odds(list: [1,2,3,4,5,6])

// 3. Faça uma função que recebe um string e retorna um array de caracteres
func getCharacteres(of string: String) -> [Character] {
    var characteres: [Character] = []
    string.forEach { c in
        characteres.append(c)
    }
    
    return characteres
}

getCharacteres(of: "asdffs")

// =====================================
// Any & Arrays
// =====================================

let anyArray: [Any] = ["Humberto", 1, true, Character("C"), 2.0, "Castro", 3, "Raphael"]

// Como que eu consigo pegar só as strings
var boolList: [Bool] = []
for i in anyArray {
    if let value = i as? Bool {
        boolList.append(value)
    }
}

print(boolList)

for item in anyArray.enumerated() {
    print("\(item.element) |  \(item.offset)")
}

func getSumList(anyList: [Any]) -> [Any] {
    var sumString = ""
    var sumValue = 0
    
    for i in anyList {
        if let stringValue = i as? String {
            sumString += "+" + stringValue
        } else if let intValue = i as? Int {
            sumValue += intValue
        }
    }
    
    let removeFirstLetter = sumString.dropFirst()
    return [removeFirstLetter, sumValue]
}

// Nano Challenge: 
// Criar uma função que recebe um array de any e ela vai retornar outro array com string somada
// e com todos os números somados
// entrada: ["Humberto", "Jefferson", 10, 20, 5, "Jobson", 3]
// saida: ["Humberto+Jefferson+Jobson", 38]


func indiceEven(text: String) -> String {
    var newString: String = ""
    for item in text.enumerated() {
        if item.offset % 2 == 0 {
            newString += "\(item.element)"
        }
    }
    
    return newString
}


indiceEven(text: "Humberto")


