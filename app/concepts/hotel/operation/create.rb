class Hotel::Operation::Create < Trailblazer::Operation
  step Model(Hotel, :new)
  step Contract::Build(constant: Hotel::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
end
