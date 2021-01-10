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
    var isFavorite: Bool { get set }
    
    init(course: Course)
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
        ImageManager.shared.getImageData(from: course.imageUrl) ?? Data()
    }
    
    var isFavorite: Bool {
        get {
            DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
        } set {
            DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
}
