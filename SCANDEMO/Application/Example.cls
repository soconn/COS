Class Application.Example Extends %RegisteredObject
{

ClassMethod PhoneValidator(pPhoneNumber As %String) As %Boolean
{
	#; Simple example method that returns 1 (true) if a phone number is in a valid format.
	set tValid=0
	
	;#Format #######
	if pPhoneNumber?7N set tValid=1
	
	;#Format ###-#####
	if pPhoneNumber?3N1"-"4N set tValid=1
	
	;#Format ###-###-####
	if pPhoneNumber?3N1"-"3N1"-"4N set tValid=1
		
	quit tValid
}

}
