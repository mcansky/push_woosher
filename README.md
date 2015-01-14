# PushWoosher

Push Woosher is a simple wrapper for Push Woosh. While there is already other
ones this ome is aimed to be simple, allow register, unregister devices and
send push notifications.

## Installation

Add this line to your application's Gemfile:

    gem 'push_woosher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install push_woosher

## Usage

You need to configure your access :

```
PushWoosher.configure do |config|
  config.application_code = 'APPP-IDDD'
  config.api_token = 'the-api-token'
end
```

### Devices handling

This gem for now supports only 2 types of devices : Ios and Android.

You need 2 identifiers for each device : the usual token and a hardware token.

#### iOS

To register an iOS device you need to use the following :

```
  device = PushWoosher::Device::Ios.new(
             token: token,
             hwid: some_other_id
           )
  device.register
```

That method will return either true or a hash with the status code and response
body.

To unregister you need to use the following :

```
  device.unregister
```

#### Android

To register an Android device you need to use the following :

```
  device = PushWoosher::Device::Android.new(
             token: token,
             hwid: some_other_id
           )
  device.register
```

That method will return either true or a hash with the status code and response
body.

To unregister you need to use the following :

```
  device.unregister
```

### Push Messages

Sending a push message to a device requires the token and the notification hash.

Depending on the device type you need to use one of the following format :

```
# iOS
{
  send_date: 'now',
  ignore_user_timezone: true,
  content: 'PUSH MESSAGE',
  data: {
    user_id: 1,
    notification_type: 2
  },
  platforms: [1],
  ios_root_params: {
    aps: { content-available: 1 }
  },
  devices: ['device-token']
}

# Android
{
  send_date: 'now',
  ignore_user_timezone: true,
  content: 'PUSH MESSAGE',
  data: {
    user_id: 1,
    notification_type: 2
  },
  platforms: [3],
  android_root_params: {
    { bob: 1 }
  },
  devices: ['device-token']
}
```

Notice that most of then content is similar, only the *ios_root_params*, *android_root_params* and *platforms* keys are different.

To allow finer control on the content the input will stay that way, we suggest you to use a formatter class in your app to simplify things for your needs.

Sending a push notification itself can be done as follow :

```
notification = {} # use the format seen previously

push = PushWoosher::Push.new(notification: notification)

push.post
```

PushWoosh shows the push history easily in their web panel.

## Requirements

This gems uses Virtus to make things easier internally. There is no dependency on ActiveSupport.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/push_woosher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
