class InsuranceSummaryPdf < Prawn::Document
  def initialize(insurance)
    super(margin: [30, 30, 30, 30])
    @insurance = insurance
    @vehicle = insurance.vehicle
    @user = @vehicle.user
    @rate = @vehicle.rate
    @coverage = @rate.coverage
    build
  end

  def build
    title
    client_information
    vehicle_information
    price_detail
    coverage
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

  def coverage
    move_down 20
    text "Cobertura", style: :bold, size: 20
    start_date = @insurance.start_date.strftime("%d-%b-%Y a las %H:%m")
    end_date = @insurance.end_date.strftime("%d-%b-%Y hasta las %H:%m")
    text "Con esta poliza estaras protegido durante el periodo comprendido entre: <b>#{start_date}</b> y <b>#{end_date}</b>, ademas estos son los valores que te cubrira la poliza:", inline_format: true
    move_down 10
    coverage_table
  end

  def coverage_table
   columns =  ["Muerte y gastos funerarios", "Gastos médicos", "Incapacidad permanente", "Gastos de transporte"]
   columns_values = [
     "#{coverage_item_formater(@coverage.death)}",
     "#{coverage_item_formater(@coverage.medical_expenses)}",
     "#{coverage_item_formater(@coverage.permanent_inability)}",
     "#{coverage_item_formater(@coverage.transportation_expenses)}",
    ]

    data = [columns, columns_values]

    table(data) do
      row(0).font_style = :bold
    end 
  end

  def coverage_item_formater(item)
    "#{item} #{@coverage.unit}"
  end
  
  
end
