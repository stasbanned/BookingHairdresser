//
//  Registration.swift
//  Hairs
//
//  Created by Станислав Тищенко on 30.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

protocol RegistrationProtocol {
    func getSegmentControlValue() -> Int
    func getLoginText() -> String
    func getPasswordText() -> String
    func getConfirmText() -> String
    func getNameText() -> String
}

class Registration {
    var delegate: RegistrationProtocol?
    func regNewUserOrMaster(performSegue: (String, Any?) -> (), withIdentifier: String, sender: Any?) {
        var user: [User]? = nil
        var master: [Master]? = nil
        user = User.fetchObject()
        master = Master.fetchObject()
        var invalidInput = false
        if delegate?.getSegmentControlValue() == 0 {
            if delegate?.getPasswordText() == delegate?.getConfirmText() && delegate?.getLoginText() != ""
                && delegate?.getPasswordText() != "" && delegate?.getNameText() != ""{
                for i in user! {
                    if i.login == delegate?.getLoginText() {
                        invalidInput = true
                        print("Invalid input")
                        break
                    }
                }
                if invalidInput == false {
                    User.saveObject(login: (delegate?.getLoginText())!, password: (delegate?.getPasswordText())!,
                                    name: (delegate?.getNameText())!)
                    user = User.fetchObject()
                    print("Successful registration")
                    performSegue(withIdentifier, sender)
                }
            }
        } else {
            if delegate?.getPasswordText() == delegate?.getConfirmText() && delegate?.getLoginText() != ""
                && delegate?.getPasswordText() != "" && delegate?.getNameText() != ""{
                for i in master! {
                    if i.login == delegate?.getLoginText() {
                        invalidInput = true
                        print("Invalid input")
                        break
                    }
                }
                if invalidInput == false {
                    //print((delegate?.getLoginText())!)
                    Master.saveObject(login: (delegate?.getLoginText())!, password: (delegate?.getPasswordText())!,
                                      name: (delegate?.getNameText())!)
                    master = Master.fetchObject()
                    print("Successful registration")
                    performSegue(withIdentifier, sender)
                }
            }
        }
    }
}
