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

If you prefer, you can link using a sitemap descriptor instead - meaning any item defined in your middelman site.

```json
[
  {
    "id": "great-cta",
    "image": "name-of-file-in-cta-image-dir.jpg",
    "url": "/my/great/page/index.html"
  }
]
```

## Configuration
You can configure the name of the data file, as well as the directory in which the images are stored.

```ruby
activate :cta do |cta|
  cta.cta_directory = 'cta_images'
  cta.cta_data = 'call_to_actions'
end
```

## Rendering

We support two template engines by default, ERB and Markdown.  For Markdown support, we currently only support Redcarpet as the markdown engine.


### ERB
You have access to a helper method to use in ERB:

```ruby
<h2>Signup Now</h2>
<%= cta('unique-cta-id') %>
```

### Markdown

```markdown
## Signup Now
[cta:unique-cta-id]
```
