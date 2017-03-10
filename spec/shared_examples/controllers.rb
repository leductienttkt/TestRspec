shared_examples "responds" do |temp| 
  it "renders view" do
    expect(response).to render_template(temp)
  end

  it "responds successfully with an HTTP 200 status code" do
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end
