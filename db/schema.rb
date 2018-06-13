# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180613113851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1
    t.string "name"
    t.boolean "active", default: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "advantage_disadvantages", force: :cascade do |t|
    t.bigint "post_id"
    t.integer "kind"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_advantage_disadvantages_on_post_id"
  end

  create_table "advertisers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alerts", force: :cascade do |t|
    t.integer "kind", default: 0
    t.bigint "user_id"
    t.bigint "category_id"
    t.bigint "brand_id"
    t.integer "status", default: 0
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_alerts_on_admin_id"
    t.index ["brand_id"], name: "index_alerts_on_brand_id"
    t.index ["category_id"], name: "index_alerts_on_category_id"
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "approved_points", force: :cascade do |t|
    t.integer "kind", default: 0
    t.decimal "points", default: "0.0"
    t.integer "views", default: 0
    t.bigint "user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_approved_points_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "link"
    t.integer "view_count"
    t.integer "click_count"
    t.datetime "activate_from"
    t.datetime "activate_by"
    t.integer "activate_by_view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "block", default: 0
    t.integer "open_link_in", default: 0
    t.boolean "lock_in_the_block", default: false
    t.boolean "display_everywhere", default: false
    t.string "mobile_image"
    t.string "tablet_image"
    t.string "background_image"
  end

  create_table "brands", force: :cascade do |t|
    t.string "title"
    t.datetime "deleted_at"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "description"
    t.integer "status", default: 0
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.bigint "parent_id"
    t.datetime "deleted_at"
    t.integer "position", default: 0
    t.boolean "popular", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "section_id"
    t.integer "status", default: 0
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["section_id"], name: "index_categories_on_section_id"
  end

  create_table "category_banners", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "banner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_category_banners_on_banner_id"
    t.index ["category_id"], name: "index_category_banners_on_category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["post_id"], name: "index_complaints_on_post_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "file_items", force: :cascade do |t|
    t.string "name"
    t.string "namehash"
    t.string "attached_file"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_likes_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.integer "kind", default: 0
    t.string "old_title"
    t.text "old_text"
    t.text "old_description"
    t.index ["post_id"], name: "index_notifications_on_post_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "page_banners", force: :cascade do |t|
    t.bigint "page_id"
    t.bigint "banner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_page_banners_on_banner_id"
    t.index ["page_id"], name: "index_page_banners_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "meta_description"
    t.text "meta_keywords"
    t.integer "kind", default: 0
    t.string "title"
    t.boolean "required", default: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "deleted_at"
    t.integer "product_id"
    t.integer "position"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.string "images", array: true
    t.boolean "recommended", default: false
    t.integer "rating", default: 0
    t.datetime "updated_at_by_owner"
    t.string "disapproval_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "version"
    t.boolean "editable"
    t.text "description"
    t.datetime "recommended_from"
    t.datetime "recommended_to"
    t.index ["product_id", "user_id"], name: "index_posts_on_product_id_and_user_id", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "brand_id"
    t.integer "category_id"
    t.decimal "rating"
    t.datetime "deleted_at"
    t.integer "user_id"
    t.string "model"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["title"], name: "index_products_on_title"
  end

  create_table "queries", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_queries_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "issue"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ratings_on_product_id"
    t.index ["user_id", "product_id"], name: "index_ratings_on_user_id_and_product_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "svg"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "supports", force: :cascade do |t|
    t.text "question"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_taggings_on_post_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "blocked_from"
    t.datetime "blocked_to"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "nickname"
    t.string "avatar"
    t.string "number"
    t.integer "status", default: 0
    t.decimal "points", default: "0.0"
    t.integer "spent_points", default: 0
    t.integer "level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.boolean "approve", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_views_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_views_on_post_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

  add_foreign_key "advantage_disadvantages", "posts"
  add_foreign_key "alerts", "admins"
  add_foreign_key "alerts", "brands"
  add_foreign_key "alerts", "categories"
  add_foreign_key "alerts", "users"
  add_foreign_key "approved_points", "users"
  add_foreign_key "authorizations", "users"
  add_foreign_key "categories", "sections"
  add_foreign_key "category_banners", "banners"
  add_foreign_key "category_banners", "categories"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "complaints", "posts"
  add_foreign_key "complaints", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "notifications", "posts"
  add_foreign_key "notifications", "users"
  add_foreign_key "page_banners", "banners"
  add_foreign_key "page_banners", "pages"
  add_foreign_key "posts", "users"
  add_foreign_key "queries", "users"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
  add_foreign_key "views", "posts"
  add_foreign_key "views", "users"
end
