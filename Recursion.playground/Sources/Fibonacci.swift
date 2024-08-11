import Foundation

import Foundation

public func getFib(_ position: Int) -> Int {
    if position <= 1 {
        return position
    }
    return getFib(position - 1) + getFib(position - 2)
}
