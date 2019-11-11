//
//  ContentView.swift
//  SwiftUI_NoDo
//
//  Created by 양팀장(iMac) on 2019/11/11.
//  Copyright © 2019 양팀장(iMac). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nodo: String = ""
    @State var nodoList = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    
                    Image(systemName: "plus.circle")
                        .padding(.leading)
                    
                    Group {
                        TextField("What Will You Not Do Today?", text: self.$nodo, onEditingChanged: { (changed) in
                            print(changed)
                        }) {
                            //print("onCommit")
                            self.nodoList.insert(self.nodo, at: 0)
                            print("Added item: \(self.nodoList)")
                            self.nodo = ""
                        }.padding(.all, 12)
                    }.background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 5)
                    .padding(.trailing, 8)
                }
                
                
                List (nodoList, id: \.self) { item in
                    Cell(title: item)
                }
                
            }.navigationBarTitle(Text("NoDo"))
            
            
            
        }
    }
}

struct Cell: View {
    var title: String = ""
    var isChecked: Bool = false
    var addTime: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack (alignment: .top) {
                Text(self.title)
                Spacer()
                Button(action: {
                    print("check click")
                }) {
                    Image(systemName: "plus.circle")
                }
            }.frame(maxHeight: .infinity).background(Color.red)
            HStack {
                Spacer()
                Text("Add Just now")
            }
        }.background(Color.gray).frame(height: 100)
        .cornerRadius(5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
