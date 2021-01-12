Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day', #作りたいpredicate名
                       arel_predicate: 'lteq', #変えたいpredicate名
                       formatter: proc { |v| v.end_of_day }
end
