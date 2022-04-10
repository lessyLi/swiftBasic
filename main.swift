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

// MARK: - Protocol Car

protocol Car {
    
    var brand: String { get }
    var year: Int { get }
    var engine: Engine { get set }
    var windows: Windows { get set }
    
    func windows(status: Windows)
    func engine(status: Engine)
    
}

// MARK: - enums

enum Windows {
    case opened
    case closed
}

enum Engine {
    case on
    case off
}

// MARK: - extensions Car

extension Car {
    
    func windows(status: Windows) {
        if status == Windows.opened {
            print("Все окна открыли, не высовывайся!\n")
        } else {
            print("Все окна закрыли, больше не дует!\n")
        }
    }
    
    func engine(status: Engine) {
        if status == Engine.off {
            print("Приехали\n")
        } else {
            print("Поехали!\n")
        }
    }
}

// MARK: - class SportCar: Car

final class SportCar: Car {
 
    var brand: String
    var year: Int
    var engine = Engine.off
    var windows = Windows.closed
    ///Максимально разрешенная скорость
    let maxSpeed = 250
    ///Текущая скорость
    var currentSpeed = 120 {
        didSet {
            ///Ограничение скорости
            if currentSpeed > maxSpeed {
                print("Are you crazy? Too fast!")
                currentSpeed = oldValue
            } else {
                print("Your speed is \(currentSpeed) km/h")
            }
        }
    }
    
    static var carCount = 0
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
        SportCar.carCount += 1
    }
    
    func engine(status: Engine) {
        if self.engine == Engine.off {
            self.engine = .off
        } else {
            self.engine = .on
        }
    }
    
    func windows(status: Windows) {
        if self.windows == Windows.opened {
            self.windows = .opened
        } else {
            self.windows = .closed
        }
    }
    
    deinit {
        SportCar.carCount -= 1
        print("Спортивные машины вышли из моды")
    }

}

extension SportCar: CustomStringConvertible {
    var description: String {
        "Я быстрая машинка \(brand) \(year) года выпуска. Погоняем?"
    }
}

// MARK: - intances SportCar

let mySportCar = SportCar(brand: "Honda", year: 2017)
let yourSportCar = SportCar(brand: "Toyota", year: 2018)

mySportCar.engine(status: Engine.on)
mySportCar.windows(status: Windows.opened)
print(SportCar.carCount)
print(mySportCar)
print(mySportCar.brand)

mySportCar.currentSpeed = 180
print(mySportCar.currentSpeed)
mySportCar.currentSpeed = 280
print(mySportCar.currentSpeed)


// MARK: - class TrunkCar: Car

final class TrunkCar: Car {
 
    var brand: String
    var year: Int
    var engine = Engine.off
    var windows = Windows.closed
    ///Максимальная грузоподъемность
    var loadCapacity = 5.0
    ///Сколько уже загружено
    var trunkOccupied = 0.0 {
        didSet {
            ///Ограничение на загрузку
            if trunkOccupied >= loadCapacity {
                print("Полная загрузка! Больше ничего не войдет.")
                trunkOccupied = oldValue
            } else {
                print("Уже загружено \(trunkOccupied) тонн.")
            }
        }
    }
    
    static var carCount = 0
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
        TrunkCar.carCount += 1
    }
    
    func engine(status: Engine) {
        if self.engine == Engine.off {
            self.engine = .off
        } else {
            self.engine = .on
        }
    }
    
    func windows(status: Windows) {
        if self.windows == Windows.opened {
            self.windows = .opened
        } else {
            self.windows = .closed
        }
    }
    
    
    deinit {
        TrunkCar.carCount -= 1
        print("Ни одного грузовика не осталось...")
    }
    
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        "Я рабочая лошадка \(brand) \(year) года выпуска. Загружаем?"
    }
}

// MARK: - intances TrunkCar

let myTrunkCar = TrunkCar(brand: "MAN", year: 2015)
let yourTrunkCar = TrunkCar(brand: "Ford", year: 2016)

myTrunkCar.engine(status: Engine.on)
myTrunkCar.windows(status: Windows.opened)
print(TrunkCar.carCount)
print(myTrunkCar)
print(myTrunkCar.brand)

myTrunkCar.trunkOccupied = 1.5
print(myTrunkCar.trunkOccupied)
myTrunkCar.trunkOccupied = 5.2
print(myTrunkCar.trunkOccupied)

