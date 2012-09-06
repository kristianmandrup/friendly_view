class Payment
  class CardPresenter < Presenter
    decorates :payment

    attr_accessor :form

    def present
      card_inputs
    end

    protected

    def card_inputs
      form.semantic_fields_for :card do |card|
        [card_number, expiry_date, acc_number].join
      end
    end

    def card_number
      card.input :number,  :name => t('credit_card.number')
    end

    def expiry_date
      [expiry_month, expiry_year].join
    end

    def expiry_month
      card.input :month,  :name => t('credit_card.month')
    end

    def expiry_year
      card.input :month,  :name => t('credit_card.month')
    end
  end
end
