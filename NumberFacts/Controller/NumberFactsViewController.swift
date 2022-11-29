//
//  NumberFactsViewController.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit

protocol NumberFactsViewControllerDelegate: AnyObject {
    func reload()
}


class NumberFactsViewController: UIViewController {

        //public var eventHandler: ((JumpToScreensFromFirst) -> Void)?

    public var model: NumberFactsModel = NumberFactsModel()

        private var mainView: NumberFactsView? {
            return self.view as? NumberFactsView
        }

        public static func startVC() -> Self {
            return Self.init()
        }

        override func loadView() {
            let codeView = NumberFactsView(frame: CGRect.zero)
            self.view = codeView
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            mainView?.backgroundColor = UIColor.systemGreen
            mainView?.myTableView.delegate = self
            mainView?.myTableView.dataSource = self
            mainView?.setupUI()
            mainView?.numberTextField.delegate = self
            mainView?.delegate = self

        }
    }


extension NumberFactsViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowedCharacters = "0123456789"
        let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharactersSet = CharacterSet(charactersIn: string)

        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
}

extension NumberFactsViewController: NumberFactsViewControllerDelegate {
    func reload() {
        guard let number = self.mainView?.numberTextField.text else { return }
        model.setNumberFactsModel(data: number) { [weak self] in
            self?.mainView?.myTableView.reloadData()
        }
    }
}

