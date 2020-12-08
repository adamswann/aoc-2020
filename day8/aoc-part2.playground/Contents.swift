import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
let instructions = contents
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")

for i in 0..<instructions.count {
    print("---", i, "----------------------")
    if(exec(instructions: instructions, swap: i)) {
        break
    }
}

func exec(instructions: [String], swap: Int) -> Bool {

    let regex = try! NSRegularExpression(pattern: "^(.*) ([\\+\\-]{1})(\\d+)$")

    var acc = 0;
    var pc = 0;
    var execCount = Array(repeating: 0, count: instructions.count)
    while (true) {

        if (pc >= instructions.count) {
            print("complete i=\(swap), acc=\(acc)") // Answer is in acc
            return true;
        }
        
        let line = instructions[pc]
        print(pc, ":", line, "[count=\(execCount[pc]), acc=\(acc)]")
        
        execCount[pc] += 1
        if (execCount[pc] == 2) {
            // Instruction is being hit a second time; so infinite loop.
            print("error - infinite loop i=\(swap)")
            return false;
        }

        if let m = regex.firstMatch(in: line, options: [], range: NSRange(location: 0, length: line.utf16.count)) {
            
            var instruction = line[Range(m.range(at: 1), in: line)!];
            let sign = line[Range(m.range(at: 2), in: line)!];
            let operand = line[Range(m.range(at: 3), in: line)!];
            
            if (pc == swap) {
                print("Swap!")
                instruction = (instruction == "nop" ? "jmp" : "nop")
            }
            
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

}
