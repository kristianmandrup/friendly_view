Layout

		= yield :head
		:javascript
			var country_code = '#{@country_code}';
	%body
		.main
			= link_to "Sign in", new_user_session_path
			= link_to "Sign up", new_user_registration_path

			#languages
				= flag_list 64 do
					= flags_title :ar => 'Argentina', :zw => 'Barbados'
			%p.clear
			= yield
			= yield :scripts