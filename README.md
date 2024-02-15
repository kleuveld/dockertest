# About

This repo contains a docker file to build my rmarkdown2pdf image, that builds a pdf from RMarkdown.

# Running the docker locally

Make sure docker is installed, and run: 

```
docker build -t rmarkdown2pdf .
```

Then, to compile the example PDF:

```
docker run --rm -v c:\Users\leuve002\git\rmarkdown2pdf:/doc rmarkdown2pdf myrmd.Rmd

```

# Pushing changes to Docker Hub

To push it to docker hub, follow [instructions](https://docs.docker.com/get-started/04_sharing_app/):

```
docker tag rmarkdown2pdf koenleuveld/rmarkdown2pdf:0.2.1

docker push koenleuveld/rmarkdown2pdf:0.2.1
```


# Using it in Github Actions

```
          - name: Run the build process with Docker
            run: docker run --rm -v ${{ github.workspace }}:/doc docker.io/koenleuveld/rmarkdown2pdf:0.2.1 myrmd.Rmd

```

# Using it in Sublime Text

Add a custom build function like this:

```
{
  "cmd": ["C:/Program Files/Docker/Docker/resources/bin/docker.exe","run", "--rm", "-v", "$file_path:/doc", "koenleuveld/rmarkdown2pdf:0.2", "$file_name"],
  "selector": "text.html.markdown.rmarkdown"
}



```
