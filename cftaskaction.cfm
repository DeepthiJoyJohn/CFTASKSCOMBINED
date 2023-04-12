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
<!--Task14-->
          <form name="form" id="form" enctype="multipart/form-data" action='cftaskaction.cfm' method="post">
				<h4>TASK14-IMAGE UPLOAD </h4>
				<label>Image Name</label>
				<input type="text" name="txtbox1" value="">
				<label>Description</label>
				<input type="text" name="txtbox2" value="">
				<input type="file" name="fileUpload">
		        <input type="Submit" name="SubmitTask14action" value="Upload File">
		        	
	        </form>	
	  
	  <cfparam name="form.fileUpload" default="">
      
		<cfif len(trim(form.fileUpload))>
			<cftry>
		  <cffile action="upload"   
		     fileField="fileUpload"
		     destination="C:\Pictures"
		     accept="image/png,image/jpg,image/gif,image/jpeg"
		     nameconflict="overwrite"
		     >
		     <cfif cffile.filesize gt 1000000>
		     	<cffile action="delete"	file="#cffile.ServerDirectory#\#cffile.ClientFileName#.#cffile.ClientFileExt#" result="fileUpload">
				<cfthrow type="sizeerror"
				message="File is to big; your file must be smaller than 1.0mb.">
				
			</cfif>
		     
		   <cfoutput>
		   	Thankyou, your file has been uploaded to  
            successfully to #cffile.ServerDirectory#\#cffile.ClientFileName##cffile.ClientFileExt# 
		   </cfoutput>  
		   <cfif IsImageFile("#cffile.ServerDirectory#/#cffile.ClientFileName#.#cffile.ClientFileExt#")>
		      <cfimage action="read" source="#cffile.ServerDirectory#/#cffile.ClientFileName#.#cffile.ClientFileExt#" name="myImage">
		      <cfset ImageScaleToFit(myImage,75,75,"bilinear")>
		      <cfset newImageName = #cffile.ServerDirectory# & "/" &#cffile.ClientFileName# & "_thumbnail." &#cffile.ClientFileExt#>
		      <cfset newImageName1 = #cffile.ServerDirectory#&"\"&#cffile.ClientFileName#&"_thumbnail."&#cffile.ClientFileExt#>
		      <cfimage source="#myImage#" action="write" destination="#newImageName#" overwrite="yes">
		      <cfoutput >
		      	
		      
		      <p>
Thank you for uploading the image. We have created a thumbnail for
your picture.
</p>
<p>
<!--- Display the thumbnail image. --->
#newImageName1#
<img src="#getFileFromPath(newImageName1)#">
</p>
</cfoutput>
		      	
			  <p>saved</p>
			
		    </cfif>
		   	
		 
		  <cfcatch type="any">
             Error: <cfoutput>#cfcatch.message#</cfoutput>
          </cfcatch>
          </cftry><br>
		</cfif>	
		
			
	
		
		
	   
	
	       	
<!--End-->
<a href="index.cfm"> 
<input type="Submit" name="" value="Back to Main Page">
</a>
