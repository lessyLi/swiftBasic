//
//  main.swift
//  swiftBasic
//
//  Created by MacBook on 30.03.2022.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

///Первый вариант через функцию
func isEvenNumber(_ number: Int) -> Bool {
    number.isMultiple(of: 2)
}

///Второй вариант без функций
func isAnotherEvenNumber(_ number: Int) -> Bool {
    if number % 2 != 0 {
        return false
    } else {
        return true
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

///Первый вариант через функцию
func multiplyThreeNumber(_ number: Int) -> Bool {
    number.isMultiple(of: 3)
}

///Второй вариант без функций
func ismultiplyThreeNumber(_ number: Int) -> Bool {
    if number % 3 != 0 {
        return false
    } else {
        return true
    }
}

//3. Создать возрастающий массив из 100 чисел.

var oneHundred = [Int]()

for i in 1...100 {
    oneHundred.append(i)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

///Первый вариант через создание другого массива
var oneAnotherHundred = [Int]()

for i in oneHundred {
    if i % 2 != 0 && i % 3 == 0 {
        oneAnotherHundred.append(i)
    }
}

///Второй вариант с текущим массивом
var trueIndex = 0
for i in oneHundred {
    if i % 2 == 0 || i % 3 != 0 {
        oneHundred.remove(at: trueIndex)
    } else {
        trueIndex += 1
    }
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func fibonachi(numberOne: Int, numberTwo: Int) -> Int {
    return numberOne + numberTwo
    }

var myFibonachi = [0,1]

for i in 0...1000 {
    let theNextNumber = fibonachi(numberOne: myFibonachi[i], numberTwo: myFibonachi[i + 1])
    myFibonachi.append(theNextNumber)
    if myFibonachi.count >= 50 {
        break
    }
}

//6. * Заполнить массив из 100 элементов различными простыми числами.

var primeNumbers = [Int]()

for i in 2...1000 {
    var checkCounter = 0
    for j in 2...9 {
        if i % j == 0 && i != j {
            checkCounter -= 1
        } else {
            checkCounter += 1
        }
    if checkCounter == 8 {
        primeNumbers.append(i)
    }
    if primeNumbers.count == 100 {
        break
    }
    }
}

// MARK: - Ticket
struct Ticket {
    var count: Int
    var price: Int
    let country: Country
}

// MARK: - Country
struct Country {
    let name: String
}

// MARK: - errors
enum FlyErrors: Error {
    case unknownCountry
    case noTickets
    case notEnoughMoney
    case covidRestrictions
}

// MARK: - FlyFromRussia (вариант без throws)
final class FlyFromRussia {
    // Список стран
    var countries = [
        "Italy": Ticket(count: 0, price: 0, country: Country(name: "Italy")),
        "France": Ticket(count: 10, price: 800, country: Country(name: "France")),
        "Greece": Ticket(count: 15, price: 750, country: Country(name: "Greece")),
        "Turkey": Ticket(count: 78, price: 470, country: Country(name: "Spain")),
        "Germany": Ticket(count: 57, price: 640, country: Country(name: "Germany")),
        "Georgia": Ticket(count: 36, price: 540, country: Country(name: "Austria")),
        "Armenia": Ticket(count: 100, price: 400, country: Country(name: "Armenia")),
        "Mexico": Ticket(count: 0, price: 0, country: Country(name: "Mexico"))]
    // Куда летим?
    let country: String = ""
    // Сколько есть денег
    var myMoney = 600
    // Сняты ли ковидные ограничения?
    var isCovidOkay: Bool = false

    // Полетим ли?
    func willIFly(country: String, isCovidOkay: Bool) -> (Country?, FlyErrors?) {
        // Проверяем ковидные ограничения
        guard isCovidOkay else {
            print("There are covid restrictions in \(country).")
            return (nil, FlyErrors.covidRestrictions)
        }
        // Есть ли страна в списке
        guard let myCountry = countries[country] else {
            print("No information about \(country).")
            return (nil, FlyErrors.unknownCountry)
        }
        // Есть ли билеты
        guard myCountry.count > 0 else {
            print("There are no tickets to \(country).")
            return (nil, FlyErrors.noTickets)
        }
        // Достаточно ли денег
        guard myMoney >= myCountry.price else {
            print("You don't have enough money for \(country).")
            return (nil, FlyErrors.notEnoughMoney)
        }
        // Покупаем билет
        myMoney -= myCountry.price
        var newCountry = myCountry
        newCountry.count -= 1
        countries[country] = newCountry
        print("I'm going to \(country)! 🥳")
        return (newCountry.country, nil)
    }
}
// MARK: - instances
let myTrip = FlyFromRussia()

let myFirstTrip = myTrip.willIFly(country: "Germany", isCovidOkay: false)
let mySecondTrip = myTrip.willIFly(country: "Mexico", isCovidOkay: true)
let myThirdTrip = myTrip.willIFly(country: "Armenia", isCovidOkay: true)

if let country = myFirstTrip.0 {
    print("I'm going to \(country.name)! 🥳")
} else if let error = myFirstTrip.1 {
    print("Error: \(error.localizedDescription)")
}


// MARK: - FlyFromRussiaThrows (вариант со throws)
final class FlyFromRussiaThrows {
// Список стран
var countries = [
    "Italy": Ticket(count: 0, price: 0, country: Country(name: "Italy")),
    "France": Ticket(count: 10, price: 800, country: Country(name: "France")),
    "Greece": Ticket(count: 15, price: 750, country: Country(name: "Greece")),
    "Turkey": Ticket(count: 78, price: 470, country: Country(name: "Spain")),
    "Germany": Ticket(count: 57, price: 640, country: Country(name: "Germany")),
    "Georgia": Ticket(count: 36, price: 540, country: Country(name: "Austria")),
    "Armenia": Ticket(count: 100, price: 400, country: Country(name: "Armenia")),
    "Mexico": Ticket(count: 0, price: 0, country: Country(name: "Mexico"))]
// Куда летим?
let country: String = ""
// Сколько есть денег
var myMoney = 600
// Сняты ли ковидные ограничения?
var isCovidOkay: Bool = false

    // Полетим ли?
    func willIFly(country: String, isCovidOkay: Bool) throws -> Country {
        // Проверяем ковидные ограничения
        guard isCovidOkay else {
            print("There are covid restrictions in \(country).")
            throw FlyErrors.covidRestrictions
        }
        // Есть ли страна в списке
        guard let myCountry = countries[country] else {
            print("No information about \(country).")
            throw FlyErrors.unknownCountry
        }
        // Есть ли билеты
        guard myCountry.count > 0 else {
            print("There are no tickets to \(country).")
            throw FlyErrors.noTickets
        }
        // Достаточно ли денег
        guard myMoney >= myCountry.price else {
            print("You don't have enough money for \(country).")
            throw FlyErrors.notEnoughMoney
        }
        // Покупаем билет
        myMoney -= myCountry.price
        var newCountry = myCountry
        newCountry.count -= 1
        countries[country] = newCountry
        print("I'm going to \(country)! 🥳")
        return newCountry.country
    }
}

// MARK: - instances
let yourTrip = FlyFromRussiaThrows()
// Попытка улететь в Германию
do {
    try yourTrip.willIFly(country: "Germany", isCovidOkay: false)
} catch FlyErrors.covidRestrictions {
    print("Covid restrictions")
} catch FlyErrors.unknownCountry {
    print("Unknown country")
} catch FlyErrors.noTickets {
    print("No tickets")
} catch FlyErrors.notEnoughMoney {
    print("Not enough money")
} catch let error {
    print(error.localizedDescription)
}
// Попытка улететь в Армению
do {
    try yourTrip.willIFly(country: "Armenia", isCovidOkay: true)
} catch FlyErrors.covidRestrictions {
    print("Covid restrictions")
} catch FlyErrors.unknownCountry {
    print("Unknown country")
} catch FlyErrors.noTickets {
    print("No tickets")
} catch FlyErrors.notEnoughMoney {
    print("Not enough money")
} catch let error {
    print(error.localizedDescription)
}
print(yourTrip.myMoney)

