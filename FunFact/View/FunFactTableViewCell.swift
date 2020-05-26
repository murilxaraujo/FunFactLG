//
//  FunFactTableViewCell.swift
//  FunFact
//
//  Created by Murilo Araujo on 26/05/20.
//  Copyright © 2020 LG Sistemas SA. All rights reserved.
//

import UIKit

class FunFactTableViewCell: UITableViewCell {

    public static let id:String = "adfasfasfas"
    
    var funFact: TipoFunFact?
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LG"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        addSubview(label)
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    public func setupView(_ funfact: TipoFunFact) {
        label.text = funfact.rawValue
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
