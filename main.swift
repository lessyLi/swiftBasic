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

// MARK: - Queue
struct Queue<T> {
    /// Пустой массив для хранения элементов
    var elements: [T] = []
    /// Кол-во элементов в очереди
    var count = 0 {
        didSet {
            if oldValue > count {
                print("Очередь уменьшилась с \(oldValue) до \(count) элементов.")
            } else {
                print("Очередь увеличилась с \(oldValue) до \(count) элементов")
            }
        }
    }
    /// Добавляет элемент в конец
    mutating func add(element: T) {
        elements.append(element)
        count += 1
    }
    /// Удаляет первый элемент
    mutating func remove() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        count -= 1
        return elements.removeFirst()
    }

    subscript(index: Int) -> T? {
            index >= 0 && index < elements.count ? elements[index] : nil
            }
    
}

// MARK: - filter
extension Queue {
    func filter(_ check: (T) -> Bool) -> [T] {
        var result = [T]()
        for element in elements {
            if check(element) {
                result.append(element)
            }
        }
        return result
    }
}

// MARK: - map
extension Queue {
    func map(_ toDo: (T) -> T) -> [T] {
        var result = [T]()
        for element in elements {
            result.append(element)
        }
        return result
    }
}

// MARK: - instances
var oneQueue = Queue<Int>()
oneQueue.add(element: 24)
oneQueue.add(element: 52)
oneQueue.add(element: 3)
print(oneQueue.count)
print(oneQueue.elements)
oneQueue.remove()
print(oneQueue.count)
print(oneQueue.elements)

print(oneQueue[1] as Any)
print(oneQueue[2] as Any)
print(oneQueue[5] as Any)

let twoQueue = oneQueue.filter {$0 < 50}
print(twoQueue)
let threeQueue = oneQueue.map {$0 * 2}
print(threeQueue)
let fourQueue = oneQueue.map {$0 + 10}
print(fourQueue)
