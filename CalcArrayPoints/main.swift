//
//  main.swift
//  CalcArrayPoints
//
//  Created by seowoosuk on 10/12/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import Foundation

//Strings -> numbers
func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

/* Functions for calc */

func add(num1:Int,num2:Int) -> Int {
    return num1+num2
}

func sub(num1:Int,num2:Int) -> Int{
    if(num1 < num2){
        return convert("-" + "\(num2-num1)")
    } else {
        return num1-num2
    }
}

func mul(num1:Int,num2:Int) -> Int {
    return num1*num2
}

func div(num1:Int,num2:Int) -> Int {
    return num1/num2
}

func mathOp(num1:Int, num2:Int, op:(Int,Int)->Int )-> Int {
    return op(num1,num2)
}

//Test
print("Sample calculation with 2 and 5")
print("10+5 = \(mathOp(10,num2:5,op:add))")
print("10-5 = \(mathOp(10,num2:5,op:sub))")
print("10x5 = \(mathOp(10,num2:5,op:mul))")
print("10/5 = \(mathOp(10,num2:5,op:div))")




/* Array Fun */

func addArray(values:[Int]) -> Int{
    var total = 0
    for value in values {
        total += value
    }
    return total
}

func mulArray(values:[Int]) -> Int{
    var total = 1
    for value in values {
        total *= value
    }
    return total
}

func count(values:[Int]) -> Int {
    return values.count
}

func avg(values:[Int]) -> Int {
   return addArray(values) / count(values)
}

func arrayOp(values:[Int], op:([Int])-> Int )-> Int {
    return op(values)
}

//Test
print("Sample calculation with [1,2,4,5]")
print("Sum: \(arrayOp([1,2,4,5],op:addArray))")
print("Multiply: \(arrayOp([1,2,4,5],op:mulArray))")
print("Count: \(arrayOp([1,2,4,5],op:count))")
print("Average: \(arrayOp([1,2,4,5],op:avg))")





/* Points */

func addPoints(p1:(x:Int,y:Int), p2:(x:Int,y:Int)) -> (Int, Int) {
    return (p1.x+p2.x,p1.y+p2.y)
}

func subPoints(p1:(x:Int,y:Int), p2:(x:Int,y:Int)) -> (Int, Int) {
    return (p1.x-p2.x,p1.y-p2.y)
}



func checkNil(point:[String:Double]) -> Bool{
    var isNil = true
    var xy = 0
    for key in point.keys {
        if point[key]  != nil {
            isNil = false
            xy++
        }
    }
    if(xy>1) {
        isNil = false
    } else {
        isNil = true
    }
   return isNil
}

func operate(p1:[String:Double], p2:[String:Double],op:((Int,Int),(Int,Int)) -> (Int,Int))-> Void {
    if (checkNil(p1) == true || checkNil(p2) == true) {
      print("Something is Nill")
      exit(0)
    } else {
      let x1 = Int((p1["x"])!)
      let y1 = Int((p1["y"])!)
      let x2 = Int((p2["x"])!)
      let y2 = Int((p2["y"])!)
        
      print(op((x1,y1),(x2,y2)))
    }
}


//Test(add/sub points)
var p1 = [String:Double]()
p1["x"]=1
p1["y"]=2

var p2 = [String:Double]()
p2["x"]=3
p2["y"]=4

print("Sample calcuation with (1,2) and (3,4)")
print("Add: (1,2) + (3,4) = ")
    operate(p1,p2:p2,op:addPoints)
print("Sub: (1,2) - (3,4) = ")
    operate(p1,p2:p2,op:subPoints)

//Test(points with double)
p1["x"]=1.0
p1["y"]=3.0

p2["x"]=4.0
p2["y"]=5.0

print("Sample calcuation with (1.0,3.0) and (4.0,5.0)")
print("Add: (1.0,3.0) + (4.0,5.0) = ")
    operate(p1,p2:p2,op:addPoints)
print("Sub: (1.0,3.0) - (4.0,5.0) = ")
    operate(p1,p2:p2,op:subPoints)

//Test(points with nil)
p1["x"]=nil
p1["y"]=3.0

p2["x"]=4.0
p2["y"]=5.0

print("Sample calcuation with (nil,3.0) and (4.0,5.0)")
print("Add: (nil,3.0) + (4.0,5.0) = ")
    operate(p1,p2:p2,op:addPoints)
print("Sub: (nil,3.0) - (4.0,5.0) = ")
    operate(p1,p2:p2,op:subPoints)