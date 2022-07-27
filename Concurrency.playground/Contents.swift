import Foundation

func buildGreeting(name: String) async -> String {
    let sleepTime = UInt64.random(in: 500...1000)
    try? await Task.sleep(nanoseconds: sleepTime * 1000)
    return "Hello, \(name)"
}

let names = ["Alice", "Bob", "Charlie", "Darwin", "Elisa", "Freddy", "George"]

print("--- Sequential execution with await")

for name in names {
    let greeting = await buildGreeting(name: name)
    print(greeting)
}

print("--- Sequential execution with Task")

let greetingTasks = names.map { name in
    return Task { return await buildGreeting(name: name) }
}

for greetingTask in greetingTasks {
    do {
        let greeting = try await greetingTask.result.get()
        print(greeting)
    } catch {
        print("Failed to get greeting")
    }
}

print("--- Parallel execution with Actor and TaskGroup")

actor GreetingsCollector {
    private(set) var greetings: [String] = []
    
    func fetchGreetings() async {
        await withTaskGroup(of: Void.self, body: { [unowned self] group in
            for name in names {
                group.addTask {
                    let greeting = await buildGreeting(name: name)
                    await self.append(greeting)
                }
            }
            await group.waitForAll()
        })
    }
    
    func append(_ greeting: String) {
        greetings.append(greeting)
    }
}

let collector = GreetingsCollector()
await collector.fetchGreetings()
for greeting in await collector.greetings {
    print(greeting)
}

print("--- End")
