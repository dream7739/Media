//
//  BoxOfficeViewController.swift
//  Media
//
//  Created by 홍정민 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class BoxOfficeViewController: UIViewController {
    
    let dateTextField = UITextField()
    let searchButton = UIButton(type: .system)
    let highLightLabel = UILabel()
    let movieTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
        AF.request(APIURL.boxOfficeURL).responseString { response in
            print(response)
        }
    }
    
    func configureHierarchy(){
        view.addSubview(searchButton)
        view.addSubview(dateTextField)
        view.addSubview(highLightLabel)
        view.addSubview(movieTableView)
    }
    
    func configureLayout(){
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(searchButton.snp.leading).offset(-20)
            make.height.equalTo(40)
        }
        
        highLightLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(2)
            make.leading.trailing.equalTo(dateTextField)
            make.height.equalTo(2)
        }
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(highLightLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI(){
        view.backgroundColor = .black
        
        searchButton.backgroundColor = .white
        searchButton.setTitle("검색", for: .normal)
        searchButton.tintColor = .black
        
        dateTextField.clearsOnBeginEditing = true
        dateTextField.tintColor = .white
        dateTextField.textAlignment = .left
        dateTextField.placeholder = "날짜를 입력해주세요"
        dateTextField.attributedPlaceholder = NSAttributedString(string: dateTextField.placeholder!, attributes: [.foregroundColor : UIColor.white])
        dateTextField.textColor = .white
        
        highLightLabel.backgroundColor = .lightGray
        
        movieTableView.backgroundColor = .black
    }
    
    func configureTableView(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.rowHeight = 50
        
        movieTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
}

extension BoxOfficeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as! BoxOfficeTableViewCell
        cell.rankLabel.text = "1"
        cell.nameLabel.text = "ghisdhiasdjflaskdflaskd"
        cell.dateLabel.text = "hi-hi-hi"
        return cell
    }
    
    
}
