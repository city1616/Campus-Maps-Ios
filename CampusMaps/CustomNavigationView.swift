//
//  CustomNavigationView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/06.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    var view: NaviView
    
    // onSearch And OnCancel Closures
    var onSearch: (String) -> ()
    var onCancel: ()->()
    
    //requre closure on call
    init(view: NaviView, onSearch: @escaping (String)->(), onCancel: @escaping ()->()) {
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
  
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let childView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: childView)
        
        controller.navigationBar.topItem?.title = "Campus Maps"
        controller.navigationBar.prefersLargeTitles = false
        
        // search Bar ...
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "검색하기"
        
        // setting delegate
        searchController.searchBar.delegate = context.coordinator
        
        // setting Search Bar In NavBar
        controller.navigationBar.topItem?.searchController = searchController
        
        // disabling hide on scroll
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        
        // disabling dim bg..
        searchController.obscuresBackgroundDuringPresentation = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
    // search Bar Delegate..
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // when text changes
            // print(searchText)
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // when cancel button is clicked
            self.parent.onCancel()
        }
    }
}
