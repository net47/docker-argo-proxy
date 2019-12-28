# docker-argo-proxy
A small container acting as a proxy for Cloudflare Argo. 

Full documentation here: [https://developers.cloudflare.com/argo-tunnel/reference/docker/](https://developers.cloudflare.com/argo-tunnel/reference/docker/)

#### Pre-requirements:

* Active Argo subscription
* Authorize Argo and download your certificate: [https://dash.cloudflare.com/warp](https://dash.cloudflare.com/warp)

#### Build it:
```
docker build --no-cache -t MyCompany/argo-proxy .
```

#### Explaining the mount volumes:

* ```cert.pem```: your certificate from the Argo authorization, make sure that the name is ```cert.pem```
* ```suvervisord.conf```: supervisord config, no need to change that
* ```config.yaml```: change URL and other options to your needs, see the [command-line arguments](https://developers.cloudflare.com/argo-tunnel/reference/arguments/)
* Logging: as you like


#### Run it:
```
docker run -d \
  --name="my-argo-proxy" \
  -v /path/to/your/cert.pem:/etc/cloudflared/cert.pem \
  -v /path/to/your/supervisord.conf:/etc/supervisord.conf \
  -v /path/to/your/config.yaml:/etc/cloudflared/config.yaml \
  -v /path/to/your/log:/var/log \
MyCompany/argo-proxy
```
Using the ```config.yaml``` above, the following applies:

* Public URL for clients is ```example.mycompany.com```
* Traffic to ```example.mycompany.com``` gets into the Argo tunnel and reaches the origin server ```https://192.168.99.128```
