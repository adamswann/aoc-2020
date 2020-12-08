import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)

let instructions = contents
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")

let regex = try NSRegularExpression(pattern: "^(.*) ([\\+\\-]{1})(\\d+)$")

var acc = 0;
var pc = 0;
var execCount = Array(repeating: 0, count: instructions.count)
while (true) {

    let line = instructions[pc]
    print(pc, ":", line, "[count=\(execCount[pc]), acc=\(acc)]")
    
    // Part 1 answerer
    if (execCount[pc] == 1) {
        break;
    }
    
    execCount[pc] += 1
    
    
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

