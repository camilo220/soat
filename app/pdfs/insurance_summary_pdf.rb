class InsuranceSummaryPdf < Prawn::Document
  def initialize(insurance)
    super(margin: [30, 30, 30, 30])
    @insurance = insurance
    @vehicle = insurance.vehicle
    @user = @vehicle.user
    build
  end

  def build
    title
    client_information
    vehicle_information
  end

  def title
    text "Resumen de compra", style: :bold, size: 30
  end

  def client_information
    move_down 20
    text "#{@user.full_name}", style: :bold, size: 20
    text "#{@user.document_type}: #{@user.document}"
    text "Numero de telefono: #{@user.phone}"
  end

  def vehicle_information
    move_down 20
    text "Vehiculo", style: :bold, size: 20
    text "Placa: #{@vehicle.license}"
    text "Categoria: #{@vehicle.category}"
    text "Sub Categoria: #{@vehicle.sub_category}"
    text "#{@vehicle.unit_of_measurement} #{@vehicle.unit_value}"
    text "Fecha de fabricacion: #{@vehicle.year}" if @vehicle.year?
  end
  
  
end
