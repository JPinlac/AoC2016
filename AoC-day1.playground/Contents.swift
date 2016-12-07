//: Playground - noun: a place where people can play

import UIKit

var inputString = "R3, L5, R2, L1, L2, R5, L2, R2, L2, L2, L1, R2, L2, R4, R4, R1, L2, L3, R3, L1, R2, L2, L4, R4, R5, L3, R3, L3, L3, R4, R5, L3, R3, L5, L1, L2, R2, L1, R3, R1, L1, R187, L1, R2, R47, L5, L1, L2, R4, R3, L3, R3, R4, R1, R3, L1, L4, L1, R2, L1, R4, R5, L1, R77, L5, L4, R3, L2, R4, R5, R5, L2, L2, R2, R5, L2, R194, R5, L2, R4, L5, L4, L2, R5, L3, L2, L5, R5, R2, L3, R3, R1, L4, R2, L1, R5, L1, R5, L1, L1, R3, L1, R5, R2, R5, R5, L4, L5, L5, L5, R3, L2, L5, L4, R3, R1, R1, R4, L2, L4, R5, R5, R4, L2, L2, R5, R5, L5, L2, R4, R4, L4, R1, L3, R1, L1, L1, L1, L4, R5, R4, L4, L4, R5, R3, L2, L2, R3, R1, R4, L3, R1, L4, R3, L3, L2, R2, R2, R2, L1, L4, R3, R2, R2, L3, R2, L3, L2, R4, L2, R3, L4, R5, R4, R1, R5, R3"
//var inputString = "R8, R4, R4, R8"
var inputArray = inputString.components(separatedBy: ", ");

func seperateCode(code: String) -> Array<Any> {
    var code = code
    var array = [Any]()
    array.append(code.substring(to: code.index(code.startIndex, offsetBy: 1)))
    code.remove(at: code.startIndex)
    array.append(code)
    return array
}

let parsedArray = inputArray.map({seperateCode(code: $0)})

struct Location {
    var x = 0
    var y = 0
    var heading = 0
    var log = [[0,0]]
    var lastLocation = [0,0]
    var repeatFound = false
}

var currentLocation = Location()

func checkRepeat() -> Void {
    
    var difference = [currentLocation.x - currentLocation.lastLocation[0], currentLocation.y - currentLocation.lastLocation[1]]
    var spot = [currentLocation.lastLocation[0], currentLocation.lastLocation[1]]
    while difference != [0,0] {
        if difference[0] > 0 {
            spot = [spot[0] + 1, spot [1]]
            difference = [difference[0] - 1, 0]
        } else if difference[0] < 0 {
            spot = [spot[0] - 1, spot [1]]
            difference = [difference[0] + 1, 0]
        } else if difference[1] > 0 {
            spot = [spot [0], spot[1] + 1]
            difference = [0, difference[1] - 1]
        } else {
            spot = [spot [0], spot[1] - 1]
            difference = [0, difference[1] + 1]
        }
        currentLocation.log.forEach({place in
            if spot == place {
                print("First repeat spot: \(spot) Distance \(abs(spot[0]) + abs(spot[1]))")
                currentLocation.repeatFound = true
            }
        })
        currentLocation.log.append(spot)
    }
}

func moveLocation(array: Array<String>) -> Void {
    let direction = array[0]
    if direction == "R" {
        if currentLocation.heading == 3 {
            currentLocation.heading = 0
        } else {
        currentLocation.heading += 1
        }
    } else {
        if currentLocation.heading == 0 {
            currentLocation.heading = 3
        } else {
            currentLocation.heading -= 1
        }
    }
        
    switch currentLocation.heading {
    case 0:
        currentLocation.y += Int(array[1])!
    case 1:
        currentLocation.x += Int(array[1])!
    case 2:
        currentLocation.y -= Int(array[1])!
    case 3:
        currentLocation.x -= Int(array[1])!
    default:
        print("Out of bounds direction")
    }
}

parsedArray.forEach({ item in
    currentLocation.lastLocation = [currentLocation.x, currentLocation.y]
    moveLocation(array: item as! Array<String>)
    if currentLocation.repeatFound == false {
        checkRepeat()
    }
})

print("Final distance \(abs(currentLocation.x) + abs(currentLocation.y))")
