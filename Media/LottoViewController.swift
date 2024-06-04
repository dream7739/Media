//
//  LottoViewController.swift
//  NetworkBasic
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit

import Alamofire
import SnapKit

struct Lotto : Decodable {
    let totSellamnt: Int
    let drwNoDate: String
    let firstWinamnt: Int
    let firstPrzwnerCo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class LottoViewController: UIViewController {
    
    let drwNoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "로또 회차를 입력해주세요"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let confirmButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.tintColor = .black
        return button
    }()
    
    let drwNoLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨 정보"
        label.font = .secondary
        label.textColor = .darkGray
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let drwtNo1Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    let drwtNo2Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true     
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    let drwtNo3Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .systemMint
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    let drwtNo4Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .systemMint
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    let drwtNo5Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    let drwtNo6Label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    let bonusNoLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 23
        label.clipsToBounds = true
        label.backgroundColor = .brown
        label.textAlignment = .center
        label.textColor = .white

        return label
    }()
    
    final let latestDrwNo = 1122
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        getLottoNumber(latestDrwNo)
        
    }
    
    func configureHierarchy(){
        view.addSubview(drwNoTextField)
        view.addSubview(confirmButton)
        view.addSubview(drwNoLabel)
        
        view.addSubview(stackView)
       
        stackView.addArrangedSubview(drwtNo1Label)
        stackView.addArrangedSubview(drwtNo2Label)
        stackView.addArrangedSubview(drwtNo3Label)
        stackView.addArrangedSubview(drwtNo4Label)
        stackView.addArrangedSubview(drwtNo5Label)
        stackView.addArrangedSubview(drwtNo6Label)
        stackView.addArrangedSubview(bonusNoLabel)
        
        

    }
    
    func configureLayout(){
        drwNoTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(drwNoTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(drwNoTextField)
        }
        
        drwNoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(confirmButton)
            make.top.equalTo(confirmButton.snp.bottom).offset(15)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(drwNoLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(drwNoLabel)
            make.height.equalTo(46)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .white
        confirmButton.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
    }
    
    @objc func confirmButtonClicked(){
        guard let lottoNo = drwNoTextField.text, let convertedNo = Int(lottoNo), convertedNo < latestDrwNo else {
            return
        }
        
        getLottoNumber(convertedNo)
    }
    
    func getLottoNumber(_ drawNo: Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drawNo)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.drwNoLabel.text = "1등 당첨자 수 : \(value.firstPrzwnerCo)명, 1등 상금 : \(value.firstWinamnt.formatted(.number))원"
                self.drwtNo1Label.text = "\(value.drwtNo1)"
                self.drwtNo2Label.text = "\(value.drwtNo2)"
                self.drwtNo3Label.text = "\(value.drwtNo3)"
                self.drwtNo4Label.text = "\(value.drwtNo4)"
                self.drwtNo5Label.text = "\(value.drwtNo5)"
                self.drwtNo6Label.text = "\(value.drwtNo6)"
                self.bonusNoLabel.text = "\(value.bnusNo)"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
