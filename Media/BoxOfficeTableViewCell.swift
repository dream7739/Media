//
//  BoxOfficeTableViewCell.swift
//  Media
//
//  Created by 홍정민 on 6/5/24.
//

import UIKit
import SnapKit

class BoxOfficeTableViewCell: UITableViewCell {

    let rankLabel = UILabel()
    
    let nameLabel = UILabel()
    
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy(){
        contentView.addSubview(rankLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
    }
    
    func configureLayout(){
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(40)
            make.height.equalTo(25)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rankLabel)
            make.leading.equalTo(rankLabel.snp.trailing).offset(15)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configureUI(){
        contentView.backgroundColor = .black
        
        rankLabel.backgroundColor = .white
        rankLabel.textAlignment = .center
        rankLabel.font = .primary
        
        nameLabel.textColor = .white
        nameLabel.font = .primary
        
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
        dateLabel.font = .tertiary
    }
    

}
