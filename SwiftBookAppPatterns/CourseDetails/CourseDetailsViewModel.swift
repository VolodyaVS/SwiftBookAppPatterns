//
//  CourseDetailsViewModel.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 10.01.2021.
//
import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get }
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
    
    init(course: Course)
    
    func setFavoriteStatus()
    func changeFavoriteStatus()
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    
    // MARK: - Public Properties
    var courseName: String {
        course.name ?? ""
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons ?? 0)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests ?? 0)"
    }
    
    var imageData: Data? {
        ImageManager.shared.getImageData(from: course.imageUrl)
    }
    
    var isFavorite: Bool {
        didSet {
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    // MARK: - Private Properties
    private let course: Course
    
    // MARK: - Initializers
    required init(course: Course) {
        self.course = course
        isFavorite = false
    }
    
    // MARK: - Public Methods
    func setFavoriteStatus() {
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
    }
    
    func changeFavoriteStatus() {
        isFavorite.toggle()
        DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: isFavorite)
    }
    
}
