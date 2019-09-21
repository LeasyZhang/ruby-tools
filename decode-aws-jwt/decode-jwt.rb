require json-jwt

def decode_jwt(oidc_token, keys_url)
    header = oidc_token.split(".")[0]
    payload = oidc_token.split(".")[1]

    begin
        jwk_set = JSON::JWK::Set.new(
            JSON.parse(
                HTTP.get(keys_url).body
            )
          )
        id_token = JSON::JWT.decode oidc_token, jwk_set
        decoded_token = Base64.decode64(message)
        puts decoded_token
    rescue
        puts "failed to verify token"
    end
end