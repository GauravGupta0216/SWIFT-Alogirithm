//
//  Subjects.swift
//  
//
//  Created by Gaurav Kumar on 23/11/24.
//

/*
 Subjects are a special type of publisher that can both receive and emit values.
 They act as a bridge between publishers and subscribers, allowing you to control the flow of data within your Combine pipelines.
 */
import Combine

public class SubjectsExample {
    var anyCancellable = Set<AnyCancellable>()
    public init() {}
    
    public func showPassThroughSubject() {
        let subject = PassthroughSubject<Int, Never>()

        subject
            .sink { value in
                print("Received PassThroughSubject value: \(value)")
            }
            .store(in: &anyCancellable)

        print("\nShowing PassThroughSubject examples:")
        subject.send(1)
        subject.send(2)
    }

    public func showCurrentValueSubject() {
        print("\nShowing CurrentValueSubject examples:")
        let subject = CurrentValueSubject<String, Never>("Initial value")
        
        subject
            .sink { value in
                print("Received CurrentValueSubject value: \(value)")
            }
            .store(in: &anyCancellable)
        
        subject.send("New value")
    }
}
