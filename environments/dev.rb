name "dev"
description "Development environment"
cookbook "apache", "= 0.1.5"
override_attributes({
	"author" => {
		"name" => "Fernando Juste - Dev"
	}
})

#default_attributes({}) vai fazer o override dos atributos default
