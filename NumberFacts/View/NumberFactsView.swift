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

    // MARK: Public Properties

    weak public var delegate: NumberFactsViewControllerDelegate?

    public var numberTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = Colors.background1
        text.layer.cornerRadius = CGFloat(CornerRadius.forTextFields)
        text.textColor = Colors.colorText1
        text.textAlignment = .center
        text.clearButtonMode = .always
        text.returnKeyType = .done
        text.placeholder = "Enter Number You Like"
        text.font = Font.forTextFields
        return text
    }()

    public let myTableView: UITableView = {
        let table = UITableView()
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        table.backgroundColor = Colors.colorSys
        return table
    }()

    // MARK: Private Properties

    private let firstBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.color1
        btn.setTitleColor(Colors.color5, for: .normal)
        btn.setTitle("Get fact about entered number", for: .normal)
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
        btn.addTarget(self, action: #selector(getRandomNumberFactTapped), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    // MARK: Override Methods

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

    // MARK: Public Methods

    public func setupUI() {
        createTable()
    }

    // MARK: Private Methods

    @objc private func getFactTapped() {
        self.delegate?.reloadTableForNumber()
    }

    @objc private func getRandomNumberFactTapped() {
        self.delegate?.reloadTableForRandomNumber()
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



