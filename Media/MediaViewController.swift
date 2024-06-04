//
//  MediaViewController.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit
import SnapKit

class MediaViewController: UIViewController {
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "아바타")
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("재생", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국작품"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    let hotContentLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 뜨는 컨텐츠"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let posterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let firstPosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    let secondPosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        return imageView
    }()
    
    let thirdPosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "3")
        return imageView
    }()
    
    let top10Image1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let top10Image2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let top10Image3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    
    func configureHierarchy(){
        view.addSubview(posterImageView)
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(favoriteButton)
        
        view.addSubview(descriptionLabel)
        
        view.addSubview(hotContentLabel)
        
        view.addSubview(posterStackView)
        
        posterStackView.addArrangedSubview(firstPosterImage)
        posterStackView.addArrangedSubview(secondPosterImage)
        posterStackView.addArrangedSubview(thirdPosterImage)
        
        firstPosterImage.addSubview(top10Image1)
        secondPosterImage.addSubview(top10Image2)
        thirdPosterImage.addSubview(top10Image3)
        
        
    }
    
    func configureLayout(){
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.2)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(posterImageView).offset(-20)
            make.leading.equalTo(posterImageView).offset(15)
            make.trailing.equalTo(posterImageView).offset(-15)
        }
        
        playButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-15)
            make.centerX.equalTo(posterImageView)
        }
        
        hotContentLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView)
            make.top.equalTo(posterImageView.snp.bottom).offset(30)
        }
        
        posterStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(posterImageView)
            make.top.equalTo(hotContentLabel.snp.bottom).offset(10)
            make.height.equalTo(150)
        }
        
        top10Image1.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-2)
        }
        
        top10Image2.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-2)
        }
        
        top10Image3.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-2)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .black
        navigationItem.title = "홍정민님"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor : UIColor.white,
            .font : UIFont.boldSystemFont(ofSize: 20)
        ]
    }
}
