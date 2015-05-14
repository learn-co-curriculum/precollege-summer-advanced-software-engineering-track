# Code Snippets - Seeds

### Use this to create a photos table. 

```ruby
class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :link
    end
  end

  def down
  	drop_table :photos
  end
end
```