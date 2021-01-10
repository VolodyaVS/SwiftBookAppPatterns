//
//  CourseListViewModel.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 10.01.2021.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol?
    func viewModelForSelectRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol?
}

class CourseListViewModel: CourseListViewModelProtocol {
    
    var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }

    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseTableViewCellViewModel(course: course)
    }
    
    func viewModelForSelectRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
