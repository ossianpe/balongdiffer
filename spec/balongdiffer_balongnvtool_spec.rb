require 'balongdiffer'

RSpec.describe Balongdiffer::Balongnvtool do
  describe "balongnvtool class" do
    context "given a class instantiation" do
      it "expect class to be there" do
        expect(described_class).to equal(Balongdiffer::Balongnvtool)
      end
    end
  end
end
