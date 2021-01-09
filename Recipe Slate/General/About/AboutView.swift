//
//  AboutView.swift
//  Recipe Slate
//
//  Created by Martin List on 12.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var store: AboutStore
    @Environment(\.presentationMode) var presentationMode
    
    init(store: AboutStore) {
        self.store = store
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AboutTextCell(text: store.about)
                    .padding(.bottom, 10)
                Text("Twitter")
                    .foregroundColor(.white)
                    .font(.headline)
                AboutLinkCell(content: store.twitter)
                AboutLinkCell(content: store.twitterRecipeSlate)
                AboutFooterCell(text: store.version)
            }
        }
        .padding()
        .background(Color(.defaultBackground))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("About")
        .listStyle(PlainListStyle())
        .navigationBarItems(trailing:
            HStack {
                Button("Done") {
                    NotificationHandler.post(.RecipeSlateDismissAboutPressed, object: nil)
                }
                .foregroundColor(.white)
            }
        )
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AboutView(store: AboutStore())
        }
    }
}

struct AboutTextCell: View {
    var text: String
    
    var body: some View {
        Text(text)
            .listRowBackground(Color(.defaultBackground))
            .foregroundColor(Color(.secondaryTextColor))
    }
}

struct AboutFooterCell: View {
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .foregroundColor(Color(.secondaryTextColor))
            Spacer()
        }
        .listRowBackground(Color(.defaultBackground))
    }
}

struct AboutLinkCell: View {
    var content: LinkButtonContent
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: content.icon)
                .foregroundColor(Color(.primary))
            Button(content.title) {
                UIApplication.shared.open(self.content.url)
            }
        }
        .listRowBackground(Color(.defaultBackground))
        .foregroundColor(Color(.primary))
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}
