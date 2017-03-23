default["apache"]["sites"]["fjuste2a"] = {"site_title" => "Juste será publicado em breve", "port" => 80, "domain" => "jn2-linux2b.mylabserver.com"}
default["apache"]["sites"]["fjuste2b"] = {"site_title" => "Juste 2 será publicado em breve", "port" => 80, "domain" => "jn2-linux2b2.mylabserver.com"}
default["apache"]["sites"]["fjuste3"] = {"site_title" => "Juste 3 será publicado em breve", "port" => 80, "domain" => "jn2-linux3.mylabserver.com"}

default["author"]["name"] = "Fernando Juste - attr"

case node["platform"]
	when "centos"
		default["apache"]["package"] = "httpd"

	when "ubuntu"
		default["apache"]["package"] = "apache2"
end
