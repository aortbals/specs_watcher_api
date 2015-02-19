class DocsController < ApplicationController
  skip_before_action :authenticate
end
