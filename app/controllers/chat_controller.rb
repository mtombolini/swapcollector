class ChatController < ApplicationController
    before_action :set_chat, only: [:show, :destroy, :send message]


    def index
        @chats = current_user.chats
    end

    def show
        @messages = @chat.messages.order(created_at: :asc)
        @new_message = Messa
    end

    def send_message
        @message = @chat.messages.build(message_params)
        @message.user = current_user

        if @message.save
            redirect_to @chat, notice: 'Mensaje enviado'
        else
            flash[:alert] = 'No se pudo enviar el mensaje'
            render :show
        end
    end

    def create
        user1 = User.find(params[:user1_id])
        user2 = User.find(params[:user2_id])
        @chat = Chat.new(user1: user1, user2: user2)

        if @chat.save
            redirect_to @chat, notice: 'Chat creado'
        else
            redirect_to root_path, alert: 'No se pudo crear el chat'
        end
    end

    def destroy
        @chat.destroy
        redirect_to root_path, notice: 'Chat eliminado'
    end

    private

    def set_chat
        @chat = Chat.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:content)
    end
end
