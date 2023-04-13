
	<cfparam name="form.fileUpload" default="">      
		<cfif len(trim(form.fileUpload))>
			<cftry>
		    	<cffile action="upload" fileField="fileUpload" destination="C:\Pictures" accept="image/png,image/jpg,image/gif,image/jpeg"  nameconflict="overwrite">
		        <cffile action = "rename"destination = "#cffile.ServerDirectory#/#form.txtbox1#.#cffile.ClientFileExt#" source = "#cffile.ServerDirectory#/#cffile.ClientFileName#.#cffile.ClientFileExt#" mode = "666">
		        <cfif cffile.filesize gt 1000000>
		     		<cffile action="delete"	file="#cffile.ServerDirectory#\#form.txtbox1#.#cffile.ClientFileExt#" result="fileUpload">
					<cfthrow type="sizeerror" message="File is to big; your file must be smaller than 1.0mb.">				
			    </cfif>		     
		    	<cfoutput>
		   		 Thankyou, your file has been uploaded to successfully to #cffile.ServerDirectory# 
		    	</cfoutput>
		    	<cfif not structKeyExists(application, "#form.txtbox1#")>    
				    <cflock scope="application" type="exclusive" timeout="30">  
				            <cfset value=StructInsert(application, "#form.txtbox1#", "#form.txtbox2#")>            
				    </cflock>
				</cfif>				
         
		    <cfif IsImageFile("#cffile.ServerDirectory#/#form.txtbox1#.#cffile.ClientFileExt#")>
		    	<cfimage action="read" source="#cffile.ServerDirectory#/#form.txtbox1#.#cffile.ClientFileExt#" name="myImage">
		      	<cfset ImageScaleToFit(myImage,20,20,"bilinear")>
		      	<cfset newImageName = #cffile.ServerDirectory# & "/" &#form.txtbox1#&"_thumbnail." &#cffile.ClientFileExt#>		      	
		      	<cfimage source="#myImage#" action="write" destination="#newImageName#" overwrite="yes">		      
              	<cfset recurse=true>
			  	<cfset listInfo="name">
				<cfset filter="*_thumbnail*">
				<cfset res= DirectoryList(#cffile.ServerDirectory#,recurse,#listInfo#,#filter#)> 
				<cfloop array="#res#" item="itm">
					<br><br>
					<cfset myImage=ImageNew("#cffile.ServerDirectory#\#itm#")>				
				    <cfimage source="#myImage#" action="writeToBrowser"><br>
				    <cfset FileName = rereplace( #itm# , '_thumbnail' , '' ) />
				    <cfoutput>				    		
				    	<a href="../task14/imagelistdetail.cfm?filename=#FileName#">#FileName#</a>
				    </cfoutput>			    
				   				    			    
				</cfloop>
		    </cfif>
		    <cfcatch type="any">
            	Error: <cfoutput>#cfcatch.message#</cfoutput>
            </cfcatch>
            </cftry>
		</cfif>		
	