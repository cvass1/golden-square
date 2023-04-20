require 'cat_facts'

RSpec.describe CatFacts do
  it "returns a cat fact" do
    fake_requester = double(:fake_requester)
    expect(fake_requester).to receive(:get)
    .with(URI("https://catfact.ninja/fact"))
    .and_return('{"fact":"Ginger tabby cats can have freckles around their mouths and on their eyelids!","length":77}')
    cat_fact = CatFacts.new(fake_requester)
    result = cat_fact.provide
    expect(result).to eq "Cat fact: Ginger tabby cats can have freckles around their mouths and on their eyelids!"
  end
end


