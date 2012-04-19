module "tinto.sprite tests",
  setup: ->
    @sprite = new tinto.sprite.Sprite
      image: width: 100, height: 200
      x: 10
      y: 20

test "Sprite.width returns the width of the image", ->
  equal 100, @sprite.width

test "Sprite.height returns the height of the image", ->
  equal 200, @sprite.height

test "Sprite.top returns the top of the sprite", ->
  equal 20, @sprite.top

test "Sprite.left returns the left of the sprite", ->
  equal 10, @sprite.left

test "Sprite.bottom returns the bottom of the sprite", ->
  equal 220, @sprite.bottom

test "Sprite.right returns the right of the sprite", ->
  equal 110, @sprite.right

test "Sprite.centerX returns the center X of the sprite", ->
  equal 60, @sprite.centerX

test "Sprite.centerY returns the center of the sprite", ->
  equal 120, @sprite.centerY

test "Sprite.top sets the top of the sprite", ->
  @sprite.top = 50
  equal 50, @sprite.y

test "Sprite.left sets the left of the sprite", ->
  @sprite.left = 50
  equal 50, @sprite.x

test "Sprite.bottom sets the bottom of the sprite", ->
  @sprite.bottom = 200
  equal 0, @sprite.y

test "Sprite.right sets the right of the sprite", ->
  @sprite.right = 200
  equal 100, @sprite.x

test "Sprite.centerX sets the center X of the sprite", ->
  @sprite.centerX = 100
  equal 50, @sprite.x

test "Sprite.centerY sets the center Y of the sprite", ->
  @sprite.centerY = 200
  equal 100, @sprite.y