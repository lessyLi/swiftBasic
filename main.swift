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

// Третья домашка

///  Перечисления
enum Engine {
    case started
    case off
}
    
enum Windows {
    case opened
    case closed
}
    

/// Структура: Легковой автомобиль
struct SportCar {
    
    let brand: String
    let year: Int
    let trunk: Double
    var isEngineStarted = Engine.off {
        didSet {
            if isEngineStarted == Engine.started {
                print("Поехали!\n")
            } else {
                print("Приехали\n")
            }
        }
    }
    var isWindowsOpened = Windows.closed {
        didSet {
            if isWindowsOpened == Windows.closed {
                print("Все окна закрыли, больше не дует!\n")
            } else {
                print("Все окна открыли, не высовывайся!\n")
            }
        }
    }
    var trunkOccupied = 0.0 {
        didSet {
            if trunkOccupied >= trunk {
                print("Багажник не резиновый!\n")
            } else {
                print("Еще осталось немного места")
            }
        }
    }
    var trunkFree: Double {
        get {
            return trunk - trunkOccupied
        }
        set {
            trunkOccupied += newValue
        }
    }
    
    mutating func offEngine(_ status: Engine) {
        self.isEngineStarted = .off
    }
    
    mutating func startedEngine(_ status: Engine) {
        self.isEngineStarted = .started
    }
    
    mutating func openWindows(_ status: Windows) {
        self.isWindowsOpened = .opened
    }
    
    mutating func closeWindows(_ status: Windows) {
        self.isWindowsOpened = .closed
    }
    
    mutating func trunkLoading(litres: Double) {
        self.trunkOccupied += litres
    }
    
    mutating func trunkUnloading(litres: Double) {
        self.trunkOccupied -= litres
    }
    
}

/// Создаю экземпляр легкового авто
print("\n\n-------------------Лековой авто-------------------------------\n\n")

var toyota = SportCar(brand: "Toyota", year: 2017, trunk: 50.0)
print("Появление экземпляра:\n\(toyota)\n")

print("Проверяем сколько свободного места в багажнике:\n\(toyota.trunkFree)\n")

toyota.trunkOccupied = 10.0
print("Изменили начальную заполненность багажника: \n\(toyota)\n")

toyota.trunkLoading(litres: 30.0)
print("Загрузили 30.0 в багажник:\n\(toyota)\n")

print("Проверяем, сколько сободного места осталось в багажнике:\n\(toyota.trunkFree)\n")

toyota.isEngineStarted = Engine.started
print("Запустили двигатель:\n\(toyota)\n")

toyota.isWindowsOpened = Windows.opened
print("У экземпляра открылись окна:\n\(toyota)\n")

toyota.isEngineStarted = Engine.off
print("Заглушили двигатель:\n\(toyota)\n")

toyota.isWindowsOpened = Windows.closed
print("У экземпляра все окна закрыты:\n\(toyota)\n")


/// Структура: Грузовой автомобиль
struct TrunkCar {
    
    let brand: String
    let year: Int
    let trunk: Double
    var isEngineStarted = Engine.off {
        didSet {
            if isEngineStarted == Engine.started {
                print("Поехали!\n")
            } else {
                print("Приехали\n")
            }
        }
    }
    var isWindowsOpened = Windows.closed {
        didSet {
            if isWindowsOpened == Windows.closed {
                print("Все окна закрыли, больше не дует!\n")
            } else {
                print("Все окна открыли, не высовывайся!\n")
            }
        }
    }
    var trunkOccupied = 0.0 {
        didSet {
            if trunkOccupied >= trunk {
                print("Багажник не резиновый!\n")
            } else {
                print("Еще осталось немного места")
            }
        }
    }
    var trunkFree: Double {
        get {
            return trunk - trunkOccupied
        }
        set {
            trunkOccupied += newValue
        }
    }
    
    mutating func offEngine(_ status: Engine) {
        self.isEngineStarted = .off
    }
    
    mutating func startedEngine(_ status: Engine) {
        self.isEngineStarted = .started
    }
    
    mutating func openWindows(_ status: Windows) {
        self.isWindowsOpened = .opened
    }
    
    mutating func closeWindows(_ status: Windows) {
        self.isWindowsOpened = .closed
    }
    
    mutating func trunkLoading(litres: Double) {
        self.trunkOccupied += litres
    }
    
    mutating func trunkUnloading(litres: Double) {
        self.trunkOccupied -= litres
    }
    
}

/// Создаю экземпляр грузового авто
print("\n\n----------------------Грузовой авто----------------------------\n\n")

var man = TrunkCar(brand: "MAN", year: 2015, trunk: 1_000.0)
print("Появление экземпляра MAN:\n\(man)\n")

print("Проверяем сколько свободного места в багажнике:\n\(man.trunkFree)\n")

man.trunkOccupied = 100.0
print("Изменили начальную заполненность багажника: \n\(man)\n")

man.trunkLoading(litres: 500.0)
print("Загрузили 500.0 в багажник:\n\(man)\n")

print("Проверяем, сколько сободного места осталось в багажнике:\n\(man.trunkFree)\n")

man.isEngineStarted = Engine.started
print("Запустили двигатель:\n\(man)\n")

man.isEngineStarted = Engine.off
print("Заглушили двигатель:\n\(man)\n")

man.trunkUnloading(litres: 300.0)
print("Выгрузили 300.0 из багажника:\n\(man)\n")

