import Foundation

let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n")
    .map { Int($0)! }

//let s = crossSum(list1: contents, list2: contents)

let preamble = 25

for i in preamble..<contents.count {
    let sums = crossSum(list1: contents[i-preamble..<i], list2: contents[i-preamble..<i])
    print(contents[i])
    if (sums.contains(contents[i])) {
        print( "success")
    } else {
        print( "fail")
        break
    }
}





private func crossSum(list1: ArraySlice<Int>, list2: ArraySlice<Int>) -> [Int] {
    list1.flatMap { a in
        list2.map { b in
            //print(a, " + ", b, " = ", a+b)
            return a+b
        }
    }
}
