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


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


//MARK - Создаем enums

enum Engine {
    case on
    case off
}


enum Windows {
    case opened
    case closed
}


//MARK - Создаем родительский класс Car

class Car {
    
    let brand: String
    let year: Int
    var engineStatus = Engine.off
    var windowsStatus = Windows.closed
    private var carCount = 0
    
    
    init(brand: String, year: Int, engineStatus: Engine, windowsStatus: Windows) {
        self.brand = brand
        self.year = year
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        carCount += 1
    }
        
    convenience init(brand: String, year: Int) {
        self.init(brand: brand, year: year, engineStatus: Engine.off, windowsStatus: Windows.closed)
    }
    
    deinit {
        carCount -= 1
        print("Упппс стало меньше машинок")
    }
    
    
    func statusEngine(status: Engine) {
        if status == Engine.off {
            self.engineStatus = .off
            print("Приехали\n")
        } else {
            self.engineStatus = .on
            print("Поехали!\n")
        }
    }
    
    func statusWindows(status: Windows) {
        if status == Windows.opened {
            self.windowsStatus = .opened
            print("Все окна открыли, не высовывайся!\n")
        } else {
            self.windowsStatus = .closed
            print("Все окна закрыли, больше не дует!\n")
        }
    }
        
}


//MARK - Создаем дочерний класс SportCar, родитель - Car

final class SportCar: Car {
    ///Максимальная скорость
    let maxSpeed: Int
    var currentSpeed: Int {
        didSet {
            if currentSpeed >= maxSpeed {
                print("Максимальная скорость превышена!")
            } else {
                print("Текущая скорость \(currentSpeed) км/ч.")
            }
        }
    }
    
    init(brand: String, year: Int, engineStatus: Engine, windowsStatus: Windows, maxSpeed: Int, currentSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.currentSpeed = currentSpeed
        super.init(brand: brand, year: year, engineStatus: Engine.off, windowsStatus: Windows.closed)
    }
    
    convenience init(brand: String, year: Int, maxSpeed: Int) {
        self.init(brand: brand, year: year, engineStatus: Engine.off, windowsStatus: Windows.closed, maxSpeed: maxSpeed, currentSpeed: 0)
    }
    
    deinit {
        print("Спортивные машины вышли из моды")
    }
    
    ///Спортивный режим
    enum sportMode {
        case on
        case off
    }
    
    func changeMode(action: sportMode) {
        switch action {
        case .on:
            print("Спорт режим в действии! Погоняем?")
        case .off:
            print("Спокойная езда по городу")
        }
    }
}

//MARK - Создаем экземпляры класса SportCar, родитель - Car

let sportCar1 = SportCar(brand: "BMW", year: 2013, maxSpeed: 280)
sportCar1.statusEngine(status: .on)
sportCar1.statusWindows(status: .opened)
sportCar1.changeMode(action: SportCar.sportMode.on)
sportCar1.currentSpeed = 300

//MARK - Создаем дочерний класс TrunkCar, родитель - Car

final class TrunkCar: Car {
    ///Грузоподъемность, тонн
    let loadCapacity: Double
    var trunkOccupied: Double {
        didSet {
            if trunkOccupied >= loadCapacity {
                print("Полная загрузка! Больше ничего не войдет.")
            } else {
                print("Уже загружено \(trunkOccupied) тонн.")
            }
        }
    }
    
    init(brand: String, year: Int, engineStatus: Engine, windowsStatus: Windows, loadCapacity: Double, trunkOccupied: Double) {
        self.loadCapacity = loadCapacity
        self.trunkOccupied = trunkOccupied
        super.init(brand: brand, year: year, engineStatus: Engine.off, windowsStatus: Windows.closed)
    }
    
    convenience init(brand: String, year: Int, loadCapacity: Double) {
        self.init(brand: brand, year: year, engineStatus: Engine.off, windowsStatus: Windows.closed, loadCapacity: loadCapacity, trunkOccupied: 0.0)
    }
    
    deinit {
        print("Больше нет грузовиков")
    }
    
    ///Загрузка или погрузка
    enum loadDirection {
        case loading
        case unloading
    }
    
    func truckLoading(action: loadDirection, tons: Double) {
        switch action {
        case .loading:
            print("Идет погрузка")
            trunkOccupied += tons
        case .unloading:
            print("Идет разгрузка")
            trunkOccupied -= tons
        }
    }
}

//MARK - Создаем экземпляры класса TrunkCar, родитель - Car

let truck1 = TrunkCar(brand: "MAN", year: 2020, loadCapacity: 170.5)
print(truck1.loadCapacity)
print(truck1.trunkOccupied)
truck1.truckLoading(action: TrunkCar.loadDirection.loading, tons: 20.7)
print(truck1.trunkOccupied)
truck1.truckLoading(action: TrunkCar.loadDirection.unloading, tons: 10.3)
print(truck1.trunkOccupied)
