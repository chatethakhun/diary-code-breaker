import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
  const roomContainer = $('#room-id')
  const roomId = Number(roomContainer.data('roomId'))

  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
  consumer.subscriptions.create({channel: "RoomChannel", room_id: roomId}, {
    connected() {
      console.log('connected... ', roomId)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const userContainer = $('#user-id')
      const userId = Number(userContainer.data('userId'))

      let html
      if(userId == data.message.user_id) {
        html = data.mine
      } else {
        html = data.their
      }
      $('.chat-messages').append(html)
      $('#message_content').val('')
      // Called when there's incoming data on the websocket for this channel
    }
  });
})

