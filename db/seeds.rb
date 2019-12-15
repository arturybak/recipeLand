# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.new
user1.email = 'user1@example.com'
user1.password = 'password1'
user1.password_confirmation = 'password1'
user1.save!

user2 = User.new
user2.email = 'user2@example.com'
user2.password = 'password2'
user2.password_confirmation = 'password2'
user2.save!

#All recipes taken from foodista.com under CC license
recipe1 = Recipe.new
recipe1.title = "Brown Sugar Cookies!"
recipe1.description = "Sugar meets butter and just like that you have this  perfectly crisp cookies. Add another touch of sugar on the outside and then you will never be the same.
  Those cookies were a lot of fun to put together and my son has not stopped eating them. I have helped too just in case you were wondering."

recipe1.user_id = user1.id
recipe1.image.attach(io: File.open('app/assets/images/cookies.jpg'),filename: 'cookies.jpg', content_type: 'image/jpg')
recipe1.ingredients_attributes = [{ name: "1 cup unsalted butter, softened" }, { name: "1 1/2 cup firmly packed dark brown sugar" }, { name: "1 large egg" },
  { name: "1 teaspoon vanilla extract" }, { name: "3 1/3 cups all-purpose flour" }, { name: "1 teaspoon baking soda" }, { name: "1/2 teaspoon salt" }, { name: "decorator sugar crystals" }]

recipe1.directions_attributes = [{ step: "Beat butter at medium speed with an electric mixer until creamy. Gradually add brown sugar, beating well. Add egg and vanilla and continue beating." },
  { step: "Combine flour, soda, and salt. Add to butter mixture little at the time and beating until well blended." },
  { step: "Preheat oven to 350F." },
  { step: "Roll dough to ¼ inch thickened between 2 sheets of wax or parchment paper. Cut into favorite shape, stars for me.
    Place 1 inch apart on ungreased baking sheets. Sprinkle cookies with decorator crystals." },
  { step: "Bake for 10 to 12 minutes or until golden. Let cookies cool on baking sheet for a minute. Transfer carefully to a wire rack to cool completely." }]

recipe1.save!


recipe2 = Recipe.new
recipe2.title = "Avocado Soup!"
recipe2.description = "I am in a soup kind of mood lately, but when you purchase way too many avocados and they all are ripe at the same time, creativity comes on hand.
  This is my creation and with an handful of ingredients and no more than 20 minutes of cooking time,
  you will have an elegant soup that can be served chilled in the summer months and warm in the cooler months."

recipe2.user_id = user2.id
recipe2.image.attach(io: File.open('app/assets/images/avocado-soup.jpg'),filename: 'avocado-soup.jpg', content_type: 'image/jpg')
recipe2.ingredients_attributes = [{ name: "2 tablespoons olive oil" }, { name: "2 tablespoons unsalted butter" }, { name: "4 garlic cloves, peeled" },
  { name: "1 cup parsley, finely chopped" }, { name: "1 cup onion, finely chopped" }, { name: "4 ripe avocados" }, { name: "1/2 teaspoon white pepper" }, { name: "1 teaspoon hot sauce" },
  { name: "4 cups vegetable broth" }, { name: "Juice from 1 lemon" }, { name: "sour cream & pomegranate seeds for decoration" }]

recipe2.directions_attributes = [{ step: "Heat the olive oil and butter in a pan over medium high heat until the butter melts.
    Add the onion and garlic until completely soft and translucent, 10-15 minutes stirring occasionally. Stir in the parsley and cook for 1 minute." },
  { step: "Roughly cut the avocado and add it to the onion mixture. Add the chicken broth, salt, pepper, lemon juice and hot sauce. Cook over medium heat for 10 minutes." },
  { step: "Working in batches if necessary, place the soup in a blender or food processor and puree until smooth. Taste for seasoning." },
  { step: "Serve hot with a dollop of sour cream." }]

recipe2.save!

recipe3 = Recipe.new
recipe3.title = "Pumpkin Ginger Soup!"
recipe3.description = "Pumpkin Season is here! And to welcome this time of year and warm up our crispy autumn day with this velvety Pumpkin Ginger Soup.
  Very easy to assemble it. Can be enjoyed hot and room temperature. And stores well.
  All great addition to your favorite recipes at this time of year when we are looking for something new for the upcoming holiday."

recipe3.user_id = user1.id
recipe3.image.attach(io: File.open('app/assets/images/pumpkin-soup.jpg'),filename: 'pumpkin-soup.jpg', content_type: 'image/jpg')
recipe3.ingredients_attributes = [{ name: "1 3/4 cup pumpkin" }, { name: "1 14.5 ounces can vegetable broth" }, { name: "1 1/2 cups mango nectar" },
  { name: "1 tablespoon grated fresh ginger" }, { name: "3 garlic cloves minced" }, { name: "1 5 ounces can evaporated milk" }, { name: "1/3 cup creamy peanut butter" },
  { name: "2 tablespoons rice vinegar" }, { name: "Dash of hot pepper sauce" }, { name: "Sour cream (optional)" }]

recipe3.directions_attributes = [{ step: "In a large saucepan combine the pumpkin, chicken stock, mango nectar, grated ginger and minced garlic.
    Bring to a boil, reduce heat and simmer uncovered for 30 minutes. Stir occasionally." },
  { step: "Whisk in the evaporated milk, peanut butter, rice vinegar, hot sauce until smooth." },
  { step: "If desired top servings with sour cream." }]

recipe3.save!


recipe4 = Recipe.new
recipe4.title = "Cuban Mojito!"
recipe4.description = "The classic Cuban Mojito has a minty, slightly tart tang with a little punch from the rum."

recipe4.user_id = user2.id
recipe4.image.attach(io: File.open('app/assets/images/mojito.jpg'),filename: 'mojito.jpg', content_type: 'image/jpg')
recipe4.ingredients_attributes = [{ name: "1/2 fresh lime" }, { name: "1 tsp caster sugar" }, { name: "12 fresh, small mint leaves" },
  { name: "50 – 60 ml white Cuban rum" }, { name: "Crushed or/and cubed ice" }, { name: "Dash of sparkling water" }, { name: "Sprig of fresh mint and lime wedge, to garnish" }]

recipe4.directions_attributes = [{ step: "Cut a round slice of lime, 1 cm thick and slice it into 4 equal parts.
    Put the four lime wedges into a glass, then add the sugar and muddle (squish everything together) to release the lime juice and aroma.
    Do it gently because hard squishing may release the bitterness from the white part of the lime." },
  { step: "Put the mint leaves on one hand and clap in order to lightly bruise the leaves to releases the aroma.
    Rub the mint leaves around the rim of the glass and drop them in. Use a muddler, bar spoon (or even a rolling pin) to gently push the mint down into the lime juice." },
  { step: "Half fill the glass with crushed ice and pour in the rum. Stir the mix together until the sugar dissolves" },
  { step: "Top up with crushed ice, a splash of the sparkling water and garnish it with a sprig of mint." }]

recipe4.save!
