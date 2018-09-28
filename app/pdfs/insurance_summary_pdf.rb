class InsuranceSummaryPdf < Prawn::Document
  def initialize(insurance)
    super(margin: [30, 30, 30, 30])
    @insurance = insurance
    @vehicle = insurance.vehicle
    @user = @vehicle.user
    @rate = @vehicle.rate
    build
  end

  def build
    title
    client_information
    vehicle_information
    price_detail
  end

  def title
    text "Resumen de compra", style: :bold, size: 30
    draw_text "#{@insurance.created_at.to_date}", :at => [500, 0]
    
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

  def price_detail
    move_down 20
    detail_columns_name = ["Prima", "Contribucion al FOSYGA", "Tasa RUNT", "Total"]
    detail_values = ["$#{@rate.bonus}", "$#{@rate.fosyga}", "$#{@rate.runt}", "$#{@rate.total}"]
    data = [detail_columns_name, detail_values]

    text "Resumen de precio", style: :bold, size: 20

    table(data) do
      column(3).font_style = :bold
    end

  end
  
  
end
