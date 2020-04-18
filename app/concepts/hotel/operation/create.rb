class Hotel::Operation::Create < Trailblazer::Operation
  DEFAULT_IMAGE = Rails.root.join('app', 'assets', 'images', 'hotel.jpg')

  step Model(Hotel, :new)
  step Contract::Build(constant: Hotel::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  step :add_tags!
  step :attach_image!

  def add_tags!(ctx, params:, **)
    ctx[:model].tag_list.add(params[:tags]) if params[:tags].present?
  end

  def attach_image!(ctx, params:, **)
    ctx[:model].image.attach(io: File.open(params[:image] || DEFAULT_IMAGE),
                             filename: 'hotel.jpeg',
                             content_type: 'image/jpeg')
  end
end
