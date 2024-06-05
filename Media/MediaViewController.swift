//
//  MediaViewController.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit
import SnapKit

class MediaViewController: UIViewController {
    
    let posterImageView = UIImageView()
    
    let stackView = UIStackView()
    
    let playButton = UIButton(type: .system)
    
    let favoriteButton = UIButton(type: .system)
    
    let descriptionLabel = UILabel()
    
    let hotContentLabel = UILabel()
    
    let posterStackView = UIStackView()
    
    let firstPosterImage = UIImageView()
    
    let secondPosterImage = UIImageView()
    
    let thirdPosterImage = UIImageView()
    
    let top10Image1 = UIImageView()
    
    let top10Image2 = UIImageView()
    
    let top10Image3 = UIImageView()
    
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
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.2)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(posterImageView).offset(-20)
            make.leading.trailing.equalTo(posterImageView).inset(15)
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
            .font : UIFont.primary
        ]
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        posterImageView.image = UIImage(named: "아바타")
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        playButton.setTitle("재생", for: .normal)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .black
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 8
        
        favoriteButton.setTitle("내가 찜한 리스트", for: .normal)
        favoriteButton.setImage(UIImage(systemName: "plus"), for: .normal)
        favoriteButton.tintColor = .white
        favoriteButton.backgroundColor = .darkGray
        favoriteButton.layer.cornerRadius = 8
        
        descriptionLabel.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국작품"
        descriptionLabel.font = .tertiary
        descriptionLabel.textColor = .white
        
        hotContentLabel.text = "지금 뜨는 컨텐츠"
        hotContentLabel.font = .secondary
        hotContentLabel.textColor = .white
        
        posterStackView.axis = .horizontal
        posterStackView.distribution = .fillEqually
        posterStackView.spacing = 10
        
        firstPosterImage.contentMode = .scaleAspectFill
        firstPosterImage.layer.cornerRadius = 8
        firstPosterImage.clipsToBounds = true
        firstPosterImage.image = UIImage(named: "1")
        
        secondPosterImage.contentMode = .scaleAspectFill
        secondPosterImage.layer.cornerRadius = 8
        secondPosterImage.clipsToBounds = true
        secondPosterImage.image = UIImage(named: "2")
        
        thirdPosterImage.contentMode = .scaleAspectFill
        thirdPosterImage.layer.cornerRadius = 8
        thirdPosterImage.clipsToBounds = true
        thirdPosterImage.image = UIImage(named: "3")
        
        top10Image1.image = UIImage(named: "top10 badge")
        top10Image1.contentMode = .scaleAspectFill
        
        top10Image2.image = UIImage(named: "top10 badge")
        top10Image2.contentMode = .scaleAspectFill
        
        top10Image3.image = UIImage(named: "top10 badge")
        top10Image3.contentMode = .scaleAspectFill
    }
}
