module MainApp
	def self.config
		Config.instance
	end

	class Config
		include Singleton
		include ConfigLoader::Delegator

		# load seed file (see geo-autocomplete demo)
		def seed
			@seed ||= load_hash 'seed/seed_da.yml'
		end

		# config for the app
		# any missing method on this is delegated to the Hashie wrapping this # loaded content
		def config
			@config ||= load_hash 'friendly_rent.yml'
		end

		def addresses locale = :da
			@config ||= load_hash 'data/addresses.json', locale: get_locale(locale)
		end

		def price_structure_for user_type, locale = nil
			load_yml "price_structure/#{user_type}.yml", locale: get_locale(locale)
		end

		def payment_provider
			@payment_provider ||= load_hash 'payment_gateways/quickpay.yml'
		end

		protected

		def get_locale locale = nil
			locale || I18n.locale
		end
	end
end