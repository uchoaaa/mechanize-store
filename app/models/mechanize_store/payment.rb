module MechanizeStore
    class Payment < ActiveRecord::Base
        belongs_to :order
        belongs_to :flag

        validates :flag_id, presence: true, :if => Proc.new{|p| p.payment_type == Payment::TYPES.invert[:credit_card] }

        #ids inseridos na base de dados
        STATUSES = {
            1 => :accomplished,
            2 => :in_analisis,
            3 => :awaiting,
            4 => :canceled,
            5 => :unauthorized,
            6 => :need_authorization
        }
        
        TYPES = {
            1 => :credit_card, 
            2 => :debit_card, 
            3 => :billet
        }

        validates :payment_type, :flag_id, presence: true

        before_create :before_create

        def payment_status_str
            return I18n.t(STATUSES[self.payment_status], scope: "order_status")
        end

        def payment_type_str
            return I18n.t(TYPES[self.payment_type], scope: "payment_types")
        end

        def self.statuses_collection
            statuses_collection = []

            STATUSES.each_pair do |key, value|
                statuses_collection << [I18n.t(value, scope: "payment_statuses")]
            end

            return statuses_collection 
        end

        def self.types_collection
            types_collection = []

            TYPES.each_pair do |key, value|
                types_collection << [I18n.t(value, scope: "payment_types"), key]
            end

            return types_collection
        end

        def before_create
            self.payment_status = STATUSES.invert[:awaiting]
        end

        def payment_status_label
            return "success" if self.payment_status == STATUSES.invert[:accomplished]
            return "warning" if self.payment_status == STATUSES.invert[:awaiting] or self.payment_status == STATUSES.invert[:in_analisis]
            return "info" if self.payment_status == STATUSES.invert[:canceled] 
            return "danger" if self.payment_type == STATUSES.invert[:unauthorized] or self.payment_status = STATUSES.invert[:need_authorization]
        end
    end
end
