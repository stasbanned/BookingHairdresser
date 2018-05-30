//
//  infoAboutUserVC.swift
//  Hairs
//
//  Created by Станислав Тищенко on 28.05.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class infoAboutUserVC: UIViewController {
    var masterName = ""
    var userName = ""
    var event: [Event]? = nil
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var dateOfUserLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        event = Event.fetchObject()
        for i in event! {
            if i.date != nil && i.master != nil && i.user != nil {
                if i.user?.name == userName && i.master?.name == masterName{
                    nameOfUserLabel.text = i.user?.name
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy-hh-mm"
                    let stringDate: String = dateFormatter.string(from: i.date! as Date)
                    dateOfUserLabel.text = stringDate
                }
            }
        }
    }
}
