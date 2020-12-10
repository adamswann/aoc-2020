import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map { Int($0)! }

//let s = crossSum(list1: contents, list2: contents)

let preamble = 25
let target = 1930745883

for i in 0..<contents.count {
    //print(i)
    var acc = 0
    var j = i
    var smallest = contents[i]
    var largest = contents[j]
    repeat {
        acc += contents[j]
        
        if (contents[j] < smallest) {
            smallest = contents[j]
        }
        
        if (contents[j] > largest) {
            largest = contents[j]
        }
        
        if acc == target {
            print("winner. i=\(i) , j=\(j)")
            print("sum = \(largest+smallest)")
            exit(0)
        }
        
        j += 1
        
    } while (acc < target)
    
}
