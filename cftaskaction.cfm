<!--Task12-->


		<cfif isDefined("form.SubmitTask12")>
			<form name="form" id="form" action='cftask12component.cfc?method=retrieveNames' method="post">
				<h4>TASK12</h4>
				<label>Textbox1(Enter digits between 1-10)</label>
				<input type="text" name="txtbox1" value="">
		        <input type="Submit" name="SubmitTask12action" value="Submit">
	        </form>			
		</cfif>
<!--End-->

<!--EndTask12-->