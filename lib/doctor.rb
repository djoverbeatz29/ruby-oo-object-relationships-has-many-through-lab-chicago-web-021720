class Doctor
    attr_accessor :name
    attr_reader

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.find_all { |app| app.doctor == self }
    end

    def patients
        self.appointments.map { |app| app.patient }
    end

end