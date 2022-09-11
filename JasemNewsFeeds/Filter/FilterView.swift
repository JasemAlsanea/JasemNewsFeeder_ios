//
//  FilterView.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 11/09/2022.
//
//@State is used by another file; for this reason; I used @SwiftUI.State
import SwiftUI

struct FilterView: View {
    @StateObject private var viewModel = FilterViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Select category")){
                ForEach(viewModel.categories, id: \.self){ category in
                    //Text(item)
                    //                        FilterSelectedRowView(title: category , selectedItem1: $viewModel.selectionCategory)
                }
            }
            Section(header: Text("Select Country")){
                ForEach(viewModel.countries, id: \.self){ country in
                    //Text(item)
                    //                        FilterSelectedRowView(title: country , selectedItem1: $viewModel.selectionCountries)
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
