return {
	link='',
	pwd='',
	temp,

	print=function(str)
		str=str..'\n'
		MsgC('[FireBase]',color_white,str)
	end,
	read=function(self,path,meth,withpwd)
		if path==nil then
			path='.json'
		else
			path = '/'..path..'.json'
		end

		self.temp = (withpwd ~= nil and withpwd) and '?auth='..self.pwd or ''

		http.Fetch(self.link..path..self.temp, function(html)
			meth(html)
		end, 
		function(err)
			self.print('HTTP: '..err)
		end)
	end,
	patch=function(self,path,js,withpwd)
		assert(path and js, 'Sending request: PATH or TABLE[NULL]')

		path = '/'..path..'.json'
		self.temp = (withpwd ~= nil and withpwd) and '?auth='..self.pwd or ''

		HTTP({
			failed = function(err)
				self.print('HTTP: '..err)
			end,

			method = 'PATCH',
			url = self.link..path..self.temp,
			body = util.TableToJSON(js),
			type = 'application/json'
		})
	end,
	delete=function(self,path,withpwd)
		assert(path, 'Sending request: PATH[NULL]')

		path = '/'..path..'.json'
		self.temp = nil
		self.temp = (withpwd ~= nil and withpwd) and '?auth='..self.pwd or ''

		HTTP({
			failed = function(err)
				self.print('HTTP: '..err)
			end,

			method = 'DELETE',
			url = self.link..path..self.temp,
			type = 'application/json'
		})
	end
}
