-- scaffold geniefile for curl

curl_script = path.getabsolute(path.getdirectory(_SCRIPT))
curl_root = path.join(curl_script, "curl")

curl_includedirs = {
	path.join(curl_script, "config"),
	curl_root,
}

curl_libdirs = {}
curl_links = {}
curl_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { curl_includedirs }
	end,

	_add_defines = function()
		defines { curl_defines }
	end,

	_add_libdirs = function()
		libdirs { curl_libdirs }
	end,

	_add_external_links = function()
		links { curl_links }
	end,

	_add_self_links = function()
		links { "curl" }
	end,

	_create_projects = function()

project "curl"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		curl_includedirs,
	}

	defines {}

	files {
		path.join(curl_script, "config", "**.h"),
		path.join(curl_root, "**.h"),
		path.join(curl_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
