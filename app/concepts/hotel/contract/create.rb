class Hotel::Contract::Create < Reform::Form
  property :title
  property :address
  property :rating

  validation do
    configure do
      config.messages = :i18n

      def unique?(value)
        Hotel.find_by(title: value).nil?
      end
    end

    required(:title).filled(:str?, :unique?)
    required(:address).filled(:str?)
  end
end