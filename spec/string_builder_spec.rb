require 'string_builder'

RSpec.describe "testing string_builder class" do
    it "returns string of ' ' " do
        newstring = StringBuilder.new
        result = newstring.output
        expect(result).to eq ""
    end

    it "adds string 'hello' and returns string of 'hello " do
        newstring = StringBuilder.new
        newstring.add('hello')
        result = newstring.output
        expect(result).to eq "hello"
        end
end

