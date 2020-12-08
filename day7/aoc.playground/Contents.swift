import Foundation

let fileUrl = Bundle.main.url(forResource: "sample", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)

let rules = contents.components(separatedBy: "\n")

let regex1 = try NSRegularExpression(pattern: "^(.*) bags contain (.*)\\.$", options: .caseInsensitive)
let regex2 = try NSRegularExpression(pattern: "^(\\d+) (.*?) bags?$", options: .caseInsensitive)

var containedBy: [String:[String]] = [:]
var golds: [String] = []

for rule in rules {
    
    if let match = regex1.firstMatch(in: rule, options: [], range: NSRange(location: 0, length: rule.utf16.count)) {
        
        let outerRange = Range(match.range(at: 1), in: rule)!
    
        let outer = String(rule[outerRange])
        print(outer)
        
        if let innersRange = Range(match.range(at: 2), in: rule) {
            let inners = rule[innersRange]
            
            if (inners == "no other bags") {
                // Nothing to do.
                print("\tempty")
            } else {
                
                let bags = inners.components(separatedBy: ", ")
                
                for bag in bags {
                    
                    if let match = regex2.firstMatch(in: bag, options: [], range: NSRange(location: 0, length: bag.utf16.count)) {
                    
                        let quantity = bag[Range(match.range(at: 1), in: bag)!];
                        let color = String(bag[Range(match.range(at: 2), in: bag)!]);
                        print("\t", quantity, " --> ", color)
                        
                        if (color == "shiny gold") {
                            golds.append(outer)
                        }
                        
                        if containedBy[color] == nil {
                            containedBy[color] = []
                        }
                        containedBy[color]?.append(outer)
                    }
                    
                }
            }
        }
    }
}
