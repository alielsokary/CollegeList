//
//  CollegeTableViewCell.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit
import CollegeListCore

class CollegeTableViewCell: UITableViewCell {

    @IBOutlet private(set) weak var collegeNameLabel: UILabel!
    @IBOutlet private(set) weak var collegeCountryLabel: UILabel!

    var viewModel: CollegeViewModel! {
        didSet {
            collegeNameLabel.text = viewModel.name
            collegeCountryLabel.text = viewModel.country
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}
