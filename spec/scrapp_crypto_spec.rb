require_relative './lib/scrapp_crypto'

describe "perform" do
    it "return the name abreviation of the crypto" do
        expect(name).to be_an_instance_of Array
        expect(name.length).to be >= 15
    end
    it "return an array of price stringClass and begin by a DOLLARS" do
        expect(price[0]).to include("$")
        expect(price).to be_an_instance_of Array
    end
    it "return a Hash with minimum 15 pair of key-value" do
        expect(perform.length).to be >= 15
    end

end