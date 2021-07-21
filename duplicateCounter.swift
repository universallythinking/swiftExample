extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

func countDuplicates(originalArray: Array<AnyHashable>) -> Array<Int> {
    var index: Int = 0
    var dupCount:Dictionary<AnyHashable, Int> = [:]
    var duplicateIndexes: Array<Int> = []
    for item in originalArray {
        dupCount[item] = (dupCount[item] ?? 0) + 1
    }
    for item in dupCount {
        if item.value > 1 {
            duplicateIndexes = originalArray.indexes(of: originalArray[index])
        }
        index+=1
    }
    index = 0
    return duplicateIndexes
}

func findDuplicates(products: Array<String>, prices: Array<Int>, weights: Array<Int>) -> Int? {
    let productDuplicates = countDuplicates(originalArray: products)
    let priceDuplicates = countDuplicates(originalArray: prices)
    let weightDuplicates = countDuplicates(originalArray: weights)
    print(productDuplicates, priceDuplicates, weightDuplicates)
    var index: Int = 0
    var finalTally: Int = 0
    for item in productDuplicates {
        if priceDuplicates.indices.contains(index) &&
        weightDuplicates.indices.contains(index) &&
        item == priceDuplicates[index] && item == weightDuplicates[index] {
            finalTally += 1
        }
        index+=1
    }
    print("Total matches: " + String(finalTally))
    return finalTally
}

var productsArray: Array<String> = ["ball","ball", "ball","glove","base"]
var pricesArray: Array<Int> = [2,2,2,3,4]
var weightsArray: Array<Int> = [2,2,2,3,4]

findDuplicates(products: productsArray, prices: pricesArray, weights: weightsArray)
