//: Playground - noun: a place where people can play

import UIKit

let input = ["DLRURUDLULRDRUDDRLUUUDLDLDLRLRRDRRRLLLLLDDRRRDRRDRRRLRRURLRDUULRLRRDDLULRLLDUDLULURRLRLDUDLURURLDRDDULDRDRDLDLLULULLDDLRRUDULLUULRRLLLURDRLDDLDDLDRLRRLLRURRUURRRRLUDLRDDDDRDULRLLDDUURDUDRLUDULLUDLUDURRDRDUUUUDDUDLLLRLUULRUURDLRLLRRLRLLDLLRLLRRRURLRRLURRLDLLLUUDURUDDLLUURRDRDRRDLLDDLLRDRDRRLURLDLDRDLURLDULDRURRRUDLLULDUDRURULDUDLULULRRRUDLUURRDURRURRLRRLLRDDUUUUUDUULDRLDLLRRUDRRDULLLDUDDUDUURLRDLULUUDLDRDUUUDDDUDLDURRULUULUUULDRUDDLLLDLULLRLRLUDULLDLLRLDLDDDUUDURDDDLURDRRDDLDRLLRLRR",
"RLDUDURDRLLLLDDRRRURLLLRUUDDLRDRDDDUDLLUDDLRDURLDRDLLDRULDDRLDDDRLDRDDDRLLULDURRRLULDRLRDRDURURRDUDRURLDRLURDRLUULLULLDLUDUDRDRDDLDDDDRDURDLUDRDRURUDDLLLRLDDRURLLUDULULDDLLLDLUDLDULUUDLRLURLDRLURURRDUUDLRDDDDDRLDULUDLDDURDLURLUURDLURLDRURRLDLLRRUDRUULLRLDUUDURRLDURRLRUULDDLDLDUUDDRLDLLRRRUURLLUURURRURRLLLUDLDRRDLUULULUDDULLUDRLDDRURDRDUDULUDRLRRRUULLDRDRLULLLDURURURLURDLRRLLLDRLDUDLLLLDUUURULDDLDLLRRUDDDURULRLLUDLRDLUUDDRDDLLLRLUURLDLRUURDURDDDLLLLLULRRRURRDLUDLUURRDRLRUDUUUURRURLRDRRLRDRDULLDRDRLDURDDUURLRUDDDDDLRLLRUDDDDDURURRLDRRUUUDLURUUDRRDLLULDRRLRRRLUUUD",
"RDRURLLUUDURURDUUULLRDRLRRLRUDDUDRURLLDLUUDLRLLDDURRURLUDUDDURLURLRRURLLURRUDRUDLDRLLURLRUUURRUDDDURRRLULLLLURDLRLLDDRLDRLLRRDLURDLRDLDUDRUULLDUUUDLURRLLRUDDDUUURLURUUDRLRULUURLLRLUDDLLDURULLLDURDLULDLDDUDULUDDULLRDRURDRRLLDLDDDDRUDLDRRLLLRLLLRRULDLRLRLRLLDLRDRDLLUDRDRULDUURRDDDRLLRLDLDRDUDRULUDRDLDLDDLLRULURLLURDLRRDUDLULLDLULLUDRRDDRLRURRLDUDLRRUUDLDRLRLDRLRRDURRDRRDDULURUUDDUUULRLDRLLDURRDLUULLUDRDDDLRUDLRULLDDDLURLURLRDRLLURRRUDLRRLURDUUDRLRUUDUULLRUUUDUUDDUURULDLDLURLRURLRUDLULLULRULDRDRLLLRRDLU",
"RRRRDRLUUULLLRLDDLULRUUURRDRDRURRUURUDUULRULULRDRLRRLURDRRRULUUULRRUUULULRDDLLUURRLLDUDRLRRLDDLDLLDURLLUDLDDRRURLDLULRDUULDRLRDLLDLRULLRULLUDUDUDDUULDLUUDDLUDDUULLLLLURRDRULURDUUUDULRUDLLRUUULLUULLLRUUDDRRLRDUDDRULRDLDLLLLRLDDRRRULULLLDLRLURRDULRDRDUDDRLRLDRRDLRRRLLDLLDULLUDDUDDRULLLUDDRLLRRRLDRRURUUURRDLDLURRDLURULULRDUURLLULDULDUDLLULDDUURRRLDURDLUDURLDDRDUDDLLUULDRRLDLLUDRDURLLDRLDDUDURDLUUUUURRUULULLURLDUUULLRURLLLUURDULLUULDRULLUULRDRUULLRUDLDDLRLURRUUDRLRRRULRUUULRULRRLDLUDRRLL",
"ULRLDLLURDRRUULRDUDDURDDDLRRRURLDRUDDLUDDDLLLRDLRLLRRUUDRRDRUULLLULULUUDRRRDRDRUUUUULRURUULULLULDULURRLURUDRDRUDRURURUDLDURUDUDDDRLRLLLLURULUDLRLDDLRUDDUUDURUULRLLLDDLLLLRRRDDLRLUDDUULRRLLRDUDLLDLRRUUULRLRDLRDUDLLLDLRULDRURDLLULLLRRRURDLLUURUDDURLDUUDLLDDRUUDULDRDRDRDDUDURLRRRRUDURLRRUDUDUURDRDULRLRLLRLUDLURUDRUDLULLULRLLULRUDDURUURDLRUULDURDRRRLLLLLUUUULUULDLDULLRURLUDLDRLRLRLRDLDRUDULDDRRDURDDULRULDRLRULDRLDLLUDLDRLRLRUDRDDR"]

func parseCode(code: String) -> Array<Character> {
    var code = code
    var array = [Character]()
    for _ in code.characters{
        array.append(code.remove(at: code.startIndex))
    }
    return array
}

var parsedInput = input.map({parseCode(code: $0)})

let topBorder = [1,2,3]
let rightBorder = [3,6,9]
let bottomBorder = [7,8,9]
let leftBorder = [1,4,7]
var currentNumber = 5

func executeInput(input: Character) {
    if input == "U" {
        currentNumber = topBorder.contains(currentNumber) ? currentNumber : currentNumber - 3
    } else if input == "R" {
        currentNumber = rightBorder.contains(currentNumber) ? currentNumber : currentNumber + 1
    } else if input == "D" {
        currentNumber = bottomBorder.contains(currentNumber) ? currentNumber : currentNumber + 3
    } else {
        currentNumber = leftBorder.contains(currentNumber) ? currentNumber : currentNumber - 1
    }
}

parsedInput.forEach({instruction in
    for char in instruction {
        executeInput(input: char)
    }
    print(currentNumber)
    currentNumber = 5
})

let keypad = [
["0","0","1","0","0"],
["0","2","3","4","0"],
["5","6","7","8","9"],
["0","A","B","C","0"],
["0","0","D","0","0"]]
var newCurrentChar = "5"
var currentLocationOnKeypad = [2,0]
let newTopBorder = ["5","2","1","4","9"]
let newRightBorder = ["1","4","9","C","D"]
let newBottomBorder = ["5","A","D","C","9"]
let newLeftBorder = ["1","2","5","A","D"]

func newExecuteInput(input: Character) {
    if input == "U" {
        currentLocationOnKeypad = newTopBorder.contains(newCurrentChar) ? currentLocationOnKeypad : [currentLocationOnKeypad[0] - 1, currentLocationOnKeypad[1]]
        newCurrentChar = keypad[currentLocationOnKeypad[0]][currentLocationOnKeypad[1]]
    } else if input == "R" {
        currentLocationOnKeypad = newRightBorder.contains(newCurrentChar) ? currentLocationOnKeypad : [currentLocationOnKeypad[0], currentLocationOnKeypad[1] + 1]
        newCurrentChar = keypad[currentLocationOnKeypad[0]][currentLocationOnKeypad[1]]
    } else if input == "D" {
        currentLocationOnKeypad = newBottomBorder.contains(newCurrentChar) ? currentLocationOnKeypad : [currentLocationOnKeypad[0] + 1, currentLocationOnKeypad[1]]
        newCurrentChar = keypad[currentLocationOnKeypad[0]][currentLocationOnKeypad[1]]
    } else {
        currentLocationOnKeypad = newLeftBorder.contains(newCurrentChar) ? currentLocationOnKeypad : [currentLocationOnKeypad[0], currentLocationOnKeypad[1] - 1]
        newCurrentChar = keypad[currentLocationOnKeypad[0]][currentLocationOnKeypad[1]]
    }
}
parsedInput.forEach({instruction in
    for char in instruction {
        newExecuteInput(input: char)
    }
    print(keypad[currentLocationOnKeypad[0]][currentLocationOnKeypad[1]])
    newCurrentChar = "5"
    currentLocationOnKeypad = [2,0]
})


