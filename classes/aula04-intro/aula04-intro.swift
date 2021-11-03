import Foundation

let dictionary: [String: String] = [
    "Humberto": "Desenvolvedor iOS",
    "Nat": "PM e desenvolvedora iOS",
    "Felipe": "Front e dev iOS",
    "Raphael": "Fullstack e dev iOS"
]

dictionary["Humberto"]
dictionary["Nat"]

var requestDictionary: [Int: String] = [
    200: "Success",
    400: "Bad request",
    404: "Nem sei que erro é",
    500: "Servidor ta fora"
]

requestDictionary[200]

requestDictionary
requestDictionary.updateValue("Deu bom", forKey: 200)

requestDictionary
requestDictionary.updateValue("Erro indescrítivel", forKey: 800)

requestDictionary

dictionary.forEach { errorType in
    // print("key: \(errorType.key) //// value: \(errorType.value)")
}

for item in [1,2,3,4,5].enumerated() {
    // print("value: \(item.element) -- indice: \(item.offset)")
}

// Exercício
// Fazer uma função que recebe um string como parâmetro
// Você vai contar a quantidade de caracteres de um string usando dictionary
// Brisolla
// B = 1
// R = 1
// I = 1
// S = 1
// O = 1
// L = 2
// A = 1

// String: Jeffersson
// J = 1, E = 2 F = 2, R = 1, S = 2, O = 1, N = 1

var sum: (Int, Int) = (0, 0)

func sum(arrayOne: [Int], arrayTwo: [Int]) -> (Int, Int) {
    var x = 0
    for item in arrayOne {
        x += item
    }
    
    var y = 0
    for item in arrayTwo {
        y += item
    }
    
    return (x, y)
}

var coordinate = (x: 0, y: 1)
coordinate.x
coordinate.y

typealias Point = (x: Int, y: Int)
var coordinate2: Point = (x: 0, y: 0)
coordinate2.x
coordinate2.y

var coordinates: [(x: Int, y: Int, z: Int)] = []
coordinates.append((1,2,3))

// Exercício: Fazer uma função que recebe duas coordenadas (x e y)
// Retorna a distancia entre dois pontos
// d(P, Q) = √ ((x2 − x1)^2 + (y2 − y1)^2)

var v = pow(2, 2)

func calculateDistance(pointOne: Point, pointTwo: Point) -> Float {
    return 0.0
}

// High Order functions: Funções que conseguem receber funções como parâmetro

var method: (Int) -> Int = { value in
    return value
}

var numbers = [1,2,3,4,5,6,7,8]

// Multiplicar
let multiplierBy2 = numbers.map { number in
    return number * 2
}

numbers.map({ number in
    return number * 2
})

let multiplierBy22 = numbers.map { $0 * 2 }


func multiplyBy3(value: Int) -> Int {
    return value * 3
}

let numberMultiplyBy3 = numbers.map(method)
let numberMultiplyBy33 = numbers.map(multiplyBy3)

func callWebservice(completion: () -> Void) {
    // Rodar coisas durante 5 segundos
    completion()
}

let valuesWithNil: [Any?] = [1,2, "S", nil, 43, nil]

let valueWithoutNil = valuesWithNil.compactMap { value in
    return value
}

var filtered = numbers.filter { value in
    return value % 2 == 0
}

var reduced: Int = numbers.reduce(0) { result, currentValue in
    return result + currentValue
}
//1,2,3,4,5
//1 + 10 = 11
//2 + 11 = 13
//3 + 13 = 16
numbers.reduce(10) { sumValue, currentValue in
    return sumValue + currentValue
}

numbers.reduce(0, { result, currentValue in
    return result + currentValue
})

// 5,2,1,3,4,52,1

let sortedArray = numbers.sorted { first, second in
    return first > second
}

numbers.sorted {
    $0 < $1
}

numbers.sort { first, second in
    return first < second
}

numbers.sort(by: >)
let sort = numbers.sorted(by: 😢)

func 😢(first: Int, second: Int) -> Bool {
    return first < second
}

// Função que recebe um array de Any?
// e retorna soma da multiplicação * 2 de todos os números
// [1, "Jefferson", true, 3, nil, 4, "Johnson", nil, 1]
// [1, 3, 4, 1] // Somente números
// [2, 6, 8, 2] // Multiplicados por 2
// 2 + 6 + 8 + 2 = 20
// Usar duas high order functions
