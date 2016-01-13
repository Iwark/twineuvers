namespace :twitter do
  # descの記述は必須
  desc "Account"

  task update_profile: :environment do
    result = Benchmark.realtime do
      session = GoogleDrive.saved_session(File.expand_path('../../../config/google_token.json', __FILE__))
      ws = session.spreadsheet_by_key("1Z0rt45NJoQdbUvamK5K_8Sc_oq66b_tdTzKF6WI2Md8").worksheets[0]

      (1..ws.num_rows).each do |row|
        next if row <= 2
        account      = ws[row, 1]
        c_key        = ws[row, 2]
        c_secret     = ws[row, 3]
        a_token      = ws[row, 4]
        a_secret     = ws[row, 5]
        pattern      = ws[row, 6]
        refreshed    = ws[row, 7]
        name         = ws[row, 8]
        url          = ws[row, 9]
        location     = ws[row, 10]
        description  = ws[row, 11]
        p_link_color = ws[row, 12]
        p_bg_image   = ws[row, 13]
        p_banner     = ws[row, 14]
        p_image      = ws[row, 15]

        next unless refreshed.blank?
        next if c_key.blank? || c_secret.blank? || a_token.blank? || a_secret.blank?

        client = Twitter::REST::Client.new(
          consumer_key:        c_key,
          consumer_secret:     c_secret,
          access_token:        a_token,
          access_token_secret: a_secret
        )

        option = {}
        option[:name]               = name unless name.blank?
        option[:url]                = url unless url.blank?
        option[:location]           = location unless location.blank?
        option[:description]        = description unless description.blank?
        option[:profile_link_color] = p_link_color unless p_link_color.blank?

        begin
          client.update_profile(option)
        rescue => e
          p e
          next
        end

        if p_bg_image.present?
          begin
            client.update_profile_background_image(open(p_bg_image), {tile: true, use: true})
          rescue => e
            p e
            next
          end
        end

        if p_banner.present?
          begin
            client.update_profile_banner(open(p_banner))
          rescue => e
            p e
            next
          end
        end

        if p_image.present?
          begin
            client.update_profile_image(open(p_image))
          rescue => e
            p e
            next
          end
        end

        ws[row, 7] = 1

      end

      ws[1,2] = Time.zone.now.strftime('%Y-%m-%d %H:%M')
      ws.save

    end

    puts "twitter:update_profile: #{result}s"

  end

end