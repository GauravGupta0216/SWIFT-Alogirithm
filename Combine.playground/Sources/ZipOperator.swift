//
//  ZipOperator.swift
//  
//
//  Created by Gaurav Kumar on 23/11/24.
//


/*
 The zip operator in Swift's Combine framework is a powerful tool for synchronizing and combining multiple publishers. It works by pairing elements from each input publisher and emitting a tuple containing these paired elements.
 */

import Combine

public class ZipOperatorExample {
    var anyCancellable = Set<AnyCancellable>()
    public init() {}
    
    public func perform() {
        let publisher1 = PassthroughSubject<Int, Never>()
        let publisher2 = PassthroughSubject<String, Never>()
        
        publisher1.zip(publisher2)
            .sink{value in print(value)}
            .store(in: &anyCancellable)
        
        print("running zip operator example")
        publisher1.send(1)
        publisher2.send("Hello")
        publisher1.send(2)
        publisher2.send("World")
    }
}
