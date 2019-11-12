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
                            
                            //UIApplication.shared.keyWindow?.endEditing(true) 필요없음 저절로 내려감
                            
                            self.nodo = ""
                            
                        }.padding(.all, 12)
                    }.background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 5)
                    .padding(.trailing, 8)
                }
                
                
                /*List (nodoList, id: \.self) { item in
                    NoDoRow(noDoItem: item)
                }*/
                List {
                    ForEach(self.nodoList, id: \.self) { item in
                        NoDoRow(noDoItem: item, isDone: false)
                    }
                    .onDelete(perform: deleteItem)
                }
                
            }.navigationBarTitle(Text("NoDo"))
            
            
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        //print("Removed: \(index)")
        print("Removed: \(self.nodoList[index])")
        self.nodoList.remove(at: index)
        
        
    }
}




struct NoDoRow: View {
    @State var noDoItem: String = ""
    @State var isDone = false
    //@State var noDoList: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Group {
                HStack {
                    Text(noDoItem)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
                    Spacer()
                    
                    Image(systemName: (self.isDone) ? "checkmark": "square")
                    .padding()
                    

                }
                
                HStack(alignment: .center, spacing: 3) {
                    Spacer()
                    Text("Time Added...")
                    .foregroundColor(.white)
                    .italic()
                    .padding(.all, 4)
                }.padding(.bottom, 5)
                
                
            }.padding(.all, 4)
        }.opacity((self.isDone) ? 0.3 : 1)
        .background( (self.isDone) ?  Color.gray : Color.pink)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding()
            .onTapGesture {
                self.isDone.toggle()
                print("Tapped \(self.isDone)")
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


struct Hello: View {
    var body: some View {
        Text("Hello View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
