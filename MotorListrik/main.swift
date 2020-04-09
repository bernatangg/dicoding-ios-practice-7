//
//  main.swift
//  MotorListrik
//
//  Created by Bernadietta Anggie on 09/04/20.
//  Copyright © 2020 Bernadietta Anggie. All rights reserved.
//

import Foundation


//function to get item from user
func getInput(message: String) -> String? {
    print(message, terminator: " : ");
    return readLine()
}

func getInputInt(message: String) -> Int?{
    if let inputString = getInput(message: message){
        return Int(inputString)
    } else{
        return nil
    }
}


//speedTotal to collect speed variable
var speedTotal = 0

//closure to add speed
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    func incrementer() -> Int {
        speedTotal += amount
        return speedTotal
    }
    return incrementer
}

//closure to reduce speed
func makeDecrementer(forDecrement amount: Int) -> () -> Int {
    func decrementer() -> Int {
        speedTotal -= amount
        return speedTotal
    }
    return decrementer
}

//determine value of add and reduce
let incrementByTen = makeIncrementer(forIncrement: 10)
let decrementByTen = makeDecrementer(forDecrement: 10)

//turn on engine
func turnOnEngine() {
    print("start the engine")
    print("Welcome to Dicoding's electric motor")
    print("Brem brem brem brem")
}

//turn off engine
func turnOffEngine() {
    print("Ciiitttttttttt.......")
    print("Motor stop")
}

//show current speed
func showSpeed() {
    print("Current speed : \(speedTotal)")
    print("Ngeeeeengggggggg")
}

//provide action to the electric motor
func action() {
    print("----------------------------------------")
    print("Let's go")
    print("[1] Add speed")
    print("[2] Reduce speed")
    print("[3] Turn off engine")
    
    if let state = getInputInt(message: "Input your action") {
        switch state {
        case 1:
            speedTotal = incrementByTen()
            showSpeed()
            action()
        case 2:
            if speedTotal >= 0 {
                speedTotal = decrementByTen()
                showSpeed()
                action()
            } else {
                turnOnEngine()
                break
            }
        case 3:
            turnOffEngine()
            break
        default:
            break
        }
    } else {
        print("Invalid input")
    }
}

//start program
turnOnEngine()
action()
