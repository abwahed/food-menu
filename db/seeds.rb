# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

seed_data = {
  "menus": [
    {
      "identifier": 'pizza_menu',
      "label": "Pizza Menu",
      "sections": [
        {
          "identifier": 'classic_pizzas',
          "label": "Classic Pizzas",
          "items": [
            {
              "identifier": "pizza_margherita",
              "label": "Margherita Pizza",
              "description": "Classic Margherita Pizza",
              "price": 10.99,
              "item_type": Item.item_types[:product],
              "modifier_groups": []
            },
            {
              "identifier": "pizza_pepperoni",
              "label": "Pepperoni Pizza",
              "description": "Classic Pepperoni Pizza",
              "price": 8.99,
              "item_type": Item.item_types[:product],
              "modifier_groups": []
            }
          ]
        },
        {
          "identifier": 'customizable_pizzas',
          "label": "Customizable Pizzas",
          "items": [
            {
              "identifier": "pizza_custom",
              "label": "Custom Pizza",
              "description": "Build Your Own Pizza",
              "price": 7.99,
              "item_type": Item.item_types[:component],
              "modifier_groups": [
                {
                  "identifier": "size",
                  "label": "Size",
                  "selection_required_min": 1,
                  "selection_required_max": 1,
                  "modifiers": [
                    {
                      "identifier": "small",
                      "label": "Small",
                      "price_override": 0
                    },
                    {
                      "identifier": "medium",
                      "label": "Medium",
                      "price_override": 1.50
                    },
                    {
                      "identifier": "large",
                      "label": "Large",
                      "price_override": 2.50
                    }
                  ]
                },
                {
                  "identifier": "toppings",
                  "label": "Toppings",
                  "selection_required_min": 0,
                  "selection_required_max": 5,
                  "modifiers": [
                    {
                      "identifier": "pepperoni",
                      "label": "Pepperoni",
                      "price_override": 0.50
                    },
                    {
                      "identifier": "mushrooms",
                      "label": "Mushrooms",
                      "price_override": 0.75
                    },
                    {
                      "identifier": "onions",
                      "label": "Onions",
                      "price_override": 0.50
                    },
                    {
                      "identifier": "olives",
                      "label": "Olives",
                      "price_override": 0.75
                    },
                    {
                      "identifier": "extra_cheese",
                      "label": "Extra Cheese",
                      "price_override": 1.00
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

seed_data[:menus].each do |m|
  menu = Menu.create(
    identifier: m[:identifier],
    label: m[:label]
  )

  m[:sections].each do |sec|
    section = Section.create(
      identifier: sec[:identifier],
      label: sec[:label]
    )

    MenuSection.create(
      menu_id: menu.id,
      section_id: section.id
    )

    sec[:items].each do |i|
      item = Item.create(i.except(:modifier_groups))
      SectionItem.create(
        section_id: section.id,
        item_id: item.id
      )
      next if i[:modifier_groups].empty?

      i[:modifier_groups].each do |mg|
        modifier_group = ModifierGroup.create(mg.except(:modifiers))

        ItemModifierGroup.create(
          item_id: item.id,
          modifier_group_id: modifier_group.id
        )

        mg[:modifiers].each do |m|
          Modifier.create(
            item_id: item.id,
            modifier_group_id: modifier_group.id,
            identifier: m[:identifier],
            label: m[:label],
            price_override: m[:price_override]
          )
        end
      end
    end
  end
end
