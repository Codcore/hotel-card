module Application::Cell
  class Layout < Trailblazer::Cell
    include ActionController::ContentSecurityPolicy
    include ActionView::Helpers::CsrfHelper
    include ActionView::Helpers::CspHelper
    include Webpacker::Helper
  end
end
