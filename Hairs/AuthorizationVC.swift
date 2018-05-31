//
//  AuthorizationVC.swift
//  Hairs
//
//  Created by Станислав Тищенко on 27.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit
import QuartzCore

class AuthorizationVC: UIViewController, AuthorizationProtocol {
    var user: [User]? = nil
    var master: [Master]? = nil
    var event: [Event]? = nil
    var isShowNavigationBar = true
    lazy var authorization = Authorization(delegate: self)
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userOrMasterControl: UISegmentedControl!
    @IBAction func logInButton(_ sender: Any) {
        authorization.authNewUserOrMaster(performSegue: performSegue(withIdentifier:sender:),
                                          withIdentifierforUser: "toListOfMasters",
                                          withIdentifierforMaster: "toListOfUsers", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        user = User.fetchObject()
        master = Master.fetchObject()
        event = Event.fetchObject()
        passwordText.isSecureTextEntry = true

        if isShowNavigationBar {
            self.navigationController?.isNavigationBarHidden = false
        } else {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toListOfMasters" {
            let destination = segue.destination as! ListOfMasterTableVC
            if userOrMasterControl.selectedSegmentIndex == 0 {
                for i in user! {
                    if i.login == loginText.text && i.password == passwordText.text {
                        destination.userName = i.name!
                    }
                }
            }
        }
        if segue.identifier == "toListOfUsers" {
            let destination = segue.destination as! ListOfUsersTableVC
            if userOrMasterControl.selectedSegmentIndex == 1 {
                for i in master! {
                    if i.login == loginText.text && i.password == passwordText.text {
                        destination.masterName = i.name!
                    }
                }
            }
        }
    }
    func getSegmentControlValue() -> Int {
        if userOrMasterControl.selectedSegmentIndex == 0 {
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
    func changeColorOfPasswodField() {
        if passwordText.text == "" {
            passwordText.layer.borderWidth = 1.0
            passwordText.layer.borderColor = UIColor.red.cgColor
        } else {
            passwordText.layer.borderWidth = 0
            passwordText.layer.borderColor = nil
        }
    }
}
