#!/usr/bin/swift

import Foundation

let contents = try! String(contentsOfFile: "inputs.txt")

let expenses = contents
    .split(separator:"\n")
    .map { Int($0)! }

outer: for inner in expenses {
    for outer in expenses {
        if (inner+outer == 2020) {
            print("pair: \(inner) and \(outer); product: \(inner*outer)")
            break outer
        }
    }
}
