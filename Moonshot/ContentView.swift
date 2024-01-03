import SwiftUI

// You can use .resizable() in combination with .frame(width: , height: ), .scaledToFit(), and .scaledToFill() to resize your image
// The containerRelativeFrame() modifier lets you fill up to a part of a container that you specify (either the full screen or a container like a VStack)

// ScrollView Notes:
// When you add views to a scroll view, they get created immediately -> this means that any views created will instantly be available before the user has even scrolled to view them
// You can use LazyVStack and LazyHStack to load their content on-demand -> this will not create views until they are actually shown which will minimize the amount of system resources being used
// One key difference: lazy stacks will always take up as much room as available in layouts whereas regular stacks will take up only as much space is needed -> this is intentional as it prevents lazy stacks hbaving to adjust their size if a new view is loaded that wants more space
// You can make horizontal scrollviews by passing in .horizontal as a parameter to ScrollView

// NavigationStack Notes:
// NavigationStack shows a navigation bar at the top of your views but it also pushes views onto a view stack -> this is the most fundamental form of iOS navigation
// NavigationLink and sheet() allows you to show a new view from the current one but the way they do it is different:
// NavigationLink is for showing details about the user's selection -> like digging deeper into a topic
// sheet() is for showing unrelated content, such as settings or a compose window

// The Codable Protocol makes it trivial to decode flat data -> Codable is capable of decoding everything with no further work from us as long as the data matches the heirarhcy you've asked for

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
        
//        NavigationStack {
//            List(0..<100) { row in
//                NavigationLink("Row \(row)") {
//                    Text("Detail \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }

//        Image("Example")
//            .resizable()
//            .scaledToFit()
//            // .scaledToFill()
//            // .frame(width: 300, height: 300)
//            .containerRelativeFrame(.horizontal) { size, axis in
//                size * 0.8
//            }

//        ScrollView {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//        }
    }
}

#Preview {
    ContentView()
}
