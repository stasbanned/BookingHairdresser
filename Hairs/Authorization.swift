//
//  Authorization.swift
//  Hairs
//
//  Created by Станислав Тищенко on 30.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

protocol AuthorizationProtocol {
    func getSegmentControlValue() -> Int
    func getLoginText() -> String
    func getPasswordText() -> String
    func changeColorOfPasswodField()
}

class Authorization {
    var delegate: AuthorizationProtocol?
    init(delegate: AuthorizationProtocol) {
        self.delegate = delegate
    }
    func authNewUserOrMaster(performSegue: (String, Any?) -> (), withIdentifierforUser: String,
                             withIdentifierforMaster: String, sender: Any?) {
        var user: [User]? = nil
        var master: [Master]? = nil
        var event: [Event]? = nil
        user = User.fetchObject()
        master = Master.fetchObject()
        event = Event.fetchObject()
        if delegate?.getSegmentControlValue() == 0 {
            for i in user! {
                if i.login == delegate?.getLoginText() && i.password == delegate?.getPasswordText() {
                    print("Login successful as user")
                    Event.saveObject(date: nil, userName: i, masterName: nil)
                    event = Event.fetchObject()
                    performSegue(withIdentifierforUser, sender)
                }
            }
        } else {
            for i in master! {
                if i.login == delegate?.getLoginText() && i.password == delegate?.getPasswordText() {
                    print("Login successful as master")
                    performSegue(withIdentifierforMaster, sender)
                }
            }
        }
        delegate?.changeColorOfPasswodField()
    }
}
