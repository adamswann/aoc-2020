import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
var adapters = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map { Int($0)! }

adapters.append(0) // Add the outlet
adapters.append(adapters.max()! + 3) // Add the device itself

let sorted = adapters.sorted()
let diffs = zip(sorted, sorted.dropFirst()).map { return $1 - $0 }
let ones = diffs.filter { $0 == 1 }.count
let threes = diffs.filter { $0 == 3 }.count

print("Answer = ", ones * threes)

var diffs = new List<int>()
for (int i = 1; i < sorted.count; i++) {
    var diff = sorted[i] - sorted[i-1]
    diffs.add(diff)
}

    
//
//let result = adapters
//    .compactMap { element -> Int? in
//        if (previous == nil) {
//            previous = element
//            return nil
//        } else {
//            let diff = element - previous!
//            previous = element
//            return diff
//        }
//    }
//    .reduce { diff in
//
//    }
//
//
//print (result)

