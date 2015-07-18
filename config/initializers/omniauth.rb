OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '399575120226034', '64001edce7887cab6578136f0dae3e06',
  :scope => 'email,manage_pages,read_stream,read_insights'
end