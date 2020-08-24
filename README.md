
# FireBase_GModification
![](https://i.imgur.com/Jpw6Tst.jpg)
### Commands
* read:

	#1 path (string)
	
	#2 meth (function)/HTML ARGUMENT
	
	#3 withpassword (bool)/Need to write with database secret password? If not. you can leave it empty.

	example: 
	```lua
	    local fb = include('FireBase.lua')
	    fb:read('player/BOT/gay',function(html)
		if tobool(html) then
		    print('fuck gay detected')
		end
	    end)

	    //fuck gay detected
	```
	![](https://i.imgur.com/REk4Yhf.png)

* patch:

	#1 path (string)
	
	#2 json (table)
	
	#3 withpassword (bool)
	
	Comments: If a database is created, it shall update it, if no database is created, it shall create it.
	
	example: 
	```lua
	    local fb = include('FireBase.lua')
	    fb:patch('player/BOT',{gay = true, autist = true, usergroup = "superadmin"}, true)
	```
	![](https://i.imgur.com/9lo4Z3Q.png)

* delete:

	#1 path (string)
	
	#2 withpassword (bool) 

	example: 
	```lua
	    local fb = include('FireBase.lua')
	    fb:delete("player/BOT/gay", true)
	```
	![](https://i.imgur.com/O0iIzKP.png)
### Variable
* link (string): 
	example: https://santyvulla.firebaseio.com/

* pwd (string): 
	example: Cfl5fg59wqCb2aHHv1HEbC2ATaeJ8JfjNfmdz6sd
