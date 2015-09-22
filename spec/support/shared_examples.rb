shared_examples "require login" do
  it "should redirect to the root path" do
    action
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
