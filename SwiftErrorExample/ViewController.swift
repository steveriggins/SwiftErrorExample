//
//  ViewController.swift
//  SwiftErrorExample
//
//  This is a blatant copy of @NatashaTheRobot's code from http://natashatherobot.com/swift-2-error-handling/
//
//  I learn by doing so I have coded this example by hand, and have been working on improvements. That is why it is not a fork.
//
//  Many thanks to @NatashaTheRobot!!

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var ageField: UITextField!
    
    var personViewModel = PersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        personViewModel.name = nameField.text
        personViewModel.age = ageField.text
    }

    @IBAction func submit() {
        view.endEditing(true)
        
        do {
            let person = try personViewModel.createPerson()
            print("Successfully made \(person)")
        } catch PersonViewModel.InputError.MissingInformation {
            print("Your name or age is missing")
        } catch PersonViewModel.InputError.IncorrectAge {
            print("\(ageField.text) is not a valid age")
        } catch {
            print("Ok, I don't know what happened")
        }
    }
}

