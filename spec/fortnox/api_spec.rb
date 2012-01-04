require 'spec_helper'

module Fortnox
  describe API do
    let(:query_params) { {:token => 'foo', :db => 'bar'} }

    before :each do
      API.establish_connection({:token => 'foo', :database => 'bar'})
      API.stub(:post)
    end

    it "can establish a connection" do
      API.connection.should eq(query_params)
    end

    it "can make post request" do
      attributes = {:foo => 'bar'}

      API.should_receive(:post).with('/test.php', {
        :query  => query_params,
        :body   => {:xml => '<foo>bar</foo>'}
      })

      API.run(:post, 'test', attributes)
    end

    it "can make post request with query parameters" do
      attributes = {:foo => 'bar', :query => {:id => 1}}

      API.should_receive(:post).with('/test.php', {
        :query  => query_params.merge(attributes[:query]),
        :body   => {:xml => '<foo>bar</foo>'}
      })

      API.run(:post, 'test', attributes)
    end
  end
end
