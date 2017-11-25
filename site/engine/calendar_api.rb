require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'
require 'yaml'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Montazownia booking'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-ruby-quickstart.yaml")
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
CALENDAR_FILE = 'calendars.yaml'
##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'montazownia.tattoo'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

def print_event(event)
  start_date = event.start.date || event.start.date_time
  end_date  = event.end.date || event.end.date_time
  puts "\t- #{event.summary}:"
  puts "\t\t >> #{start_date.inspect}"
  puts "\t\t >> #{end_date.inspect}"
end

#Get events for specified calendar
def get_calendar_events(service, calendar)
  calendar_name = calendar[1]['name']
  calendar_id = calendar[1]['id']
  response = service.list_events(calendar_id,
                                 single_events: true,
                                 order_by: 'startTime',
                                 time_min: Time.now.iso8601)
  puts "Upcoming events for #{calendar_name}:"
  puts "No upcoming events found" if response.items.empty?
  response.items.each do |event|
    print_event(event)
  end
end

# Initialize the API
def call_api
  service = Google::Apis::CalendarV3::CalendarService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  calendars_file = YAML.load_file(CALENDAR_FILE)
  calendars_file['calendars'].each do |calendar|
    get_calendar_events(service, calendar)
  end
end

call_api
