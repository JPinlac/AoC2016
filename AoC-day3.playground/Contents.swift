//: Playground - noun: a place where people can play

import UIKit

guard let triangles = try? String(contentsOf: #fileLiteral(resourceName: "input.txt")) else { fatalError() }

var triangleCount = 0
var triangleCount2 = 0
var part2TriangleArray = [[Int]](arrayLiteral: [],[],[])
var row = 0
triangles.enumerateLines { (line, _) in
    var singleItemArray = line.components(separatedBy: CharacterSet.whitespaces)
        .filter{
            $0 != ""
        }
        .map{ item in
            Int(item)
        }
        .flatMap{
            $0
        }
    
// Part 1 Solution
    let sortedArray1 = singleItemArray.sorted(by: { (v1: Int, v2:Int) -> Bool in
        v1 < v2
    })
    
    if sortedArray1[0] + sortedArray1[1] > sortedArray1[2] {
        triangleCount += 1
    }
// Part 2 Solution
    if row < 3 {
        for i in 0...2 {
            part2TriangleArray[i].append(singleItemArray[i])
        }
        row += 1
    }
    if row == 3 {
        row = 0
        part2TriangleArray.forEach { item in
            let sortedArray2 = item.sorted(by: { (s1: Int, s2:Int) -> Bool in
                s1 < s2
            })
            if sortedArray2[0] + sortedArray2[1] > sortedArray2[2] {
                triangleCount2 += 1
            }
        }
        part2TriangleArray = [[Int]](arrayLiteral: [],[],[])
    }
}
print(triangleCount)
print(triangleCount2)


