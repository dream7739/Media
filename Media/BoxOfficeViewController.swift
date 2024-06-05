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
    
    var list: [DailyBoxOffice] = []
    
    var date : String = ""{
        didSet {
            dateTextField.text = date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
        
        date = BoxOfficeResult.rangeDate
        callBoxOffice(date)
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
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        dateTextField.delegate = self
        
        dateTextField.tintColor = .white
        dateTextField.textAlignment = .left
        dateTextField.placeholder = "날짜를 입력해주세요"
        dateTextField.attributedPlaceholder = NSAttributedString(string: dateTextField.placeholder!, attributes: [.foregroundColor : UIColor.white])
        dateTextField.textColor = .white
        
        highLightLabel.backgroundColor = .lightGray
        
        movieTableView.backgroundColor = .black
    }
    
    @objc func searchButtonClicked(){
        if let date = dateTextField.text, !date.trimmingCharacters(in: .whitespaces).isEmpty {
            callBoxOffice(date)
        }
    }
    
    func configureTableView(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.rowHeight = 50
        movieTableView.keyboardDismissMode = .onDrag
        
        movieTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
    func callBoxOffice(_ date: String){
        let url = APIURL.boxOfficeURL + "\(date)"
        AF.request(url).responseDecodable(of: BoxOfficeResult.self) { response in
            switch response.result {
            case .success(let value):
                self.list = value.boxOfficeResult.dailyBoxOfficeList
                self.movieTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BoxOfficeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as! BoxOfficeTableViewCell
        let data = list[indexPath.row]
        cell.configureData(data)
        return cell
    }
    
    
}

extension BoxOfficeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let date = textField.text, !date.trimmingCharacters(in: .whitespaces).isEmpty {
            callBoxOffice(date)
        }
        
        return true
    }
    
}
