/// My First Project!
Class Demo.Person Extends (%Persistent, %Library.Populate)
{

/// Name
Property Name As %String [ Required ];

/// Phone
Property Phone As %String;

/// Age	
Property Age As %Integer [ Required ];

/// the sum of two integerts
ClassMethod sum(A As %Integer = 0, B As %Integer = 0) As %Integer
{
	set result = A + B
	return result
}
///comment

/// Print out Information
Method Print() As %Status
{
	write !, "This person is named ", ..Name,"."
	write !, ..Name, "'s phone umber is ", ..Phone,"."
	write !, ..Name, "'s age is ", ..Age, "years old."
	return $$$OK
}

/// Planet
Parameter PLANET = "Earth";
/// shoudl ahve been Mars
Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>Age</Value>
</Value>
</Data>
<DataLocation>^Demo.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<Description>
<![CDATA[shoudl ahve been Mars]]></Description>
<IdLocation>^Demo.PersonD</IdLocation>
<IndexLocation>^Demo.PersonI</IndexLocation>
<StreamLocation>^Demo.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
