# middleman-cta

Provides an easy way to define CTAs in your project using a data file and defined structure.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'middleman-cta'
```

Then run bundle.

```
$> bundle install
```

## Usage

In your `data/cta.yml` (or JSON):

```yaml
-
  id: great-cta
  image: name-of-file-in-cta-image-dir.jpg
  url: "http://absolute.url"
```

## Configuration
You can configure the name of the data file, as well as the directory in which the images are stored.

```ruby
activate :cta do |cta|
  cta.cta_directory = 'cta_images'
  cta.cta_data = 'call_to_actions'
end
```
