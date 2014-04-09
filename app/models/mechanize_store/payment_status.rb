module MechanizeStore
    class PaymentStatus < ActiveRecord::Base

        #ids inseridos na base de dados
        ACCOMPLISHED = 1
        IN_ANALISIS = 2
        AWAITING = 3
        CANCELED = 4
        UNAUHTORIZED = 5
        NEEDS_AUTHORIZATION = 6

        def label_str
            return "success" if self.id == ACCOMPLISHED
            return "warning" if self.id == AWAITING or self.id == IN_ANALISIS
            return "info" if self.id == CANCELED 
            return "danger" if self.id == NEEDS_AUTHORIZATION or self.id = UNAUHTORIZED
        end
    end
end
