import UIKit
import Foundation


let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)

let groups = contents.components(separatedBy: "\n\n")

var answerCount: Int = 0
var allAnswered = 0 // For Part 2

for group in groups {
    
    let lettersOnly = group.replacingOccurrences(of: "\n", with: "")
    
    var answerTally: [Character : Int] = [:]
    
    for answer in lettersOnly {
        answerTally[answer] = (answerTally[answer] ?? 0) + 1
    }
    answerCount += answerTally.count
    
    // For part 2, we need to know how many people were in the group.
    let participants = group
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .components(separatedBy: "\n")
    let participantCount = participants.count
    answerTally.map { allAnswered += ($0.value == participantCount ? 1 : 0) }
    
   
}

print("Part 1 Answer: \(answerCount)")
print("Part 2 Answer: \(allAnswered)")
