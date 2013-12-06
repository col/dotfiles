require 'rubygems'
require 'github_api'

# Add the projects you are a component owner of here.
# Should probably keep watching stencil because it is a good forum for group discussion about how to improve it
keep_watching = [
  'stencil',
  'charris', 
  'business-systems/media-bill-to-contact-changes', 
  'business-systems/media-bill-to-contact-sync', 
  'business-systems/media-billee-orchestrator', 
  'business-systems/media-dev-splunk', 
  'business-systems/media-proj-billing-acct-changes', 
  'business-systems/media-proj-billing-acct-sync', 
  'business-systems/media-project-changes', 
  'business-systems/media-project-client-changes', 
  'business-systems/media-project-sync', 
  'business-systems/media-projects', 
  'business-systems/media-projects-billee-ready', 
  'business-systems/media-riva-sync',
  'business-systems/pact',
  'business-systems/rack-hal_browser',
  'business-systems/billee',
  'business-systems/biq-deploy',
  'business-systems/biq-topologies',
  'business-systems/timetable']
  
oauth_token = "5d2b018244bf715f1372dc9adddceeebef261eae"

github_client = Github.new do |config|
  config.endpoint = 'https://git.realestate.com.au/api/v3'
  config.site = 'https://git.realestate.com.au'
  config.oauth_token = oauth_token
  config.adapter = :net_http
  config.ssl = {:verify => false}
  config.auto_pagination = true
end

un_subscriptions = github_client.activity.watching.watched
  .find_all{ | p| keep_watching.none?{ | keep |  p["full_name"] =~ Regexp.new(keep) }  }
  .collect{ | sub | {name: sub["name"], owner: sub["owner"]["login"]} }

puts "You will be unsubscribed from notifications for the following repositories:"
puts un_subscriptions.collect{ | un_subscription | "#{un_subscription[:owner]}/#{un_subscription[:name]}" }.sort.join("\n")
puts "Please review the projects listed above to make sure you want to be unsubscribed from all of them. Press ctl+d to continue, or ctl+c to cancel."
$stdin.read

un_subscriptions.each do | un_subscription |
  puts "Unsubscribing from #{un_subscription[:owner]}/#{un_subscription[:name]}"
  github_client.activity.watching.unwatch un_subscription[:owner], un_subscription[:name]
end
