import UIKit

var greeting = "Hello, playground"

let numbers = [1, 2, 3, 4, 5]
var evens = [Int]()

for number in numbers {
    if number.isMultiple(of: 2) {
        evens.append(number)
    }
}

let evens1 = numbers.filter { $0.isMultiple(of: 2) }
print(evens1)

let numbers1 = ["1", "2", "fish", "3"]
let evensMap = numbers1.map(Int.init)
let evensCompactMap = numbers1.compactMap(Int.init)


enum NetworkError: Error {
    case badURL
}

func createResult() -> Result<String, NetworkError> {
    return .failure(.badURL)
}

let result = createResult()
do {
    let successString = try result.get()
    print(successString)
} catch {
    print("Oops! There was an error.")
}

let someURL = URL(string: "")
let result1 = Result { try String(contentsOf: (someURL ?? URL(string:"https://apple.com"))!) }
