import UIKit

func isValid(code: String) -> Bool {
    let openersToClosers: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
    let openers = Array(openersToClosers.keys)
    let closers = Array(openersToClosers.values)
    var openersStack: [Character] = []
    
    for character in code {
        if openers.contains(character) {
            openersStack.append(character)
        } else if closers.contains(character) {
            if openersStack.isEmpty {
                return false
            } else {
                // if this closer doesn't correspond to the most recently
                // seen unclosed opener, short-circuit, returning false
                let lastUnclosedOpener = openersStack.removeLast()
                if openersToClosers[lastUnclosedOpener] != character {
                    return false
                }
            }
        }
    }
    return openersStack.isEmpty
}

isValid(code: "(({[]()}))")
isValid(code: "({()()(})")
