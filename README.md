# UITextViewAutocorrectCustomAttributes

Demonstrates that autocorrected NSAttributedString ranges in a UITextView do not carry over custom attributes.

To test:

1. Type in the UITextView something that can be autocorrected like "Hello i'm"
2. Autocorrect the "i'm" to "I'm" by pressing the spacebar, or choosing the suggestion on the keyboard.
3. Observe the value of `textView.textStorage` in the target output. The range for "I'm" will not contain the `NSAttributedString.Key.customKey`.

### Other notes:

Double-tapping the spacebar to insert a period is also affected.

Latest iOS version tested: 15.2
