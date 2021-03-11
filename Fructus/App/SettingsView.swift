//
//  SettingsView.swift
//  Fructus
//
//  Created by Alexey Qian on 2021/3/9.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                VStack (spacing: 20){
                    // MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"),
                        content: {
                            Divider().padding(.vertical, 4)
                            
                            HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                
                                Text("most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium dietary fider, vitamins, and much more.")
                                    .font(.footnote)
                            })
                    })
                    
                    // MARK: - SECTION 2
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"), content: {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the app by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        Toggle(isOn: $isOnboarding, label: {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        })
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground))
                    })
                    
                    // MARK: - SECTION 3
                    GroupBox(
                        label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ){                        
                        SettingsRowView(name:"Developer", content: "Alexey Qian")
                        SettingsRowView(name: "Designer", content: "Michael")
                        SettingsRowView(name: "Compability", content: "iOS 14")
                        SettingsRowView(name: "Website", content: nil, linkLabel: "SwiftUI Master Class", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", content: nil, linkLabel: "@alexey", linkDestination: "twitter.com/alexey")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }
                } //: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                    }
                )
                .padding()
            }//: SCROLL
        } //: NAVIGATION
        
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
