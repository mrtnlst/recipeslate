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
        List {
            AboutTextCell(text: store.about)
            AboutLinkCell(content: store.twitter)
            AboutLinkCell(content: store.homepage)
            AboutFooterCell(text: store.version)
        }
        .background(Color(.backgroundBlue))
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
            .listRowBackground(Color(.backgroundBlue))
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
        .listRowBackground(Color(.backgroundBlue))
    }
}

struct AboutLinkCell: View {
    var content: LinkButtonContent
    var body: some View {
        VStack(alignment: .leading) {
            Text(content.sectionTitle)
                .foregroundColor(.white)
                .font(.headline)
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: content.icon)
                    .foregroundColor(Color(.headerBlue))
                Button(content.title) {
                    UIApplication.shared.open(content.url)
                }
            }
        }
        .listRowBackground(Color(.backgroundBlue))
        .foregroundColor(Color(.headerBlue))
    }
}
