//
//  CollegeDetailsViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

class CollegeDetailsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet private(set) weak var collegeNameLabel: UILabel!
    @IBOutlet private(set) weak var collegeStateLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryCodeLabel: UILabel!
    @IBOutlet private(set) weak var collegeWebPageLabel: UILabel!

    var interactor = CollegeDetailsInteractor()
    
}

// MARK: - Life Cycle
extension CollegeDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - Configurations
private extension CollegeDetailsViewController {
    func configureUI() {
        collegeNameLabel.text = interactor.college.name
        collegeStateLabel.text = interactor.college.state
        collegeCountryLabel.text = interactor.college.country
        collegeCountryCodeLabel.text = interactor.college.countryCode
        collegeWebPageLabel.text = interactor.college.webPage
    }
}


// MARK: - Actions
extension CollegeDetailsViewController {
    @IBAction func refreshButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
