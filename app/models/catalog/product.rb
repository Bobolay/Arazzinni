class Catalog::Product < ActiveRecord::Base
  attr_accessible *attribute_names
  belongs_to :category
  globalize :name, :content
  image :image



  boolean_scope :published

  def self.get_products
    product_classes = [Catalog::Products::Processor, Catalog::Products::Door]
    product_classes.first.published.joins(:translations ).merge(product_classes.second.published.joins(:translations, product_info: :translations))

  end

  scope :processors, -> { Catalog::Products::Processor.published.joins(:translations) }



  def self.generate_processors(count = 100, image = true)
    model = Catalog::Products::Processor
    filenames = Dir[Rails.root.join("app/assets/images/hardware/*").to_s]
    total_products_count = Catalog::Product.count
    model.bulk_insert do |worker|
      count.times do |i|
        id = total_products_count + i + 1

        h = {published: 't', price: rand(10..32000)}
        image_file = nil
        if image
          image_file = File.open(filenames[rand(0..(filenames.count - 1))])
        end

        worker.add(h)
        if image_file
          image_file.close()
        end
      end

      worker.save!



    end

    model.translation_class.bulk_insert do |worker|
      count.times do |i|
        id = total_products_count + i + 1

        I18n.available_locales.each{|locale| worker.add(catalog_product_id: id, locale: locale, name: "Product-#{locale}-#{id}")  }

      end

      worker.save!
    end
  end


end
