require 'aliyunsdkcore'
require 'json'
module AliyunAirec
  class Client
    attr_accessor :endpoint, :access_key_id, :access_key_secret, :instance_id
    def initialize(endpoint: "airec.cn-beijing.aliyuncs.com", access_key_id:, access_key_secret:, instance_id:)
      @endpoint = endpoint
      @access_key_id = access_key_id
      @access_key_secret = access_key_secret
      @instance_id = instance_id
    end

    def push_document(table, docs = [])
      resp = roa_client.request(
        method: 'POST',
        uri: "/openapi/instances/#{self.instance_id}/tables/#{table}/actions/bulk",
        body: docs,
        headers: {
          "content-type" => "application/json",
        },
      )
      JSON.parse(resp.body)
    end

    def recommend(scene_id, return_count, user_id: nil, ip: nil, imei: nil)
      resp = roa_client.request(
        method: 'GET',
        uri: "/openapi/instances/#{instance_id}/actions/recommend",
        params: {
          "SceneId" => scene_id,
          "ReturnCount" => return_count,
          "UserId" => user_id,
          "Ip" => ip,
          "Imei" => imei,
        },
        headers: {
          "content-type" => "application/json",
        },
      )
      JSON.parse(resp.body)
    end

    def roa_client
      @roa_client ||= ROAClient.new(endpoint: "https://#{endpoint}", api_version: "2018-10-12", access_key_id: access_key_id, access_key_secret: access_key_secret)
    end
  end
end
