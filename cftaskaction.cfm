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

<!--Task13-->
<cfif isDefined("form.SubmitTask13")>
			<form name="form" id="form" action='cftaskaction.cfm' method="post">
				<h4>TASK13-SEARCH WORD IN THE STRING -the quick brown fox jumps over the lazy dog</h4>
				<label>Textbox1</label>
				<input type="text" name="txtbox1" value="">
		        <input type="Submit" name="SubmitTask13action" value="Submit">
	        </form>			
</cfif>
<cfif isDefined("form.SubmitTask13action")>
	<cfset stringToSearch="the quick brown fox jumps over the lazy dog">
	<cfset substring=#form.txtbox1#>
	<cfset occurrences
   = ( Len(stringToSearch) -
       Len(Replace(stringToSearch,substring,'','all'))
     ) / Len(substring) >
    
	<cfoutput >
		Found the key word in #occurrences# times-the quick brown fox jumps over the lazy dog<br>
	</cfoutput> 
</cfif>
<!--End-->

<br><br>
	<a href="index.cfm"> 
		<input type="Submit" name="" value="Back to Main Page">
	</a>
