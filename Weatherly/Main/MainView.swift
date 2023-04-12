//
//  MainView.swift
//  Weatherly
//
//  Created by Andas on 04.04.2023.
//
import SnapKit
import UIKit

class MainView: UIView{
    
    var cityLabel: UILabel!
    var cityTemp: UILabel!
    var cityCondition: UILabel!
    var backgroundImg: UIImageView!
    var maxTemp: UILabel!
    var minTemp: UILabel!
    var scrollPage: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainView {
    func configure() {
        setViews()
        addView()
        setConstraints()
    }
    
    func setViews() {
        cityLabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Astana"
            label.textColor = .white
            label.font = .systemFont(ofSize: 35, weight: .light)
            return label
        }()
        cityTemp = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "19" + "C"
            label.textColor = .white
            label.font = .systemFont(ofSize: 65, weight: .thin)
            return label
        }()

        cityCondition = {
            let label = UILabel()
            label.layer.opacity = 0.6
            label.textColor = .white
            label.text = "Mostly Clear"
            label.font = .systemFont(ofSize: 16, weight: .semibold)
            return label
        }()
        backgroundImg = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "house-winter")
            return imageView
        }()
        maxTemp = {
            let label = UILabel()
            label.text = "H:" + "19" + "C"
            label.textColor = .white
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            return label
        }()
        minTemp = {
            let label = UILabel()
            label.text = "L:" + "19" + "C"
            label.textColor = .white
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            return label
        }()
        scrollPage = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.alwaysBounceVertical = true
            scrollView.showsVerticalScrollIndicator = true
            return scrollView
        }()
    }
    
    func addView(){
        self.addSubview(backgroundImg)
        self.addSubview(scrollPage)
        scrollPage.addSubview(cityLabel)
        scrollPage.addSubview(cityTemp)
        scrollPage.addSubview(cityCondition)
        scrollPage.addSubview(maxTemp)
        scrollPage.addSubview(minTemp)
    }
    
    func setConstraints() {
        backgroundImg.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollPage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
        
        cityTemp.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cityLabel.snp.bottom).offset(2)
        }
        
        cityCondition.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cityTemp.snp.bottom).offset(2)
        }
        
        maxTemp.snp.makeConstraints {
            $0.top.equalTo(cityCondition.snp.bottom)
            $0.left.equalTo(cityCondition.snp.left)
        }
        minTemp.snp.makeConstraints {
            $0.top.equalTo(cityCondition.snp.bottom)
            $0.right.equalTo(cityCondition.snp.right)
        }
    }
}
