//
//  NumberFactsViewController.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 21.11.2022.
//

import UIKit

protocol NumberFactsViewControllerDelegate: AnyObject {
    func reloadTableForNumber()
    func reloadTableForRandomNumber()
}

enum NumberFactsJumpTo {
    case detailNumberFactsEvent(NumberFactsData)
}

class NumberFactsViewController: UIViewController {

    // MARK: Public Properties

    public var eventHandler: ((NumberFactsJumpTo)->())?

    public var model: NumberFactsModel = NumberFactsModel()

    // MARK: Private Properties

    private var mainView: NumberFactsView? {
        return self.view as? NumberFactsView
    }

    // MARK: Override Methods

    override func loadView() {
        let codeView = NumberFactsView(frame: CGRect.zero)
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.backgroundColor = Colors.colorSys
        mainView?.myTableView.delegate = self
        mainView?.myTableView.dataSource = self
        mainView?.setupUI()
        mainView?.numberTextField.delegate = self
        mainView?.delegate = self

    }

    // MARK: Public Methods

    public static func startVC() -> Self {
        return Self.init()
    }
}

// MARK: Extensions

extension NumberFactsViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowedCharacters = "0123456789"
        let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharactersSet = CharacterSet(charactersIn: string)

        return allowedCharactersSet.isSuperset(of: typedCharactersSet)
    }
}

extension NumberFactsViewController: NumberFactsViewControllerDelegate {

    func reloadTableForNumber() {
        guard let number = self.mainView?.numberTextField.text else { return }
        model.setNumberFactsModel(data: number) { [weak self] in
            self?.mainView?.myTableView.reloadData()
        }
    }
    func reloadTableForRandomNumber() {
         let number = Int.random(in: 0..<1000)
         model.setNumberFactsModel(data: String(number)) { [weak self] in
            self?.mainView?.myTableView.reloadData()
         }
    }

//    func alertError(title: String, message: String) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let alertOk = UIAlertAction(title: "OK", style: .default)
//
//        alertController.addAction(alertOk)
//
//        present(alertController, animated: true, completion: nil)
//    }
}

