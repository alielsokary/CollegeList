//
//  ViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

protocol CollegeListViewControllerDisplayLogic: AnyObject {
    func reloadData()
}

class CollegeListViewController: UIViewController {
    
    @IBOutlet private(set) weak var tableView: UITableView!

    lazy var viewModel: CollegeListViewModelLogic = {
        let viewModel = CollegeListViewModel()
        viewModel.delegate = self
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getCollegeList()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: CollegeTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CollegeTableViewCell.identifier)
    }

}

extension CollegeListViewController: CollegeListViewControllerDisplayLogic {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - TableView DataSource
extension CollegeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.collegeListViewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeTableViewCell", for: indexPath)
                as? CollegeTableViewCell else {
            fatalError("Cell not exists")
        }
        
        cell.viewModel = viewModel.collegeListViewModels[indexPath.row]

        return cell
    }
}



