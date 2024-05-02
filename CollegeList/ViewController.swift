//
//  ViewController.swift
//  CollegeList
//
//  Created by Ali Elsokary on 03/05/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = ProductServiceImpl()
        
        service.getCollegeList { result in
            switch result {
            case .success(let collegeList):
                collegeList.map { c in
                    print(c.name)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }


}

