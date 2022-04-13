//
//  OnboardingPagesViewController.swift
//  OnboardingPagesViewController
//
//  Created by Nilesh Kumar on 13/04/22.
//

import UIKit

class OnboardingPagesViewController: UIViewController {

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
      //  stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "delorean")
      //  image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Banking is a simple, friendly and a secure banking app. You won't regret once you start using it"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20.0, weight: .medium)
        label.sizeToFit()
        label.adjustsFontForContentSizeCategory = true
      //  label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private var text: String
//    private var image: UIImage
    
    init(text: String, image: UIImage) {
        self.label.text = text
        self.image.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        stack.addSubview(image)
        stack.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stack.frame = CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: 400)
        stack.center = view.center
        image.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width - 20, height: view.bounds.size.width / 2)
        label.frame = CGRect(x: 0, y: (view.bounds.size.width / 2) + 20, width: view.bounds.size.width - 20, height: 100.0)
    }

}
