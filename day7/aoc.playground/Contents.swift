import Foundation

let fileUrl = Bundle.main.url(forResource: "sample", withExtension: "txt")
let contents = try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)

let rules = contents.components(separatedBy: "\n")

for rule in rules {
    //print(rule)
    
    let pattern = "^(.*) bags contain (.*)\\.$"
    let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let match = regex.firstMatch(in: rule, options: [], range: NSRange(location: 0, length: rule.utf16.count))!
    let outerRange = Range(match.range(at: 1), in: rule)!
    
    print(rule[outerRange])
        
        if let innersRange = Range(match.range(at: 2), in: rule) {
            let inners = rule[innersRange]
            
            if (inners == "no other bags") {
                // Nothing to do.
                print("\tempty")
            } else {
                
                let bags = inners.components(separatedBy: ", ")
                
                for bag in bags {
                    
                    let pattern = "^(\\d+) (.*?) bags?$"
                    let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
                    if let match = regex?.firstMatch(in: bag, options: [], range: NSRange(location: 0, length: bag.utf16.count)) {
                    
                        let quantity = Range(match.range(at: 1), in: bag)!;
                        let color = Range(match.range(at: 2), in: bag)!;
                        print("\t", bag[quantity], " --> ", bag[color])
                        
                    }
                    
                }
            }
        }
      
}
