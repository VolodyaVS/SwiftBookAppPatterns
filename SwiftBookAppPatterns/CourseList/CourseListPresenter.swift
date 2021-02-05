//
//  CourseListPresenter.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

// MARK: - View Output Protocol
class CourseListPresenter: CourseListViewOutputProtocol {
    unowned let view: CourseListViewInputProtocol
    
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    var coursesCount: Int {
        courses.count
    }
        
    private var courses: [Course] = []
    
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    func showCourses() {
        interactor.fetchCourses()
    }
    
    func getCourse(at indexPath: IndexPath) -> Course {
        courses[indexPath.row]
    }
    
    func showCourseDetails(at indexPath: IndexPath) {
        let course = courses[indexPath.row]
        router.openCourseDetailsViewController(with: course)
    }
}

// MARK: - Interactor Output Protocol
extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(_ courses: [Course]) {
        self.courses = courses
        view.reloadData()
    }
}
