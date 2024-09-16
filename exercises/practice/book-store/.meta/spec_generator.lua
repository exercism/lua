local function render_basket(basket)
  return table.concat(basket, ', ')
end

return {
  module_name = 'book_store',

  generate_test = function(case)
    local template = [[
      local basket = {
        %s
      }
      assert.are.same(%s, book_store.total(basket))]]
    return template:format(render_basket(case.input.basket), case.expected)
  end
}
