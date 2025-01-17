// RUN: %target-typecheck-verify-swift -disable-availability-checking

// REQUIRES: objc_interop

/////////
// check for disallowed attributes in protocols
@objc protocol Tea {
 var temperature : Double { get throws } // expected-error{{property with 'throws' or 'async' is not representable in Objective-C}}
 subscript(_ d : Double) -> Bool { get async throws } // expected-error{{subscript with 'throws' or 'async' is not representable in Objective-C}}

 // NOTE: this seems counter-intuitive, but TSPL says @nonobjc applies to
 // members that are representable in ObjC, and this is not representable.
 @nonobjc var sugar : Bool { get async } // expected-error{{property with 'throws' or 'async' is not representable in Objective-C}}
}