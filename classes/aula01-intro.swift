import UIKit

/*
 =============================================
 Constantes, variáveis e opcionais
 =============================================
 */

let constValue: Int = 0
// constValue = 1 --> Não é possível alterar uma constante

var variable: Int = 0
variable = 1

var optional: Int? = nil
optional = 0

/*
 =============================================
 Constantes, variáveis e opcionais
 =============================================
 */

let intValue: Int = 0
let int8Value: Int8 = .max
let int32Value: Int32 = .max
let int64Value: Int = .max

let piFloat: Float = .pi

let piDouble = Double.pi

var naoInferir: Float = 0.0
print(type(of: naoInferir))

// Nano challenges
// 1. Somar / subtrair valores
// 2. Multiplicar / dividir valores
// 3. Resto de uma divisão

var num1 = 10
var num2 = 10
var sum = num1 + num2
var times = num1 * num2
var division = num1 / num2
var rest = num1 % num2

// Bool
var boolValue: Bool? = false
boolValue = true

/*
 =============================================
 Strings e Characteress
 =============================================
 */

let firstLetter: Character = "H"
let firstName: String = "Humberto"
let lastName: String = "Castro"

// Nano Challenge
// 1. Gostaria de somar strings e ter um fullname Humberto Castro, numa variável fullname
// 2. Verificar a charactere é a primeira letra da string

var fullName = firstName + lastName
let fullName2 = "\(firstName) \(lastName)"

// 
let isFirstLetterOnName: Bool = firstName.first == firstLetter
let isFirstLetterOnName2: Bool = firstName.contains(firstLetter)
let isFirstLetterOnName3: Bool = fullName.contains("Cast")
fullName.lowercased()
fullName.uppercased()


// Dates
let currentDate = Date()
let calendar = Calendar.current
let newDate = calendar.date(byAdding: .year, value: -1, to: currentDate)

// Nano challenge
// 1. Somem um dia, um mês e um ano
// 2. Esqueci quando minha mãe nasceu. Só tenho duas informações:
    // - Meu aniversário é 6 / 02 / 1996
    // - E quando ela me teve ela tinha 37 anos, 3 meses e 5 dias
    // Quando minha mãe nasceu?

let niverDate = Date(timeIntervalSince1970: 823637143)

if let minusYearDate = calendar.date(byAdding: .year, value: -37, to: niverDate),
   let minusMonthDate = calendar.date(byAdding: .month, value: -3, to: minusYearDate),
   let minusDayDate = calendar.date(byAdding: .day, value: -5, to: minusMonthDate) {
    
    print(minusDayDate)
    
}

let minusYearDate = calendar.date(byAdding: .year, value: -37, to: niverDate)
let minusMonthDate = calendar.date(byAdding: .month, value: -3, to: minusYearDate!)
let minusDayDate = calendar.date(byAdding: .day, value: -5, to: minusMonthDate!)


var opcional: Int? = 1
var naoOpcional: Int = 2

if let safeOpcional = opcional {
    naoOpcional = safeOpcional
}
naoOpcional = opcional ?? 0

