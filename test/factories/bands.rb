Factory.define :beatles, :class => Band do |b|
  b.name 'Beatles'
  b.size 4
  b.country 'uk'
  b.genre 'pop'
end

Factory.define :stones, :class => Band do |b|
  b.name 'Rolling Stones'
  b.size 4
  b.country 'us'
  b.genre 'rock'
end

Factory.define :simon_and_garfunkel, :class => Band do |b|
  b.name 'Simon & Garfunkel'
  b.size 2
  b.country 'us'
  b.genre 'pop'
end

Factory.define :abba, :class => Band do |b|
  b.name 'Abba'
  b.size 4
  b.country 'se'
  b.genre 'pop'
end