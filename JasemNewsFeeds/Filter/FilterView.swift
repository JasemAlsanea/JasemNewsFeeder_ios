//
//  FilterView.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 11/09/2022.
//

import SwiftUI

struct FilterView: View {
    //@StateObject private var viewModel = FilterViewModel()
    @StateObject var viewModel: FilterViewModel
    @Binding var selectionCountries: String?
    @Binding var selectionCategory: String?
    
    var body: some View {
        List {
            Section(header: Text("Select category")){
                ForEach(viewModel.categories, id: \.self){ category in
                    Button {
                        selectionCategory = category
                    } label: {
                        Text(category)
                            .foregroundColor(selectionCategory == category ? .blue : .black)
                    }
                }
            }
            Section(header: Text("Select Country")){
                ForEach(viewModel.countries, id: \.self){ country in
                    Button {
                        selectionCountries = country
                    } label: {
                        Text(country)
                            .foregroundColor(selectionCountries == country ? .blue : .black)
                    }
                }
            }
        }
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel(), selectionCountries: .constant(nil), selectionCategory: .constant(nil))
    }
}
