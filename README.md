# Preact pixel demo
A super mario by preact

## Dev
```bash
git clone https://github.com/linychuo/preact-pixel.git
preact watch
```

Check it out, http://localhost:8080

![pixel by preact](./screen.png)


## Deploy by docker
1. build image, run following command after clone this repository
```bash
docker build -t preact-pixel .
```
2. run image
```bash
docker run -p 8080:8080 preact-pixel
```