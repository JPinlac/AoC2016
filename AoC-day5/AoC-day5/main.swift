//
//  main.swift
//  AoC-day5
//
//  Created by Jonathan on 12/14/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation

func MD5(string: String) -> String? {
    
    guard let messageData = string.data(using:String.Encoding.utf8) else { return nil } //convert to C string
    var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    
    _ = digestData.withUnsafeMutableBytes {digestBytes in
        messageData.withUnsafeBytes {messageBytes in
            CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes) //hash string
        }
    }
    let hashed = digestData.map { String(format: "%02hhx", $0) }.joined() //convert hash to string
    return hashed
}


let doorID = "wtnhxymk"
var password = ""
var count = 0
var part2Count = 0
var part2Password: [String] = ["","","","","","","",""]
var part2Position: [String] = ["0","1","2","3","4","5","6","7"]
for character in 0..<8 {
    var firstFiveHash = ""
    repeat {
        let hash = MD5(string: (doorID + String(count)))!
        firstFiveHash = hash.substring(to: hash.index(hash.startIndex, offsetBy: 5))
        count += 1
        
        if firstFiveHash == "00000" {
            print("hash: \(hash)")
            let firstChar = hash.substring(with: hash.index(hash.startIndex, offsetBy: 5)..<hash.index(hash.startIndex, offsetBy: 6))
            if part2Position.contains(firstChar) {
                part2Position[Int(firstChar)!] = ""
                part2Password[Int(firstChar)!] = hash.substring(with: hash.index(hash.startIndex, offsetBy: 6)..<hash.index(hash.startIndex, offsetBy: 7))
                part2Count += 1
            }
            if password.characters.count <= 8 {
                password += firstChar
            }
        }
    } while part2Count != 8
}
print("Part 1: \(password)")
print("Part 2: \(part2Password)")
