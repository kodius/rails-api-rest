dev:
	RAILS_ENV=development bin/rails server 
test\:swag:
	RAILS_ENV=test rails rswag
test\:unit:
	RAILS_ENV=test rspec spec/services
migrate:
	RAILS_ENV=development bin/rails db:migrate
swagger:
	RAILS_ENV=development bundle exec rake rswag:specs:swaggerize
