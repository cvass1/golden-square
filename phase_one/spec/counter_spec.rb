require 'counter'

RSpec.describe "Counter" do
    it "reports the total as zero" do
        new_count = Counter.new
        result = new_count.report
        expect(result).to eq "Counted to 0 so far."
    end

    it "adds 2 and reports the total as 2" do
        new_count = Counter.new
        new_count.add(2)
        result = new_count.report
        expect(result).to eq "Counted to 2 so far."
    end
end