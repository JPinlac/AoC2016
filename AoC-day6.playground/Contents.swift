//: Playground - noun: a place where people can play

import UIKit

guard let input = try? String(contentsOf: #fileLiteral(resourceName: "input.txt")) else { fatalError() }

//let input = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"

var charCount: [[Character: Int]] = [[:],[:],[:],[:],[:],[:],[:],[:]]
input.enumerateLines { (line, _) in
    for i in 0..<8 {
        let char = line[line.index(line.startIndex, offsetBy: i)]

        if !charCount[i].keys.contains(char) {
            charCount[i][char] = 1
        } else {
            charCount[i][char] = charCount[i][char]! + 1
        }
    }
}
var password = ""
for dict in charCount {
    print(dict)
    for (char, count) in dict {
        let max = dict.values.max()!
        if count == max {
            password += String(char)
        }
    }
}
print(password)