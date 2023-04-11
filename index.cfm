<!--- Please insert your code here --->
<form name="form" id="form" action='cftaskaction.cfm' method="post">
	<!--Task Buttons-->
	<input type="Submit" name="SubmitTask12" value="Task12">
	<!--End-->
	<!--Task12-->
		<cfif isDefined("form.SubmitTask12")>
			<input type="text" name="txtbox1" value="">
	        <input type="Submit" name="SubmitTask12action" value="Submit">			
		</cfif>
	<!--End-->
	
</form>