require 'xinge/base'
module Xinge
  class Android < Base
    def initialize(accessId = nil, secretKey = nil, options = {})
      accessId ||= Xinge.config[:android_accessId]
      secretKey ||= Xinge.config[:android_secretKey]
      super(accessId, secretKey)
    end
    def pushToSingleDevice(token, msg_type, title, content, custom_content={}, params={})
      self.push_single_device(token, msg_type, build_simple_message(title, content, custom_content), params)
    end
    def pushToAllDevice(msg_type, title, content, custom_content={}, params={})
      self.push_all_device(msg_type, build_simple_message(title, content, custom_content), params)
    end

    protected

    def build_simple_message(title, content, custom_content)
      {
        title: title, content: content, vibrate: 1
      }.merge(custom_content).to_json
    end
  end
end
