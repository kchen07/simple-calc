//
//  main.swift
//  simplecalc
//
//  Created by Kelley Lu Chen on 10/9/17.
//  Copyright © 2017 Kelley Lu Chen. All rights reserved.
//

import Foundation

var end = false

while (!end) {
    print("Enter an expression separated by returns: (type \"quit\" to end)")
    let input = readLine(strippingNewline: true)!
    var func_type = 0
    if (input.contains("count")) {
        func_type = 1
    } else if (input.contains("avg")) {
        func_type = 2
    } else if (input.contains("fact")) {
        func_type = 3
    } else if (input.contains("quit")) {
        end = true
    }

    var result = 1
    let array = input.components(separatedBy: " ")
    if (array[0] == "") {
        continue
    }
    if (func_type == 0) {
        if (Int(input) != nil || Double(input) != nil) {
        var res = 0.0;
        let first_val = Double.init(input)!
        let operation = readLine(strippingNewline: true)!
        let input2 = readLine(strippingNewline: true)!
        if (Int(input2) == nil &&  Double(input2) == nil) {
            print("enter valid number")
            continue
        }
        let second_val = Double.init(input2)!
        if (operation == "+") {
            res = first_val + second_val
        } else if (operation == "-") {
            res = first_val - second_val
        } else if (operation == "*") {
            res = first_val * second_val
        } else if (operation == "/") {
            res = first_val / second_val
        } else if (operation == "%") {
            res = Double(first_val.truncatingRemainder(dividingBy: Double(second_val)))
        } else {
            print ("Please type in valid operation")
        }
        print("result = \(res)")
        }
    } else if (func_type == 1) {
        var is_valid = true
        if (array.count > 1) {
            for index in 0...(array.count-2) {
                if (Int(array[index]) == nil) {
                    is_valid = false
                }
            }
            if (is_valid) {
                print(array.count - 1)
            }
        }
    } else if (func_type == 2) {
        var total = 0.0
        if (array.count > 1) {
        for index in 0...(array.count-2) {
            total += Double(array[index])!
        }
        print(total / Double(array.count - 1))
        }
    } else {
        if (array.count != 2) {
            print("Fact can only have 1 number")
            
        } else {
            let first_val = UInt.init(array[0])!
            for n in 1...first_val {
                result *= Int(n)
            }
            print(result)
        }
    }
}
