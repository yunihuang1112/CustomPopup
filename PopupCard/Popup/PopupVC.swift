//
//  PopupVC.swift
//  PopupCard
//
//  Created by YUNI on 2019/7/4.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var labelScrollView: UIScrollView!
    @IBOutlet weak var mainLabel: UILabel!

    fileprivate let btnSpace = 5
    fileprivate let scrollViewSpace = 20
    fileprivate let btnHeight = 50
    fileprivate var customButtons: [PopupAction] = [PopupAction]()
    fileprivate var titleStr: String?
    fileprivate var message: String?
    fileprivate var containViewScale: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = message
        self.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        drawPopupCard()
    }

    init(title: String?, message: String?) {
        super.init(nibName: "PopupVC", bundle: nil)
        
        self.titleStr = title
        self.message = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAction(_ action: PopupAction) {
        customButtons.append(action)
    }
    
    func setContainViewScale(_ scale: CGFloat) {
        containViewScale = scale
    }
    
    func showInVC(_ vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.setValue(self, forKey: "contentViewController")
        vc.present(alert, animated: true, completion: nil)
    }

    @objc func actionPressed(_ sender: UIButton) {
        guard let action = customButtons.filter({ $0.button == sender }).first else {
            return
        }
        
        self.dismiss(animated: true) {
            action.handler?(action)
        }
    }
    
    func drawPopupCard() {
        var labelHeight = mainLabel.systemLayoutSizeFitting(CGSize(width: mainLabel.frame.width, height: 9999)).height
        mainLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelHeight+=CGFloat(scrollViewSpace)
        if containViewScale == 0.0 {
            labelScrollView.isScrollEnabled = false
        } else {
            labelScrollView.isScrollEnabled = true
            labelHeight = labelHeight * containViewScale
        }
        
        labelScrollView.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        customView.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true

        buttonView.topAnchor.constraint(equalTo: customView.bottomAnchor)
        for subview in buttonView!.subviews {
            subview.removeFromSuperview()
        }
        
        let btnWidth = buttonView.frame.width - CGFloat(scrollViewSpace)
        var btnsTotalHeight = 0
        var btnPositionY = btnSpace
        for button in customButtons {
            let btn = button.button
            if button.style == .destructive {
                btn.setTitleColor(.red, for: .normal)
            } else {
                btn.setTitleColor(.white, for: .normal)
            }
            btn.layer.cornerRadius = 5.0
            btn.backgroundColor = UIColor(red: 120.0/255.0, green: 140.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            btn.frame = CGRect(x: scrollViewSpace/2, y: btnPositionY, width: Int(btnWidth), height: btnHeight)
            btn.addTarget(self, action: #selector(actionPressed), for: .touchUpInside)
            buttonView.addSubview(btn)

            btnPositionY+=btnHeight + btnSpace
            btnsTotalHeight+=btnHeight
        }

        btnsTotalHeight = btnsTotalHeight + btnSpace * (customButtons.count + 1)
        buttonView.heightAnchor.constraint(equalToConstant: CGFloat(btnsTotalHeight)).isActive = true
        buttonView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true

        self.view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true

        labelScrollView.layoutIfNeeded()
        customView.layoutIfNeeded()
        buttonView.layoutIfNeeded()
        self.view.layoutIfNeeded()
    }
}
