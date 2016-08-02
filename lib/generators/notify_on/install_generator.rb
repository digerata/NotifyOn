module NotifyOn
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def generate_migration
      attrs = "recipient_id:integer recipient_type:string sender_id:integer \
        sender_type:string unread:boolean trigger_id:integer \
        trigger_type:string description:text"
      generate "migration create_notify_on_notifications #{attrs}"

      gsub_file Dir.glob('db/migrate/*.rb').last, /t\.boolean\ \:unread/,
                't.boolean :unread, :default => true'
    end

  end
end
