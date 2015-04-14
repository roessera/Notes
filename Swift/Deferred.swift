/*
	Swift Deferred class for quick async classes. Takes a lightweight, javascript-esque approach.  
*/
public class Deferred {

	var tuples = [
		// action, add listener, listener list, final state
		[ "resolve", "done", jQuery.Callbacks("once memory"), "resolved" ],
		[ "reject", "fail", jQuery.Callbacks("once memory"), "rejected" ],
		[ "notify", "progress", jQuery.Callbacks("memory") ]
	]




 } 