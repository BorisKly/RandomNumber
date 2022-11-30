//
//  NumberFactsFullScreenView.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 30.11.2022.
//

import UIKit
import PinLayout

class NumberFactsFullScreenView: UIView {
    
    // MARK: Public properties
    
    public let detailViewTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = Font.forTextFields
        lbl.backgroundColor = Colors.colorSys
        lbl.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        return lbl
    }()
    
    // MARK: Init and Deinit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(detailViewTitle)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 20
        setConstraints(pad: padding)
    }
    
    // MARK: Private Methods
    
    private func setConstraints(pad: CGFloat) {
        detailViewTitle.pin
            .all(pad)
    }
}

