//
//  CollegeDetailsViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

class CollegeDetailsViewController: UIViewController {
    
    @IBOutlet private(set) weak var collegeNameLabel: UILabel!
    @IBOutlet private(set) weak var collegeStateLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryCodeLabel: UILabel!
    @IBOutlet private(set) weak var collegeWebPageLabel: UILabel!

    var viewModel = CollegeDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        collegeNameLabel.text = viewModel.college.name
        collegeStateLabel.text = viewModel.college.state
        collegeCountryLabel.text = viewModel.college.country
        collegeCountryCodeLabel.text = viewModel.college.countryCode
        collegeWebPageLabel.text = viewModel.college.webPage
    }

}
