import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
var adapters = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map { Int($0)! }

adapters.append(0) // Add the outlet
adapters.append(adapters.max()! + 3) // Add the device itself

let sorted = adapters.sorted()
var counter = 0
recurse(sorted)
print("final count=", counter)


func recurse(_ adapters: [Int]) {
    //print(adapters)
    
    if (adapters.count == 1) {
        //print("huzzah")
        counter += 1
    } else {
        for i in 1...3 {
            if (i < adapters.count && adapters[i] - adapters[0] <= 3) {
                recurse(Array(adapters[i...]))
            }
        }
    }
}
