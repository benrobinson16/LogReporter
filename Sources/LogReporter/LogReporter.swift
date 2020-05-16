// Created 2/2/2020
// Credit to atomicbird

import Foundation

public struct LogManager {
    
    /// Log the current filename and function, with an optional extra message. Call this with no arguments to simply print the current file and function. Log messages will include an Emoji selected from a list in the function, based on the hash of the filename, to make it easier to see which file a message comes from.
    /// - Parameter message: Optional message to include
    /// - Parameter file: Don't use, Swift will fill in the file name
    /// - Parameter function: Don't use, Swift will fill in the function name
    /// - Parameter line: Don't use, Swift will fill in the line number
    /// - Parameter prefix: Don't use, unless you really really want to
    /// - Parameter suffix: Don't use, unless you really really want to
    public static func log(_ message: String? = nil, file: String = #file, function: String = #function, line: Int = #line, prefix: String = "Milestone:", suffix: String = "") -> Void {
        #if DEBUG
        // Feel free to change the list of Emojis, but don't make it shorter, because a longer list is better.
        let logEmojis = ["😀","😎","😱","😈","👺","👽","👾","🤖","🎃","👍","👁","🧠","🎒","🧤","🐶","🐱","🐭","🐹","🦊","🐻","🐨","🐵","🦄","🦋","🌈","🔥","💥","⭐️","🍉","🥝","🌽","🍔","🍿","🎹","🎁","❤️","🧡","💛","💚","💙","💜","🔔"]
        let logEmoji = logEmojis[abs(file.hashValue % logEmojis.count)]
        if let message = message {
            print("\(prefix) \(logEmoji) \((file as NSString).lastPathComponent): \(line) \(function)() \(message) \(suffix)")
        } else {
            print("\(prefix) \(logEmoji) \((file as NSString).lastPathComponent): \(line) \(function)() \(suffix)")
        }
        #endif
    }
    
    /// Convenience to log an error using `log`-style logging with file location and an Emoji
    /// - Parameters:
    ///   - error: Any `Error`
    ///   - file: Don't use, Swift will fill in the file name
    ///   - function: Don't use, Swift will fill in the function name
    ///   - line: Don't use, Swift will fill in the line number
    public static func logError(_ error: Error, file: String = #file, function: String = #function, line: Int = #line) -> Void {
        log(error.localizedDescription, file: file, function: function, line: line, prefix: "\n\n🚨🚨🚨 ERROR:", suffix: " 🚨🚨🚨\n\n")
    }
    
    /// Convenience to log an error using `log`-style logging with file location and an Emoji
    /// - Parameters:
    ///   - error: Any `Error`
    ///   - file: Don't use, Swift will fill in the file name
    ///   - function: Don't use, Swift will fill in the function name
    ///   - line: Don't use, Swift will fill in the line number
    public static func logError(_ error: String, file: String = #file, function: String = #function, line: Int = #line) -> Void {
        log(error, file: file, function: function, line: line, prefix: "\n\n🚨🚨🚨 ERROR:", suffix: "🚨🚨🚨\n\n")
    }
    
}
