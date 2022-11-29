//
//  NumberFactsView.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit
import Alamofire
import PinLayout

class NumberFactsView: UIView {

    weak public var delegate: NumberFactsViewControllerDelegate?

    public var numberTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = Colors.background1
        text.borderStyle =  .none
        text.layer.cornerRadius = CGFloat(CornerRadius.forTextFields)
        text.textColor = Colors.colorText1

        text.leftViewMode = .always
        text.clearButtonMode = .always
        text.returnKeyType = .done
        text.placeholder = "Enter Number You Like"
        text.font = Font.forTextFields
        //translatesAutoresizingMaskIntoConstraints = false
        return text
    }()


    private let firstBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.color1
        btn.setTitleColor(Colors.color5, for: .normal)
        btn.setTitle("Get Fact", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.addTarget(self, action: #selector(getFactTapped), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    private let secondBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.color1
        btn.setTitleColor(Colors.color5, for: .normal)
        btn.setTitle("Get fact about random number", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
       // btn.addTarget(self, action: #selector(goToThird), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    public let myTableView: UITableView = {
        let table = UITableView()
        //table.translatesAutoresizingMaskIntoConstraints = false
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        table.backgroundColor = Colors.background1
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(firstBtn)
        self.addSubview(secondBtn)
        self.addSubview(numberTextField)
        self.addSubview(myTableView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 30
        setConstraints(pad: padding)
        print("Run layoutSubviews")
    }

    public func setupUI() {
        print("regregreg")
        createTable()
    }

    @objc private func getFactTapped() {
        print("getFactTapped")
        self.delegate?.reload()
    }

    private func createTable() {
        myTableView.register(UINib(nibName: "NumberFactsViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }

    private func setConstraints(pad: CGFloat){
        numberTextField.pin
            .top(50)
            .left(pad)
            .right(pad)
            .height(80)

        firstBtn.pin
            .below(of: numberTextField)
            .marginTop(20)
            .left(pad)
            .right(pad)
            .height(of: numberTextField)

        secondBtn.pin
            .below(of: firstBtn)
            .marginTop(20)
            .left(pad)
            .right(pad)
            .height(of: numberTextField)

        myTableView.pin
            .below(of: [numberTextField,
                        firstBtn,
                        secondBtn], aligned: .left)
            .right(to: secondBtn.edge.right)
            .marginTop(20)
            .bottom(10)
    }
}



