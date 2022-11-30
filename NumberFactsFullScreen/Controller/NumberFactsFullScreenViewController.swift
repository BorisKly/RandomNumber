//
//  NumberFactsFullScreenViewController.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 30.11.2022.
//

import UIKit

enum NumberFactsFullScreenJumpTo {
    case backToNumberFacts
}

class NumberFactsFullScreenViewController: UIViewController {

    // MARK: Public Properties

    public var eventHandler: ((NumberFactsFullScreenJumpTo) -> Void)?

    public var model: NumberFactsFullScreenModel?

    // MARK: Private Properties

    private var mainView: NumberFactsFullScreenView? {
        return self.view as? NumberFactsFullScreenView
    }

    // MARK: Override Methods

    override func loadView() {
        let codeView = NumberFactsFullScreenView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.colorSys
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureDone))
        mainView?.addGestureRecognizer(tapGesture)
        setupUI()
    }

    // MARK: Public Methods

    public static func startVC(numberData: NumberFactsData) -> Self {
        let controller = Self.init()
        controller.model = NumberFactsFullScreenModel(number: numberData)
        return controller
    }

    // MARK: Private Methods

    private func setupUI(){
        setLabel(text: model?.number.text ?? "")
    }

    private func setLabel(text: String) {
        mainView?.detailViewTitle.text =  text
    }
    
    @objc private func tapGestureDone() {
        eventHandler?(.backToNumberFacts)
    }
}
