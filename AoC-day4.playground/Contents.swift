//: Playground - noun: a place where people can play

import UIKit

//guard let rooms = try? String(contentsOf: #fileLiteral(resourceName: "inputDay4.txt")) else { fatalError() }

let rooms = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"

var realRooms = 0
rooms.enumerateLines { (room, _) in
    let range = room.rangeOfCharacter(from: CharacterSet.decimalDigits)!
    let index = room.index(room.startIndex, offsetBy: room.distance(from: room.startIndex, to: range.lowerBound) - 1)
    let name = room.substring(to: index).replacingOccurrences(of: "-", with: "")
    
    var charCount = [Character : Int]()
    for char in name.characters {
        if !charCount.keys.contains(char){
            charCount[char] = 1
        } else {
            charCount[char] = charCount[char]! + 1
        }
    }
    print(charCount)

}