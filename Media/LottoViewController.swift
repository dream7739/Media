//
//  LottoViewController.swift
//  NetworkBasic
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit

import Alamofire
import SnapKit



class LottoViewController: UIViewController {
    
    let drwNoTextField = UITextField()
    
    let announceLabel = UILabel()
    
    let drawDateLabel = UILabel()
    
    let lineLabel = UILabel()
    
    let resultLabel = UILabel()
    
    let stackView = UIStackView()
    
    let drwtNo1Label = UILabel()
    
    let drwtNo2Label = UILabel()
    
    let drwtNo3Label = UILabel()
    
    let drwtNo4Label = UILabel()
    
    let drwtNo5Label = UILabel()
    
    let drwtNo6Label = UILabel()
    
    let plusLabel = UILabel()
    
    let bonusNoLabel = UILabel()
    
    let bonusDescriptionLabel = UILabel()
    
    let picker = UIPickerView()
    
    var drwNo: Int = 0 {
        didSet{
            drwNoTextField.text = "\(drwNo)"
            
            let labelText = "\(drwNo)회 당첨결과"
            let attributedString = NSMutableAttributedString(string: labelText)
            let range = NSRange(0...labelText.split(separator: " ")[0].count-1)

            attributedString.addAttributes([.foregroundColor : UIColor.systemOrange,
                                            .font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
                                           , range: range)
            
            resultLabel.attributedText = attributedString

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configurePickerView()

        drwNo = Lotto.latestDrwNo

        callLotto(drwNo)
        
    }
    
    func configureHierarchy(){
        view.addSubview(drwNoTextField)
        view.addSubview(announceLabel)
        view.addSubview(drawDateLabel)
        view.addSubview(lineLabel)
        view.addSubview(resultLabel)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(drwtNo1Label)
        stackView.addArrangedSubview(drwtNo2Label)
        stackView.addArrangedSubview(drwtNo3Label)
        stackView.addArrangedSubview(drwtNo4Label)
        stackView.addArrangedSubview(drwtNo5Label)
        stackView.addArrangedSubview(drwtNo6Label)
        stackView.addArrangedSubview(plusLabel)
        stackView.addArrangedSubview(bonusNoLabel)
        
        view.addSubview(bonusDescriptionLabel)
        
    }
    
    func configureLayout(){
        drwNoTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        announceLabel.snp.makeConstraints { make in
            make.top.equalTo(drwNoTextField.snp.bottom).offset(20)
            make.leading.equalTo(drwNoTextField)
        }
        
        drawDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(announceLabel)
            make.trailing.equalTo(drwNoTextField)
        }
        
        lineLabel.snp.makeConstraints { make in
            make.top.equalTo(announceLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(drwNoTextField)
            make.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(lineLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(drwNoTextField)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(drwNoTextField)
            make.height.equalTo(40)
        }
        
        bonusDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.trailing.equalTo(stackView)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .white
        
        drwNoTextField.placeholder = "로또 회차를 입력해주세요"
        drwNoTextField.layer.borderColor = UIColor.lightGray.cgColor
        drwNoTextField.layer.cornerRadius = 5
        drwNoTextField.layer.borderWidth = 1.3
        drwNoTextField.textAlignment = .center
        drwNoTextField.tintColor = .clear
        drwNoTextField.inputView = picker

        announceLabel.text = "당첨번호 안내"
        announceLabel.font = .secondary
        announceLabel.textAlignment = .left
        
        drawDateLabel.font = .tertiary
        drawDateLabel.textColor = .lightGray
        drawDateLabel.textAlignment = .right
        
        lineLabel.backgroundColor = .lightGray
        
        resultLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        resultLabel.textAlignment = .center
        
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        
        drwtNo1Label.layer.cornerRadius = 20
        drwtNo1Label.clipsToBounds = true
        drwtNo1Label.backgroundColor = .orange
        drwtNo1Label.textAlignment = .center
        drwtNo1Label.textColor = .white
        drwtNo1Label.font = .boldSystemFont(ofSize: 20)
        
        drwtNo2Label.layer.cornerRadius = 20
        drwtNo2Label.clipsToBounds = true
        drwtNo2Label.backgroundColor = .orange
        drwtNo2Label.textAlignment = .center
        drwtNo2Label.textColor = .white
        drwtNo2Label.font = .boldSystemFont(ofSize: 20)
        
        drwtNo3Label.layer.cornerRadius = 20
        drwtNo3Label.clipsToBounds = true
        drwtNo3Label.backgroundColor = .systemMint
        drwtNo3Label.textAlignment = .center
        drwtNo3Label.textColor = .white
        drwtNo3Label.font = .boldSystemFont(ofSize: 20)
        
        drwtNo4Label.layer.cornerRadius = 20
        drwtNo4Label.clipsToBounds = true
        drwtNo4Label.backgroundColor = .systemMint
        drwtNo4Label.textAlignment = .center
        drwtNo4Label.textColor = .white
        drwtNo4Label.font = .boldSystemFont(ofSize: 20)
        
        drwtNo5Label.layer.cornerRadius = 20
        drwtNo5Label.clipsToBounds = true
        drwtNo5Label.backgroundColor = .lightGray
        drwtNo5Label.textAlignment = .center
        drwtNo5Label.textColor = .white
        drwtNo5Label.font = .boldSystemFont(ofSize: 20)
        
        drwtNo6Label.layer.cornerRadius = 20
        drwtNo6Label.clipsToBounds = true
        drwtNo6Label.backgroundColor = .lightGray
        drwtNo6Label.textAlignment = .center
        drwtNo6Label.textColor = .white
        drwtNo6Label.font = .boldSystemFont(ofSize: 20)
        
        plusLabel.font = .boldSystemFont(ofSize: 20)
        plusLabel.text = "+"
        plusLabel.textAlignment = .center

        bonusNoLabel.layer.cornerRadius = 20
        bonusNoLabel.clipsToBounds = true
        bonusNoLabel.backgroundColor = .systemPink
        bonusNoLabel.textAlignment = .center
        bonusNoLabel.textColor = .white
        bonusNoLabel.font = .boldSystemFont(ofSize: 20)
        
        bonusDescriptionLabel.font = .tertiary
        bonusDescriptionLabel.textColor = .lightGray
        bonusDescriptionLabel.textAlignment = .center
        bonusDescriptionLabel.text = "보너스"
    }
    
    func configurePickerView(){
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonClicked))
        toolBar.setItems([space, button], animated: true)
        
        drwNoTextField.inputAccessoryView = toolBar
    }
    
    @objc func completeButtonClicked(){
        self.view.endEditing(true)
    }
    
    func callLotto(_ drawNo: Int){
        let url = "\(APIURL.lottoURL)\(drawNo)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.drwtNo1Label.text = "\(value.drwtNo1)"
                self.drwtNo2Label.text = "\(value.drwtNo2)"
                self.drwtNo3Label.text = "\(value.drwtNo3)"
                self.drwtNo4Label.text = "\(value.drwtNo4)"
                self.drwtNo5Label.text = "\(value.drwtNo5)"
                self.drwtNo6Label.text = "\(value.drwtNo6)"
                self.bonusNoLabel.text = "\(value.bnusNo)"
                self.drawDateLabel.text = "\(value.drwNoDate) 추첨"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension LottoViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Lotto.latestDrwNo
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Lotto.latestDrwNo - row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drwNo = Lotto.latestDrwNo - row
        callLotto(drwNo)
    }


}
