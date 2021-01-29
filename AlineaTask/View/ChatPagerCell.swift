//
//  ChatPagerCell.swift
//  AlineaTask
//
//  Created by Appernaut on 29/01/21.
//

import UIKit

class ChatPagerCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    private let viewController = ChatViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let item = viewController.view!
        addSubview(item)
        
        item.translatesAutoresizingMaskIntoConstraints = false
        item.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        item.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        item.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        item.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
