//
//  PopupAction.swift
//  PopupCard
//
//  Created by YUNI on 2019/7/4.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

public enum PopupActionStyle {
    case `default`
    case ok
    case cancel
    case destructive
}

class PopupAction {
    var titleStr: String?
    var style: PopupActionStyle?
    var handler: ((PopupAction) -> Void)?
    let button: UIButton = UIButton()

    init(title: String?, style: PopupActionStyle, handler: ((PopupAction) -> Void)?) {
        self.titleStr = title
        self.style = style
        self.handler = handler
        
        button.setTitle(self.titleStr, for: .normal)
        button.contentHorizontalAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
