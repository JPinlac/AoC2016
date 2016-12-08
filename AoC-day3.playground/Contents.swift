//: Playground - noun: a place where people can play

import UIKit

guard let triangles = try? String(contentsOf: #fileLiteral(resourceName: "input.txt")) else { fatalError() }

var triangleArray = [[Int]]()
triangles.enumerateLines { (line, _) in
    let singleItemArray = line.components(separatedBy: CharacterSet.newlines)
    let filteredItemArray = singleItemArray[0].components(separatedBy: CharacterSet.whitespaces)
        .filter{
            $0 != ""
        }
        .map{ item in
            Int(item)
        }
        .flatMap{
            $0
    }
    let orderedItemArray = filteredItemArray.sorted(by: { (s1: Int?, s2:Int?) -> Bool in
        s1! < s2!
    })
    
    if orderedItemArray[0] + orderedItemArray[1] > orderedItemArray[2] {
        triangleArray.append(orderedItemArray)
    }
}
print(triangleArray.count)
