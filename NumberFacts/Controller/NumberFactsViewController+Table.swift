//
//  NumberFactsViewController+Table.swift
//  RandomNumber
//
//  Created by Boris Klykavka on 22.11.2022.
//

import UIKit

extension NumberFactsViewController: UITableViewDataSource,
                                     UITableViewDelegate
                                     {
    // MARK: - Private Properties

    private var  indentifire: String { "MyCell" }

    // MARK: - UITableViewDataSourse

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.jsonArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("cellcellcell")
            let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath) as? NumberFactsViewCell
            cell?.number.backgroundColor = Colors.color3

            cell?.fact.backgroundColor = Colors.color4
            cell?.number?.text = String(model.jsonArray[indexPath.row]?.number ?? 0)
            cell?.fact.text = model.jsonArray[indexPath.row]?.text

           cell?.backgroundColor = Colors.background2
            return
                cell ?? UITableViewCell()
        }
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("uuuuuuuu")
    }



}
