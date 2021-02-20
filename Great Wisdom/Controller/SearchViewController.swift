//
//  SearchViewController.swift
//  Great Wisdom
//
//  Created by ACS on 19.02.2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    var mainData: [QuoteModel] = []
    var filteredData: [QuoteModel] = []

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        tableView.dataSource = self
        tableView.allowsSelection = false
        searchBar.delegate = self
    }
    
    
//MARK: - SearchBar functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()
        for data in mainData {
            if data.quote.lowercased().contains(searchText.lowercased()) || data.author.lowercased().contains(searchText.lowercased()){
                filteredData.append(data)
            }
        }
        tableView.reloadData()
    }
}



//MARK: - TableView
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifier_searchView_tableCellIdentifier, for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].quote
        cell.detailTextLabel?.text = filteredData[indexPath.row].author
        return cell
    }
}
