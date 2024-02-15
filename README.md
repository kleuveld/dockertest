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
docker tag rmarkdown2pdf koenleuveld/rmarkdown2pdf:0.2

docker push koenleuveld/rmarkdown2pdf:0.2
```


# Using it in Github Actions

```
          - name: Run the build process with Docker
            uses: addnab/docker-run-action@v3
            with:
                image: koenleuveld/rmarkdown2pdf:0.2
                options: -v ${{ github.workspace }}:/doc 
                run: |
                  Rscript -e "rmarkdown::render('/doc/myrmd.Rmd', output_file = '/doc/myrmd.pdf')"

```

# Using it in Sublime Text

Add a custom build function like this:

```
{
  "cmd": ["C:/Program Files/Docker/Docker/resources/bin/docker.exe","run", "--rm", "-v", "$file_path:/doc", "koenleuveld/rmarkdown2pdf:0.2", "$file_name"],
  "selector": "text.html.markdown.rmarkdown"
}



```
