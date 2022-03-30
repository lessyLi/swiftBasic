//
//  main.swift
//  swiftBasic
//
//  Created by MacBook on 30.03.2022.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

func isEvenNumber(_ number: Int) -> Bool {
    number.isMultiple(of: 2)
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func multiplyThreeNumber(_ number: Int) -> Bool {
    number.isMultiple(of: 3)
}

//3. Создать возрастающий массив из 100 чисел.

var oneHundred = [Int]()

for i in 1...100 {
    oneHundred.append(i)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var oneAnotherHundred = [Int]()

for i in oneHundred {
    if i % 2 != 0 && i % 3 == 0 {
        oneAnotherHundred.append(i)
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



