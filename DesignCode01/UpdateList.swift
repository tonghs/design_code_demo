//
//  UpdateList.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/14.
//

import SwiftUI

struct UpdateList: View {
    @State var showSetting = false
    @StateObject var store = UpdateStore(updates: updateData)
    
    func addUpdate() {
        store.updates.append(Update(image: "Certificate1", title: "New Title", text: "Certificate1", date: "JUL 1"))
    }
    
    func move(from source: IndexSet, to dest: Int) {
        store.updates.move(fromOffsets: source, toOffset: dest)
    }
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                        UpdateItem(item: item)
                    }
                    .padding(.vertical, 8)
                    
                }
                .onDelete(perform: { indexSet in
                    self.store.updates.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    move(from: indices, to: newOffset)
                })
            }
            .navigationTitle(Text("Updates"))
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addUpdate, label: {
                        Text("Add Updates")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                            .sheet(isPresented: self.$showSetting, content: {
                                Text("Settings")
                            })
                            .onTapGesture {
                                self.showSetting.toggle()
                            }

                        EditButton()
                    }
                    
                }

            })
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

var updateData = [
    Update(image: "Illustration1", title: "SwiftUI1", text: "1大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration2", title: "SwiftUI2", text: "2大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration3", title: "SwiftUI3", text: "3大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration4", title: "SwiftUI4", text: "4大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate1", title: "SwiftUI5", text: "5大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate2", title: "SwiftUI6", text: "6大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate3", title: "SwiftUI7", text: "7大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
]

struct UpdateItem: View {
    var item: Update
    
    var body: some View {
        HStack(spacing: 12) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color("background"))
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                Text(item.text)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .lineSpacing(4)
                    .font(.subheadline)
                    .frame(height: 50)
                
                Text(item.date)
                    .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
        }
        .padding(.bottom, 8.0)
    }
}
