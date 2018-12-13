//
//  ViewController.swift
//  Tic
//
//  Created by Mark Meretzky on 12/12/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//
//  Lab - Collections.playground, page 2: array of arrays of Strings.
//

import UIKit

class ViewController: UIViewController {
    
    //An array of arrays of String.  Could change String to Character.

    let rows: [[String]] = [
        ["X", " ", " "],
        [" ", "O", "O"],
        [" ", " ", "X"]
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view, typically from a nib.
        
        print("rows.count = \(rows.count)");             //3 because rows contains 3 rows.
        print("rows[0].count = \(rows[0].count)");       //3 because top row contains 3 Strings.
        print("rows[0][0].count = \(rows[0][0].count)"); //1 because 1st String in top row is 1 char.
        
        let verticalStackView: UIStackView = UIStackView(); //will contain 3 horizontal stack views
        verticalStackView.axis = .vertical;
        verticalStackView.distribution = .fillEqually;
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        for row in rows {
            let horizontalStackView: UIStackView = UIStackView();
            horizontalStackView.axis = .horizontal;
            horizontalStackView.distribution = .fillEqually;
            verticalStackView.addArrangedSubview(horizontalStackView);
            
            for character in row {
                let label: UILabel = UILabel();
                label.backgroundColor = .yellow;
                label.textAlignment = .center;
                label.font = .systemFont(ofSize: 36);
                label.text = character;
                label.layer.borderWidth = 0.25;
                let heightConstraint: NSLayoutConstraint = label.heightAnchor.constraint(equalToConstant: 100);
                heightConstraint.isActive = true;
                let widthConstraint: NSLayoutConstraint = label.widthAnchor.constraint(equalToConstant: 100);
                widthConstraint.isActive = true;
                horizontalStackView.addArrangedSubview(label);
            }
        }
        
        //Center the verticalStackView in the big, white view.
        
        view.addSubview(verticalStackView);

        let horizontalConstraint: NSLayoutConstraint = verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor);
        horizontalConstraint.isActive = true;
        
        let verticalConstraint: NSLayoutConstraint = verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor);
        verticalConstraint.isActive = true;
    }

}

