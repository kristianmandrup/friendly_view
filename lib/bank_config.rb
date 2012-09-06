require 'money/bank/google_currency'
require 'money/bank/open_exchange_rates_bank'

class BankConfig
	def initialize
		Money.default_exchange = Money::Exchange::MultipleBanks.new primary_bank, alternative_banks
	end

	protected

	def open_exchange_rates_bank
 		Money::Bank::OpenExchangeRatesBank.new
 	end
	
	def google_currency_bank 
		Money::Bank::GoogleCurrency.new
	end

	def eu_bank
		EuCentralBank.new
	end

	def primary_bank
		google_currency_bank
	end

	def alternative_banks
		[open_exchange_rates_bank, eu_bank].compact
	end
end