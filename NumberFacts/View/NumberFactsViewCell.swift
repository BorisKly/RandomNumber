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

    private func setOptionsForOneTableCell() {
        number.backgroundColor = Colors.colorCellBackground
        number.numberOfLines = 0
        number.adjustsFontSizeToFitWidth = true
        fact.backgroundColor = Colors.colorCollectionBackground
        fact.numberOfLines = 0
    }

    private func setConstraintsForOneTableCell() {
       number.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .width(100)
            .margin(2)

        fact.pin
            .top()
            .after(of: number)
            .margin(2)


}
    
}
