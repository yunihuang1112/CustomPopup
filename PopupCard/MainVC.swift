//
//  MainVC.swift
//  PopupCard
//
//  Created by YUNI on 2019/7/4.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelBtnPressed(_ sender: Any) {
        let alert = PopupVC(title: nil, message: "Cancel 1qaz2wsx 3edc4rfv 5tgb6yhn 7ujm8ik, 9ol.0p;/ -['=] Cancel")
        alert.addAction(PopupAction(title: "OK", style: .default, handler: { _ in
            print("OK pressed")
        }))
        alert.addAction(PopupAction(title: "Cancel", style: .destructive, handler: { _ in
            print("Cancel pressed")
        }))
        alert.showInVC(self)
    }
    
    @IBAction func actionBtnPressed(_ sender: Any) {
        let alert = PopupVC(title: nil, message: "Action 1qaz2wsx 3edc4rfv 5tgb6yhn 7ujm8ik, 9ol.0p;/ -['=] Action Action Action Action Action")
        alert.addAction(PopupAction(title: "Action", style: .default, handler: { _ in
            print("Action pressed")
        }))
        alert.showInVC(self)
    }
    
    @IBAction func confirmBtnPressed(_ sender: Any) {
        let alert = PopupVC(title: nil, message: "Confirm 1qaz2wsx 3edc4rfv 5tgb6yhn 7ujm8ik, 9ol.0p;/ -['=] Confirm Confirm Confirm Confirm Confirm 1234567890 0987654321 qszxsddjahvbreno renrjena r nrjeainvjfa nrenavjaenvjkavna rnka ")
        alert.addAction(PopupAction(title: "Confirm", style: .default, handler: { _ in
            print("Confirm pressed")
        }))
        alert.setContainViewScale(0.8)
        alert.showInVC(self)
    }
}
