Introduction
============

For today(03 sep 2011) great [rails_admin](https://github.com/sferik/rails_admin) gem does not work with another great gem - [acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on), because rails_admin knows nothing about the virtual attributes *_list(tag_list, skill_list etc.), which created by `acts_as_taggable_on` for display and edit tags.

The problem is solved by this gem.

Installation
============

In your `Gemfile`:
    gem 'rails_admin', :git => 'https://github.com/sferik/rails_admin.git'
    gem 'rails_admin_tag_list_field', :git => 'https://github.com/kryzhovnik/rails_admin_tag_list_field.git'

And run:
    $ bundle install

Usage and Configuration
=======================

Gem [rails_admin_tag_list_field](https://github.com/kryzhovnik/rails_admin_tag_list_field) by default does the following:

1. Register new field type `TagList` for rails_admin
2. Finds acts_as_taggable_on virtual attributes (like `*_list`) and adds them to `RailsAdmin.config`
3. Hides associations created by acts_as_taggable_on

For example, this is your model:

    class Player < ActiveRecord::Base
      acts_as_taggable
      acts_as_taggable_on :skills
    end

rails_admin_tag_list_field creates the following fields with type of `:tag_list`:
    tag_list
    skill_list

You can do whatever what allows to do by the rails_admin:

**rename lable**

    RailsAdmin.config do |config|
      config.model Player do
        edit do
          field :tag_list do
            label "Tags"
          end
          field :skill_list
        end
      end
    end

**hide all tag_list fields**

    RailsAdmin.config do |config|
      config.model Player do
        edit do
          fields_of_type :tag_list do
            hide
          end
        end
      end
    end

**reassing partial**

    RailsAdmin.config do |config|
      config.model Player do
        edit do
          fields_of_type :tag_list do
            partial_edit 'awesome_tag_list'
          end
        end
      end
    end

Create you custom partial and put it to `app/views/rails_admin/main/` in your own project folder 


