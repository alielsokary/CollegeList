//
//  ViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

protocol CollegeListView: AnyObject {
    func reloadData()
    func showAlert(text: String)
}

final class CollegeListViewController: UIViewController {
    // MARK: Properties
    @IBOutlet private(set) weak var tableView: UITableView!
    
    private let presenter: CollegeListPresenter
    
    required init?(coder: NSCoder, presenter: CollegeListPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        presenter.removeNotificationObserver()
    }
}

// MARK: - Configurations
private extension CollegeListViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: CollegeTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CollegeTableViewCell.identifier)
    }
}

// MARK: - Life Cycle
extension CollegeListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
        setupTableView()
        presenter.observeDataRefreshNotification()
    }
}

// MARK: - CollegeListView
extension CollegeListViewController: CollegeListView {
    func reloadData() {
        tableView.reloadData()
    }
    
    func showAlert(text: String) {
        let alertController = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

// MARK: - TableView DataSource
extension CollegeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfColleges()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeTableViewCell", for: indexPath)
                as? CollegeTableViewCell else {
            fatalError("Cell not exists")
        }
        
        cell.viewModel = presenter.collegeViewModel(at: indexPath.row)
        
        return cell
    }
}

// MARK: - TableView Delegate
extension CollegeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCollege(at: indexPath.row)
    }
}
