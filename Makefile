.PHONY: rsync push registry_login login

login:
	make registry_login GITHUB_TOKEN=$$GITHUB_TOKEN

github_token = ${GITHUB_TOKEN}

rsync:
	rsync -av --progress --delete ../../urmanac/socryx-topled.arvo.network ./assets/socryx-topled.arvo.network

push:
	spin registry push ghcr.io/urmanac/urmanac-beta:0.1.0

registry_login:
	spin registry login ghcr.io -u kingdonb -p $(github_token)
