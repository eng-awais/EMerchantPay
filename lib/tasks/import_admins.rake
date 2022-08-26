# frozen_string_literal: true

require 'csv'
desc 'The function of this task is to create admin users from CSV'
namespace :task do
  task :import_admins, [:filename] => [:environment] do |_task, args|
    csv_file = File.open(Rails.public_path.join(args[:filename]))
    CSV.parse(csv_file, headers: true, col_sep: ',', skip_blanks: true).each do |row|
      user = User.new(parse_row(row))
      user.save
    end
  end

  def parse_row(row)
    { email: row.dig('email'), role: row.dig('role'), password: row.dig('password') }
  end
end
