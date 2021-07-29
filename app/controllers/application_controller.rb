class ApplicationController < ActionController::API
    before_action :authenticate

    def authenticate
        auth_header = request.headers[:authorization]
  
        if !auth_header
            render json: {error: 'You must be logged in.'}, status: :forbidden
        else
            token = auth_header.split(' ')[1]
  
            begin
                decoded_token = JWT.decode token, 'this is our little secret'
                user_id = decoded_token.first['user_id']
    
                @user = User.find user_id
            rescue
                render json: { error: 'Invalid token.' }, status: :forbidden
            end
            
        end
        
    end
end
