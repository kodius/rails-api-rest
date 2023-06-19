dev:
	RAILS_ENV=development bin/rails server 
test\:swag:
	RAILS_ENV=test rails rswag
test\:unit:
	RAILS_ENV=test rspec spec/unit
migrate:
	RAILS_ENV=development bin/rails db:migrate
