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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        return viewModel.colleges.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeTableViewCell", for: indexPath)
                as? CollegeTableViewCell else {
            fatalError("Cell not exists")
        }
        
        cell.viewModel = viewModel.colleges[indexPath.row]

        return cell
    }
}

// MARK: - TableView Delegate
extension CollegeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "CollegeDetailsViewController") as? CollegeDetailsViewController else { return }
        vc.viewModel.college = viewModel.colleges[indexPath.row]
        self.present(vc, animated: true)
    }
}



