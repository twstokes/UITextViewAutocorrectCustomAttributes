//
//  ViewController.swift
//  CustomAttributesAutocorrect
//
//  Created by Tanner W. Stokes on 1/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
        textView.attributedText = NSAttributedString(string: "Replace me and observe the target output. Type something like \"Hello i'm\" and then let autocorrect replace \"i'm\" with \"I'm\". It should lose the customKey attribute for that range.", attributes: textView.typingAttributes)
    }

    func setAttributes() {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.customKey: "somethingCustom!"
        ]

        textView.typingAttributes = attributes
    }
}

extension ViewController: UITextViewDelegate {
    /// Observe the output of the `print` statement to see that autocorrected strings
    /// won't carry the `customKey` type.

    /// Example output from typing "Hello i'm" and letting autocorrect replace "i'm" with "I'm".
    /*
     Hello {
         NSFont = "<UICTFont: 0x15820e6b0> font-family: \".SFUI-Regular\"; font-weight: normal; font-style: normal; font-size: 20.00pt";
         custom = "somethingCustom!";
     }I’m{
         NSFont = "<UICTFont: 0x15820e6b0> font-family: \".SFUI-Regular\"; font-weight: normal; font-style: normal; font-size: 20.00pt";
     } {
         NSFont = "<UICTFont: 0x15820e6b0> font-family: \".SFUI-Regular\"; font-weight: normal; font-style: normal; font-size: 20.00pt";
         custom = "somethingCustom!";
     */
    func textViewDidChange(_ textView: UITextView) {
        print(textView.textStorage)
        setAttributes()
    }

    /// Unfortunately this has no effect.
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        setAttributes()
        return true
    }

    /// Unfortunately this has no effect.
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        setAttributes()
        return true
    }
}

extension NSAttributedString.Key {
    static let customKey = NSAttributedString.Key("custom")
}
