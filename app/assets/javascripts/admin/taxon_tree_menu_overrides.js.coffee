root = exports ? this

root.taxon_tree_menu = (obj, context) ->

  base_url = Spree.url(Spree.routes.taxonomy_taxons_path)
  admin_base_url = Spree.url(Spree.routes.admin_taxonomy_taxons_path)
  edit_url = admin_base_url.clone()
  edit_url.setPath(edit_url.path() + '/' + obj.attr("id") + "/edit");
  sort_url = admin_base_url.clone()
  sort_url.setPath(sort_url.path() + '/' + obj.attr("id") + "/sort_products");

  create:
    label: "<i class='icon-plus'></i> " + Spree.translations.add,
    action: (obj) -> context.create(obj)
  rename:
    label: "<i class='icon-pencil'></i> " + Spree.translations.rename,
    action: (obj) -> context.rename(obj)
  remove:
    label: "<i class='icon-trash'></i> " + Spree.translations.remove,
    action: (obj) -> context.remove(obj)
  sort:
    separator_before: true,
    label: "<i class='icon-th'></i> " + Spree.taxonomy_translations.sort_products,
    action: (obj) -> window.location = sort_url
  edit:
    separator_before: true,
    label: "<i class='icon-edit'></i> " + Spree.translations.edit,
    action: (obj) -> window.location = edit_url.toString()
