//: Playground - noun: a place where people can play

import UIKit

guard let rooms = try? String(contentsOf: #fileLiteral(resourceName: "inputDay4.txt")) else { fatalError() }

//let rooms = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"

var realRoomIDSum = 0
rooms.enumerateLines { (room, _) in
    let range = room.rangeOfCharacter(from: CharacterSet.decimalDigits)!
    let distance = room.distance(from: room.startIndex, to: range.lowerBound)
    let index = room.index(room.startIndex, offsetBy: distance - 1)
    let name = room.substring(to: index).replacingOccurrences(of: "-", with: "")
    
    var charCount = [Character : Int]()
    for char in name.characters {
        if !charCount.keys.contains(char){
            charCount[char] = 1
        } else {
            charCount[char] = charCount[char]! + 1
        }
    }
    
    let sectorStart = room.index(room.startIndex, offsetBy: distance)
    let sectorEnd = room.index(room.startIndex, offsetBy: distance + 3)
    let sectorID = Int(room.substring(with: sectorStart..<sectorEnd))!
    
    var code = ""
    let sortedCharCount = charCount.sorted{
        if $0.value < $1.value {
            return false
        }
        if $0.value == $1.value && $0 > $1 {
            return false
        }
        return true
    }
    for index in 0...4 {
        code = code + String(sortedCharCount[index].key)
    }
    let codeRange = room.rangeOfCharacter(from: CharacterSet.init(charactersIn: "]"))!
    let codeDistance = room.distance(from: room.startIndex, to: codeRange.lowerBound)
    let start = room.index(room.startIndex, offsetBy: codeDistance - 5)
    let end = room.index(room.startIndex, offsetBy: codeDistance)
    let checksum = room.substring(with: start..<end)
    
    if checksum == code {
        realRoomIDSum += sectorID
    }
}
print(realRoomIDSum)
