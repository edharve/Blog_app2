class PagesController < ApplicationController

def home

end

def about

end

def test
 @ip = request.remote_ip.to_s
end

end
