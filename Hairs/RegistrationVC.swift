//
//  RegistrationVC.swift
//  Hairs
//
//  Created by Станислав Тищенко on 27.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, RegistrationProtocol {
    var user: [User]? = nil
    var master: [Master]? = nil
    lazy var registration = Registration(delegate: self)
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var userOrMasterController: UISegmentedControl!
    @IBAction func signUpButton(_ sender: Any) {
        registration.regNewUserOrMaster(performSegue: performSegue(withIdentifier:sender:),
                                        withIdentifier: "toAuthorization", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        user = User.fetchObject()
        master = Master.fetchObject()
    }
    func getSegmentControlValue() -> Int {
        if userOrMasterController.selectedSegmentIndex == 0 {
            return 0
        }
        return 1
    }
    func getLoginText() -> String {
        return loginText.text!
    }
    func getPasswordText() -> String {
        return passwordText.text!
    }
    func getConfirmText() -> String {
        return confirmText.text!
    }
    func getNameText() -> String {
        return nameText.text!
    }
}
