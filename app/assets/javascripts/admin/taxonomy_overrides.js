var taxonomy_id; 

$(document).ready(function(){
  if(taxonomy_id!=undefined){

    base_url = $("#taxonomy_tree").data("url").split("?")[0] + "/" ;
    child_url = base_url.replace("/taxons", "/get_children.json");
    
    is_cut = false;
    last_rollback = null;

    var conf = {
      json_data : {
        "data" : initial,
        "ajax" : {
          "url" : child_url,
          "data" : function (n) {
            return { parent_id : n.attr ? n.attr("id") : 0 };
          }
        }
      },
      "themes" : {
        "theme" : "apple",
        "url" : "/assets/jquery.jstree/themes/apple/style.css"
      },
      "strings" : {
        "new_node" : new_taxon,
        "loading" : Spree.translations.loading + "..."
      },
      "crrm" : {
        "move" : {
          "check_move" : function (m) {
            var position = m.cp;
            var node = m.o;
            var new_parent = m.np;

            if(!new_parent) return false; //no parent

            if(node.attr("rel")=="root") return false; //can't drag root

            if(new_parent.attr("id")=="taxonomy_tree" && position==0) return false; // can't drop before root

            return true;

          }
        }
      },
      "contextmenu" : {
         "items" : function(obj) {
            var id_of_node = obj.attr("id");
            var type_of_node = obj.attr("rel");
            var menu = {};
            if(type_of_node == "root") {
              menu = {
                "create" : {
                  "label"            : "<i class='icon-plus'></i> " + Spree.translations.add,
                  "action"           : function (obj) { this.create(obj); }
                },
                 "paste" : {
                   "separator_before" : true,
                   "label"            : "<i class='icon-paste'></i> " + Spree.translations.paste,
                   "action"           : function (obj) { is_cut = false; this.paste(obj); },
                   "_disabled"        : is_cut == false
                },
                "edit" : {
                  "separator_before" : true,
                  "label"            : "<i class='icon-edit'></i> " + Spree.translations.edit,
                  "action"           : function (obj) { window.location = base_url + obj.attr("id") + "/edit/"; }
                },
                "sort" : {
                  "separator_before" : true,
                  "label"            : "<i class='icon-th'></i> " + Spree.taxonomy_translations.sort_products,
                  "action"           : function (obj) { window.location = base_url + obj.attr("id") + "/sort_products/"; }
                }
              }
            } else {
              menu =  {
                "create" : {
                  "label"            : "<i class='icon-plus'></i> " + Spree.translations.add,
                  "action"           : function (obj) { this.create(obj); }
                },
                "rename" : {
                  "label"            : "<i class='icon-pencil'></i> " + Spree.translations.rename,
                  "action"           : function (obj) { this.rename(obj); }
                },
                "remove" : {
                  "label"            : "<i class='icon-trash'></i> " + Spree.translations.remove,
                  "action"           : function (obj) { this.remove(obj); }
                },
                "cut" : {
                  "separator_before" : true,
                  "label"            : "<i class='icon-cut'></i> " + Spree.translations.cut,
                  "action"           : function (obj) { is_cut = true; this.cut(obj); }
                },
                "paste" : {
                  "label"            : "<i class='icon-paste'></i> " + Spree.translations.paste,
                  "action"           : function (obj) { is_cut = false; this.paste(obj); },
                  "_disabled"        : is_cut == false
                },
                "edit" : {
                  "separator_before" : true,
                  "label"            : "<i class='icon-edit'></i> " + Spree.translations.edit,
                  "action"           : function (obj) { window.location = base_url + obj.attr("id") + "/edit/"; }
                },
                "sort" : {
                  "separator_before" : true,
                  "label"            : "<i class='icon-th'></i> " + Spree.taxonomy_translations.sort_products,
                  "action"           : function (obj) { window.location = base_url + obj.attr("id") + "/sort_products/"; }
                }
              }
            }
            return menu;
        }
      },

      "plugins" : [ "themes", "json_data", "dnd", "crrm", "contextmenu"]
    }

    $("#taxonomy_tree").jstree(conf)
      .bind("move_node.jstree", handle_move)
      .bind("remove.jstree", handle_delete)
      .bind("create.jstree", handle_create)
      .bind("rename.jstree", handle_rename);

    $("#taxonomy_tree a").on("dblclick", function (e) {
     $("#taxonomy_tree").jstree("rename", this)
    });


    $(document).keypress(function(e){
      //surpress form submit on enter/return
      if (e.keyCode == 13){
          e.preventDefault();
      }
    });
  }
});
