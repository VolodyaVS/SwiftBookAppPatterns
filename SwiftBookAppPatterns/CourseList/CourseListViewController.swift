//
//  ViewController.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 16.12.2020.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseListViewModel()
        tableView.rowHeight = 100
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        detailVC.viewModel = sender as? CourseDetailsViewModelProtocol
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
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell",
                                                 for: indexPath) as! CourseTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(at: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        let courseDetailsViewModel = viewModel.viewModelForSelectRow(at: indexPath)
        performSegue(withIdentifier: "showDetails", sender: courseDetailsViewModel)
    }
}
