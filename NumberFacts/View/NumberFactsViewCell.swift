//
//  NumberFactsViewCell.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 22.11.2022.
//

import UIKit

class NumberFactsViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!

    @IBOutlet weak var fact: UILabel!


    // MARK: Override Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setOptionsForOneTableCell()
        self.setConstraintsForOneTableCell()
    }

    // MARK: Private Methods

    private func setOptionsForOneTableCell() {
        number.backgroundColor = Colors.colorSys2
        number.numberOfLines = 0
        number.adjustsFontSizeToFitWidth = true
        fact.backgroundColor = Colors.colorSys2
        fact.numberOfLines = 0
        fact.adjustsFontSizeToFitWidth = true
    }
    
    private func setConstraintsForOneTableCell() {
        number.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .bottom(pin.safeArea)
            .width(100)
            .margin(4)
        
        fact.pin
            .after(of: number)
            .top(pin.safeArea)
            .bottom(pin.safeArea)
            .margin(4)

    }
}
