FactoryGirl.define do
  factory :user do
    name 'Telperion'
    email 'telperion@redwoods.com'
    password 'password'
  end

  factory :post do
    title 'Alberta Park'
    body 'Alberta Park is a park located in northeast Portland, Oregon. Acquired in 1921, the park includes a basketball court, dog off-leash area, playground, soccer field, softball field and tennis court, as well as paved and unpaved paths and picnic tables. The park is maintained by a volunteer group known as Friends of Alberta Park.'
  end

  factory :tag do
    name 'Frisbee'
  end

  factory :comment do
    content 'Let\'s play frisbee!'
  end
end
