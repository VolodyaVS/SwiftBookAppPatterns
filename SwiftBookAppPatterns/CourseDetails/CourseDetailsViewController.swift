//
//  CourseDetailsViewController.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 16.12.2020.
//

import UIKit

protocol CourseDetailsViewInputProtocol: class {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayImage(with imageData: Data)
    func displayImageForFavoriteButton(with favoriteStatus: Bool)
}

protocol CourseDetailsViewOutputProtocol {
    var isFavorite: Bool { get }
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    
    // MARK: - Public Properties
    var presenter: CourseDetailsViewOutputProtocol!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.showDetails()
    }
    
    // MARK: - IBActions
    @IBAction func toggleFavorite(_ sender: UIButton) {
        presenter.favoriteButtonPressed()
    }
    
}

extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    func displayCourseName(with title: String) {
        courseNameLabel.text = title
    }
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessonsLabel.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTestsLabel.text = title
    }
    
    func displayImage(with imageData: Data) {
        let image = UIImage(data: imageData)
        courseImage.image = image
    }
    
    func displayImageForFavoriteButton(with favoriteStatus: Bool) {
        favoriteButton.tintColor = favoriteStatus ? .red : .gray
    }
}
