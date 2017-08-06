require 'balongdiffer'

RSpec.describe Balongdiffer do
  describe "balongdriver class" do
    context "given a class instantiation" do
      it "expect class to be there" do
        expect(described_class).to equal(Balongdiffer)
      end
    end
  end
end

# describe Balongdiffer do
#    context "When testing Balongdiffer" do
#
#       it "ensure filename is inputted for start method" do
#          hw = Balongdiffer.new
#          message = hw.start('trash.bin')
#          expect(filename).to eq 'trash.bin'
#       end
#
#    end
# end
