Class Application.Tests Extends %UnitTest.TestCase
{

ClassMethod RunUnitTests() As %Status
{
	#; Simple unit test example using the Application.Example.PhoneValidator() method
	///	dksjf
	set tStatus=$$$OK
	
	try {
		
		write !,"Unit testing Application.Example.PhoneValidator()",!
		
		set tSuccess=1
			
		#; Test some valid phone numbers.
		for tValidTestNumber="867-5309","7751234","800-444-1244" {
			set tTest=..Assert(tValidTestNumber,1,tValidTestNumber_" is valid.")
			if 'tTest set tSuccess=0
		}
		
		#; Test some invalid phone numbers.
		for tInvalidTestNumber="ABCD","1234","4343432423-43243243242342" {
			set tTest=..Assert(tInvalidTestNumber,0,tInvalidTestNumber_" is invalid.")
			if 'tTest set tSuccess=0
		}
		
		if tSuccess  {
			write !!,"Unit tests for Phone Validator PASSED."
		}
		else {
			write !!,"Unit tests for Phone Validator FAILED."
			set ^||Fail=1 ;unit test failed
		}
	}
	catch tException {
		set tStatus=tException.AsStatus()
		write !,tException.DisplayString()
	}
	
	quit tStatus
}

ClassMethod Assert(pPhoneNumber As %String, pExpectedResult As %Boolean, pMessage As %String) As %Boolean
{
	set tResult=##class(Application.Example).PhoneValidator(pPhoneNumber)
	set tPassed=(tResult=pExpectedResult)
	write !,pMessage,?40,$select(tPassed:"(PASSED)",1:"(FAILED)")
	quit tPassed
}

}
