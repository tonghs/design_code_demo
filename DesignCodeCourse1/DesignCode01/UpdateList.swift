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
        store.updates.append(Update(
                                image: "Certificate1",
                                title: "This is a New Title",
                                text: "That is exactly, precisely, totally what is happening in Britain. Scapegoating Europe for the woes of the “real” Brit didn’t solve a speck of a thing. Instead, as we now know, trade plunged to half of what it used to be — overnight. Poverty and unemployment — and the despair, anxiety, rage, and hate they cause — are only growing.",
                                date: "JUL 1"))
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
    Update(image: "Illustration1", title: "SwiftUI1", text: """
        The best ideas can change who we are. Medium is where those ideas take shape, take off, and spark powerful conversations. We’re an open platform where 170 million readers come to find insightful and dynamic thinking. Here, expert and undiscovered voices alike dive into the heart of any topic and bring new ideas to the surface. Our purpose is to spread these ideas and deepen understanding of the world.

        We’re creating a new model for digital publishing. One that supports nuance, complexity, and vital storytelling without giving in to the incentives of advertising. It’s an environment that’s open to everyone but promotes substance and authenticity. And it’s where deeper connections forged between readers and writers can lead to discovery and growth. Together with millions of collaborators, we’re building a trusted and vibrant ecosystem fueled by important ideas and the people who think about them.
        """, date: "JUN 26"),
    Update(image: "Illustration2", title: "SwiftUI2", text: """
        Last week, a woman was walking home, in Clapham. It’s a leafy not-quite suburb of London, with an old park in the middle, surrounded by little homes full of young families and young people just beginning their careers. Think of it as reminiscent of a Park Slope, in Brooklyn. As she walked home, through this gentle and usually quite neighbourhood, she was brutally assaulted and killed.
        Her remains were found a week later. And the suspected killer, it turned out, was allegedly a serving police officer.
        """, date: "JUN 27"),
    Update(image: "Illustration3", title: "SwiftUI3", text: """
        Women in London have long had a radical feminist streak. They were appalled — and they were not about to take this particularly brutal incident of male violence quietly. They organized a vigil for the woman.
        Do you know what happened next? The picture above did. They were beaten and intimidated. By the police. Think about it for a second. Women peacefully not-even-protesting-but-mourning a woman allegedly killed by a male cop after dark were beaten and abused by male cops, after dark. For the terrible crime of…holding a vigil.
        Wait, what? How much perverse, stupid, terrible, grotesque irony is that?

        """, date: "JUN 28"),
    Update(image: "Illustration4", title: "SwiftUI4", text: """
        In Britain, something terrible and ugly is happening. Brexit nationalism is becoming open fascism.
        Adding even more irony to the already unbelievable picture above, all this comes on the eve of a new crime bill. Let me tell you a few of the things it criminalizes. “Serious annoyance.” “Economic harm.” “Activism.” In other words, boycotts. Peaceful protests — like vigils. Simply advocating something. All this is now going to be a criminal offence — punishable by up to ten years in prison.
        """, date: "JUN 2"),
    Update(image: "Certificate1", title: "SwiftUI5", text:"""
        Britain is now a country criminalising the most basic forms of dissent. Boycotts cause “economic damage” — start one, and you might find yourself in prison. Say something that someone in power doesn’t like, that’s “seriously annoying” — and you might find yourself on trial for your future. Be an “activist” — and you’re now a criminal. What on earth?
        All this is happening because the British government wants to essentially get rid of groups like Black Lives Matter and Extinction Rebellion. They are painted as terrorists and extremists. Of course, they are no such thing. They aren’t killing or beating or intimidating anyone. The most they’re guilty of is annoying stunts — oh wait, that brings us right back to the criminalisation of “serious annoyance.”
        """, date: "JUN 3"),
    Update(image: "Certificate2", title: "SwiftUI6", text:"""
        It’s just as damning what’s not on the radar. Genuine harassment, intimidation, brutality, violence. These aren’t included in the new crime bill. Nobody much cares about the very real harm being done to women online, who are sent rape and death threats as a matter of daily life. The British government is choosing instead to focus on an imaginary, illusory threat. Dissent.
        """, date: "JUN 4"),
    Update(image: "Certificate3", title: "SwiftUI7", text:"""
        What do you call a society like that — where even being on the side of progress, equality, justice is now a crime?
        Britain is hitting the turning point from Brexit’s rabid nationalism to open fascism. Open is a key word, too. None of this is even being bothered to be hidden. The police aren’t “secret.” The powers the government wants aren’t hidden. The police didn’t crack down in the vigil quietly. It’s out there for all to see.
        Why is that? That brings me to the “society” part. This is what a vast, vast majority of Brits want. The government enjoys double digit leads — after the debacle of Brexit, after having the world’s highest Covid death rate. Nothing, and I mean nothing, seems to be able to tear Brits away from their love affair with extreme nationalism. It seems to be so central to their identities that without it, there’s nothing left. Brits seem to need to think they’re better than everyone else, and deserve to rule them, and they should still be an empire, so any kind of progress should be a crime.
        """, date: "JUN 5"),
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
