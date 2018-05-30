//
//  InfoAboutMasterVC.swift
//  Hairs
//
//  Created by Станислав Тищенко on 28.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class InfoAboutMasterVC: UIViewController {
    var masterName = ""
    var userName = ""
    var event: [Event]? = nil
    var master: [Master]? = nil
    var infoAboutMaster = InfoAboutMaster()
    @IBOutlet weak var nameOfMasterLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func bookingButton(_ sender: Any) {
        infoAboutMaster.getInfoAboutMaster(datePicker: datePicker, userName: userName)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfMasterLabel.text = masterName
        event = Event.fetchObject()
        master = Master.fetchObject()
    }
}
