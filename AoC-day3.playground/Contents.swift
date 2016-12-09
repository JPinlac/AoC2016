//: Playground - noun: a place where people can play

import UIKit

guard let triangles = try? String(contentsOf: #fileLiteral(resourceName: "input.txt")) else { fatalError() }
//let triangles = "  810  679   10\n783  255  616\n545  626  626\n   84  910  149\n607  425  901\n556  616  883"
var triangleArray = [[Int]]()
//triangles.enumerateLines { (line, _) in
//    let singleItemArray = line.components(separatedBy: CharacterSet.newlines)
//    let filteredItemArray = singleItemArray[0].components(separatedBy: CharacterSet.whitespaces)
//        .filter{
//            $0 != ""
//        }
//        .map{ item in
//            Int(item)
//        }
//        .flatMap{
//            $0
//    }
//    let orderedItemArray = filteredItemArray.sorted(by: { (s1: Int, s2:Int) -> Bool in
//        s1 < s2
//    })
//    if orderedItemArray[0] + orderedItemArray[1] > orderedItemArray[2] {
//        triangleArray.append(orderedItemArray)
//    }
//}
//print(triangleArray.count)

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
    triangleArray.append(filteredItemArray)
}
var triangleCount = 0
var part2TriangleArray = [[Int]](arrayLiteral: [],[],[])
var row = 0
for item in triangleArray {
    if row < 3 {
        for i in 0...2 {
            part2TriangleArray[i].append(item[i])
        }
        row += 1
    }
    if row == 3 {
        row = 0
        part2TriangleArray.forEach { item in
            let sortedArray = item.sorted(by: { (s1: Int, s2:Int) -> Bool in
                s1 < s2
            })
            if sortedArray[0] + sortedArray[1] > sortedArray[2] {
                triangleCount += 1
            }
        }
        part2TriangleArray = [[Int]](arrayLiteral: [],[],[])
    }
}
print(triangleCount)


