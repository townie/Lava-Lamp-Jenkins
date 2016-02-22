require 'dotenv'; Dotenv.load
require 'pi_piper'
require 'jenkins_api_client'

@client = JenkinsApi::Client.new(:server_ip => ENV['SERVER_IP'],
         						 :username => ENV["USERNAME"], 
         						 :password => ENV["PASSWORD"])

# The Job name of the test suite you want to test
job_name = ENV["JOB_NAME"]

# most recent build or current build
if @client.job.status(job_name) == 'running'
  number = @client.job.get_builds(job_name)[1]["number"]
else
  number = @client.job.get_builds(job_name)[0]["number"]
end

res = @client.job.get_build_details(job_name, number)

control_pin = ENV["CONTROL_PIN"]

# make sure the pin is free
`echo #{control_pin}  > /sys/class/gpio/unexport`

# initialize the pin
pin = PiPiper::Pin.new(:pin => control_pin, :direction => :out)

# if its anything but a SUCCESS you broke it, turn on light
if res['result'] == "SUCCESS"
  pin.off
else
  pin.on
end
