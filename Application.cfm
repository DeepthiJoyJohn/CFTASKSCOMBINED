	<cfapplication name="cftasks"
    		   sessionmanagement="yes"
    		   clientstorage="cookie"
    		   clientmanagement="Yes"
    		   loginstorage="session"
               scriptprotect="all"
               sessionTimeout = #CreateTimeSpan(0, 0, 10, 0)#>
    <cfset cftask.DSN = "mydb" >
    