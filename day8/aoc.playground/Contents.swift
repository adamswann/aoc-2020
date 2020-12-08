import Foundation

let fileUrl = Bundle.main.url(forResource: "sample", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)

let instructions = contents
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")

let regex = try NSRegularExpression(pattern: "^(.*) ([\\+\\-]{1})(\\d+)$")

var acc = 0;
var pc = 0;
while (true) {

    let line = instructions[pc]
    
    print(pc, ":", line)
    
    if let m = regex.firstMatch(in: line, options: [], range: NSRange(location: 0, length: line.utf16.count)) {
        
        let instruction = line[Range(m.range(at: 1), in: line)!];
        let sign = line[Range(m.range(at: 2), in: line)!];
        let operand = line[Range(m.range(at: 3), in: line)!];
        
        let opValue = (sign=="-" ? -1 : 1) * Int(operand)!
        
        
        switch instruction {
            case "acc":
                acc += opValue
            case "nop":
                break;  // do nothing.
            case "jmp":
                pc += opValue - 1
            default:
                print("unexpected opcode", instruction)
        }
        
    }
    pc += 1

}
//
//let regex1 = try NSRegularExpression(pattern: "^(.*) bags contain (.*)\\.$", options: .caseInsensitive)
//let regex2 = try NSRegularExpression(pattern: "^(\\d+) (.*?) bags?$", options: .caseInsensitive)
//
//var containedBy: [String:[String]] = [:]
//var contains: [String:[(String,Int)]] = [:]
//
//var golds: [String] = []
//
//for rule in rules {
//    
//    if let match = regex1.firstMatch(in: rule, options: [], range: NSRange(location: 0, length: rule.utf16.count)) {
//        
//        let outerRange = Range(match.range(at: 1), in: rule)!
//    
//        let outer = String(rule[outerRange])
//        //print(outer)
//        
//        
//        contains[outer] = []
//        if let innersRange = Range(match.range(at: 2), in: rule) {
//            let inners = rule[innersRange]
//            
//            if (inners == "no other bags") {
//                // Nothing to do.
//                //print("\tempty")
//            } else {
//                
//                let bags = inners.components(separatedBy: ", ")
//                
//                for bag in bags {
//                    
//                    if let match = regex2.firstMatch(in: bag, options: [], range: NSRange(location: 0, length: bag.utf16.count)) {
//                    
//                        let quantity = Int(bag[Range(match.range(at: 1), in: bag)!])!;
//                        let color = String(bag[Range(match.range(at: 2), in: bag)!]);
//                        //print("\t", quantity, " --> ", color)
//                        
//                        if (color == "shiny gold") {
//                            golds.append(outer)
//                        }
//                        
//                        if containedBy[color] == nil {
//                            containedBy[color] = []
//                        }
//                        containedBy[color]?.append(outer)
//                    
//                        contains[outer]?.append((color,quantity))
//                    }
//                    
//                }
//            }
//        }
//    }
//}
//
//var winners: [String] = []
//visit(bags: golds)
//var unique = Array(Set(winners))
//print("count, part1: ", unique.count)
//
//let total = visit2(bags: contains["shiny gold"]!)
//print("total, part2: ", total)
//
//func visit(bags: [String]) {
//    for bag in bags {
//        //print(bag)
//        winners.append(bag)
//        
//        if containedBy[bag] != nil {
//            visit(bags: containedBy[bag]!)
//        }
//    }
//}
//
//func visit2(bags: [(String,Int)]) -> Int {
//    var runningTotal = 0
//    for bag in bags {
//        print(bag)
////        winners.append(bag)
//        runningTotal += bag.1
//        
//        if contains[bag.0] != nil {
//            runningTotal += visit2(bags: contains[bag.0]!) * bag.1
//       }
//    }
//    return runningTotal
//}
