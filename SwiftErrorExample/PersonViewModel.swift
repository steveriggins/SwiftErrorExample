//
//  PersonViewModel.swift
//  SwiftErrorExample
//
//  This is a blatant copy of @NatashaTheRobot's code from http://natashatherobot.com/swift-2-error-handling/
//
//  I learn by doing so I have coded this example by hand, and have been working on improvements. That is why it is not a fork.
//
//  Many thanks to @NatashaTheRobot!!

import Foundation

struct PersonViewModel {
    var name: String?
    var age: String?
    
    enum InputError : ErrorType {
        case MissingInformation
        case IncorrectAge(String)
    }
    
    func createPerson() throws -> Person {
        // I updated this code from Natasha's original to make sure neither name nor age can be an empty string
        // This taught me about Swift filtering
        guard let name = name where name != "", let age = age where age != "" else {
            throw InputError.MissingInformation
        }
        
        guard let ageFormatted = Int(age) else {
            throw InputError.IncorrectAge(age)
        }
        
        return Person(name: name, age: ageFormatted)
    }
}