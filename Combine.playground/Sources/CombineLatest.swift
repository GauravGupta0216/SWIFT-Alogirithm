//
//  CombineLatest.swift
//  
//
//  Created by Gaurav Kumar on 23/11/24.
//

import Combine

// CombineLatest Operator
/*
 
 The combineLatest operator in Swift's Combine framework is a powerful tool for combining multiple publishers into a single publisher.
 It emits a new value whenever any of the input publishers emits a new value, combining the latest values from each publisher into a tuple.
 
*/

public class CombineLatest {
    var anyCancellable = Set<AnyCancellable>()
    public init() {}
    
    public func perform() {
        let publisher1 = PassthroughSubject<Int, Never>()
        let publisher2 = PassthroughSubject<String, Never>()

        let combinedPublisher = Publishers.CombineLatest(publisher1, publisher2)
        combinedPublisher
            .sink(receiveValue: {value in
                print("combinedPublisher: \(value)")
            })
            .store(in: &anyCancellable)

        print("running combineLatest...")
        publisher1.send(1)
        publisher2.send("Hello")
        publisher1.send(2)
        publisher2.send("World")
    }
}
