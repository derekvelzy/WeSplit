import SwiftUI

// View is a protocol
// View has only one REQUIREMENT: body
struct ContentViewz: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Billy", "Bob", "Joe", "Harry", "Dick"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    TextField("Enter your name", text: $name)
                    Text("Your name is: \(name)")
                }
                Section {
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Text("Hello, world!")
                        .padding()
                    Button("Tap count \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(0..<students.count) {
                            Text(self.students[$0])
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}


/*

Form: scrolling list of static or interactive controls
    Group: Separates Form items but doesnt change UI
    Section: Separates Form items and does change UI
 
 NavigationView: top-root element that creates a nav bar
    .navigationBarTitle: "MODIFIER" to include a title
 
 @State: Allows you to change properties in a Struct
    - @State is a "property wrapper"
    - "private" is recommended for state that is contained within the struct
 
 $: Used for two-way data binding
 
 ForEach: loop through data to create new views
 
 */
