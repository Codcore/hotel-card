class Hotel::Contract::Create < Reform::Form
  property :title
  property :address
  property :rating

  validation do
    configure do
      def self.messages
        super.merge(en: { errors: { unique?: 'must be unique' } })
      end

      def unique?(value)
        Hotel.find_by(title: value).nil?
      end
    end

    required(:title).filled(:unique?)
    required(:address).filled
    required(:rating).value(lteq?: 5, gteq?: 0)
  end
end