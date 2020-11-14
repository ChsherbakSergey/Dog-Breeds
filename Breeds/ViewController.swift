//
//  ViewController.swift
//  Breeds
//
//  Created by Sergey on 11/11/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import SafariServices
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var breedsButtonOutlet: UIButton!
    @IBOutlet weak var articlesButtonOutlet: UIButton!
    @IBOutlet weak var whatIsYourBreedButtonOutlet: UIButton!
    @IBOutlet weak var trainingsForYourDogButtonOutlet: UIButton!
    @IBOutlet weak var helpButtonOutlet: UIButton!
    
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var viewWithTopFiveBreeds: UIView!
    
    private let scrollViewForTopFiveBreeds = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Back", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 18)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        //Set navigation Title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkboard SE", size: 18)!]
    }
    
    func setupView() {
        //Buttons Setup
        let buttonOutlets: [UIButton] = [breedsButtonOutlet, articlesButtonOutlet, whatIsYourBreedButtonOutlet, helpButtonOutlet]
        for i in buttonOutlets {
            i.layer.cornerRadius = 10
            i.layer.borderColor = UIColor.black.cgColor
            i.layer.borderWidth = 2
        }
        whatIsYourBreedButtonOutlet.titleLabel?.numberOfLines = 3
        trainingsForYourDogButtonOutlet.layer.cornerRadius = 10
        
        //Page Control Setup
        pageController.numberOfPages = 5
        
        pageController.currentPage = 0
        
        //setup scrollViewForTopFiveBreeds
        viewWithTopFiveBreeds.addSubview(scrollViewForTopFiveBreeds)
        scrollViewForTopFiveBreeds.frame = CGRect(x: 0, y: 0, width: viewWithTopFiveBreeds.frame.size.width, height: viewWithTopFiveBreeds.frame.size.height)
        scrollViewForTopFiveBreeds.delegate = self
        
        //setup viewWithTopFiveBreeds
        viewWithTopFiveBreeds.layer.cornerRadius = 20
//        viewWithTopFiveBreeds.layer.borderColor = UIColor.black.cgColor
//        viewWithTopFiveBreeds.layer.borderWidth = 2
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        if scrollViewForTopFiveBreeds.subviews.count == 2 {
            configureScrollView()
        }
        
    }
    
    func configureScrollView() {
        scrollViewForTopFiveBreeds.contentSize = CGSize(width: viewWithTopFiveBreeds.frame.size.width * 5, height: 500)
        scrollViewForTopFiveBreeds.showsHorizontalScrollIndicator = false
        scrollViewForTopFiveBreeds.isPagingEnabled = true

        let breedNames: [String] = ["Alaskan Malamute", "Poodle", "Bulldog", "German Shepherd Dog", "Don't know this breed"]
        let images: [UIImage] = [UIImage(named: "Alaskan-malamute")!, UIImage(named: "poodle")!, UIImage(named: "bulldog")!, UIImage(named: "german-shepherd-dog")!, UIImage(named: "don't know this breed")! ]
        
        for i in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(i) * scrollViewForTopFiveBreeds.frame.size.width , y: 0, width: scrollViewForTopFiveBreeds.frame.size.width, height: scrollViewForTopFiveBreeds.frame.size.height))
            
            let labelName = UILabel(frame: CGRect(x: page.frame.size.width / 4, y: 30, width: page.frame.size.width / 2, height: 90))
            labelName.numberOfLines = 3
            labelName.textAlignment = .center
            labelName.font = UIFont(name: "Chalkboard SE", size: 20)
            labelName.text = breedNames[i]
            
            let dogImage = UIImageView(frame: CGRect(x: 10, y: 120, width: page.frame.size.width - 20, height: page.frame.size.height - 160))
            dogImage.image = images[i]
            dogImage.contentMode = .scaleAspectFit

            scrollViewForTopFiveBreeds.addSubview(page)
            page.addSubview(labelName)
            page.addSubview(dogImage)
            scrollViewForTopFiveBreeds.addSubview(pageController)
        }
    }
    
    
    @IBAction func pageContollerIsTapped(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollViewForTopFiveBreeds.setContentOffset(CGPoint(x: CGFloat(current) * viewWithTopFiveBreeds.frame.size.width, y: 0), animated: true)
    }
    
    @IBAction func breedsButtonIsTapped(_ sender: Any) {
        
    }
    
    @IBAction func articlesButtonIsTapped(_ sender: Any) {
        showSafariVC(for: "https://www.newscientist.com/article-topic/dogs/")
    }
    
    @IBAction func whatIsYourBreedButtonIsTapped(_ sender: Any) {
        
    }
    
    @IBAction func trainingsForYourDogButtonIsTapped(_ sender: Any) {
        
    }
    
    @IBAction func helpButtonIsTapped(_ sender: Any) {
        
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(floorf(Float(scrollViewForTopFiveBreeds.contentOffset.x) / Float(scrollViewForTopFiveBreeds.frame.size.width)))
    }
}
