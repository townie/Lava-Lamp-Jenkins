# Jenkins Build Lava Lamp Monitoring script

Always wanted to monitor your build using a lava lamp, light, fan, any other possible thing you can turn on/off to alert you that your build is broken? Well this is the project for you.

## This setup is for you!


### Things you need: 

[Raspbery Pi + stuff](http://amzn.to/1TARIfm) 

[Storm trooper](http://amzn.to/1Qu69vd)

[Skull Lava Lamp](http://amzn.to/1Q6ltPd)

[5V relay](http://amzn.to/1Qu6u0Y)

[3Ft extension cord ](http://amzn.to/1Q6m4jT)

[Electrical Tape](http://amzn.to/1QxIMqU)

### Setup the hardware

1) get pi
2) setup pi
3) ???
4) Profit


### Setup the software

1) ssh pi@stuff
2) config stuff
3) ???
4) Profit



`
ssh into raspberry pi
`


```ruby

sudo apt-get install ruby-full
sudo apt-get -y install build-essential openssl libssl-dev pkg-config libxml2-dev liblzma-dev zlib1g-dev

# sudo gem install is terrible but needed for some of the low level access to GPIO
sudo gem install 'jenkins_api_client' --ruby=/usr/bin/ruby2.1
sudo gem install 'pi_piper'
sudo gem install 'jenkins_api_client'

```

Create a cron task to check run the check every minute

```ruby
sudo nano /var/spool/cron/crontabs/root
# then add this line with the correct path
* * * * * ruby /home/pi/jenkins_build/jenkins_lava.rb

```


