//
//  CourseListConfigurator.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 15.02.2021.
//  Copyright © 2021 Vladimir Stepanchikov. All rights reserved.
//

final class CourseListConfigurator {
    static let shared = CourseListConfigurator()
    
    private init() {}
    
    func configure(with viewController: CourseListViewController) {
        let interactor = CourseListInteractor()
        let presenter = CourseListPresenter()
        let router = CourseListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}

