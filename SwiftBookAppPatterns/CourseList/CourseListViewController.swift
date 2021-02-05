//
//  CourseListViewController.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 16.12.2020.
//

import UIKit

protocol CourseListViewInputProtocol: class {
    func reloadData()
}

protocol CourseListViewOutputProtocol {
    var coursesCount: Int { get }
    init(view: CourseListViewInputProtocol)
    
    func showCourses()
    func getCourse(at indexPath: IndexPath) -> Course
    func showCourseDetails(at indexPath: IndexPath)
}

class CourseListViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Public Properties
    var presenter: CourseListViewOutputProtocol!
    
    // MARK: - Private Properties
    private let configurator: CourseListConfiguratorInputProtocol = CourseListConfigurator()
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
        configurator.configure(with: self)
        presenter.showCourses()
        
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        let configurator: CourseDetailsConfiguratorProtocol = CourseDetailsConfigurator()
        configurator.configure(with: detailVC, and: sender as! Course)
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .systemBlue
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        presenter.coursesCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell",
                                                 for: indexPath) as! CourseTableViewCell
        
        cell.configure(for: presenter.getCourse(at: indexPath))
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showCourseDetails(at: indexPath)
    }
}

// MARK: - Input Protocols
extension CourseListViewController: CourseListViewInputProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
