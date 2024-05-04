//
//  CollegeDetailsViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit
import CollegeListCore

protocol CollegeDetailsView: AnyObject {
    func displayData(viewModel: CollegeViewModel)
}

final class CollegeDetailsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet private(set) weak var collegeNameLabel: UILabel!
    @IBOutlet private(set) weak var collegeStateLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryCodeLabel: UILabel!
    @IBOutlet private(set) weak var collegeWebPageLabel: UILabel!
    
    private let presenter: CollegeDetailsPresenter
    
    required init?(coder: NSCoder, presenter: CollegeDetailsPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Life Cycle
extension CollegeDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
    }
}

// MARK: - Configurations
extension CollegeDetailsViewController: CollegeDetailsView {
    func displayData(viewModel: CollegeViewModel) {
        collegeNameLabel.text = viewModel.name
        collegeStateLabel.text = viewModel.state
        collegeCountryLabel.text = viewModel.country
        collegeCountryCodeLabel.text = viewModel.countryCode
        collegeWebPageLabel.text = viewModel.webPage
    }
}


// MARK: - Actions
extension CollegeDetailsViewController {
    @IBAction func refreshButton(_ sender: UIButton) {
        self.dismiss(animated: true)
        presenter.startDataRefresh()
    }
}
