local fireBase={
	link='',
	pwd='',

	print=function(str)
		str=str..'\n'
		MsgC('[FireBase]',color_white,str)
	end,
	read=function(self,str,meth,withpwd)
		if str==nil then
			str='.json'
		else
			str = '/'..str..'.json'
		end

		self.temp = nil
		self.temp = (withpwd ~= nil and withpwd) and '?auth='..self.pwd or ''

		http.Fetch(self.link..str..self.temp, function(html)
			if html=='null' then meth('null') else meth(html) end
		end, 
		function(err)
			self.print('HTTP: '..err)
		end)
	end,
	post=function(self,sid,js,withpwd)
		assert(sid and js, 'Sending request: SteamID or JS[NULL]')

		sid = '/'..sid..'.json'
		self.temp = nil
		self.temp = (withpwd ~= nil and withpwd) and '?auth='..self.pwd or ''

		HTTP({
			failed = function(err)
				self.print('HTTP: '..err)
			end,

			method = 'PATCH',
			url = self.link..sid..self.temp,
			body = util.TableToJSON(js),
			type = 'application/json'
		})
	end
}

return fireBase