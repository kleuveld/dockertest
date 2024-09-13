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

If the file is named "index.Rmd" (case-sensitive, for now), bookdown will be used
to render the file: 

```

docker run --rm -v C:\Users\leuve002\git\r_cheatsheet:/doc rmarkdown2pdf index.Rmd


```



Or, to run interactively:

```
docker run -it -v c:\Users\leuve002\git\rmarkdown2pdf:/doc rmarkdown2pdf 

```

The problem now is that you won't have a graphics device. You will have to save plots to files to view them.

To fix this, on windows, install [Xming](http://www.straightrunning.com/XmingNotes/), and launch the program. Then run:

```
docker run -i -t --rm -e DISPLAY=host.docker.internal:0 rmarkdown2pdf

```

Note that this isn't really great.


# Pushing changes to Docker Hub

To push it to docker hub, follow [instructions](https://docs.docker.com/get-started/04_sharing_app/):

```
docker tag rmarkdown2pdf koenleuveld/rmarkdown2pdf:0.2.9
docker tag rmarkdown2pdf koenleuveld/rmarkdown2pdf:latest
docker push rmarkdown2pdf


```


# Using it in Github Actions

```
          - name: Run the build process with Docker
            run: docker run --rm -v ${{ github.workspace }}:/doc docker.io/koenleuveld/rmarkdown2pdf:0.2.1 myrmd.Rmd

```

# Using it in Sublime Text


To include it in sublime text, place the following in `AppData\Roaming\Sublime Text\Packages\User\Build Systems\rmarkdown_render_with_docker.sublime-build`:

```

{
  "cmd": ["docker","run", "--rm", "-v", "$file_path:/doc", "koenleuveld/rmarkdown2pdf:latest", "$file_name"],
  "selector": "text.html.markdown.rmarkdown",
  "path" : "C:/Program Files/Docker/Docker/resources/bin/",
  "variants": 
    [
      {
        "name": "0.2.3",
        "cmd": ["docker","run", "--rm", "-v", "$file_path:/doc", "koenleuveld/rmarkdown2pdf:0.2.3", "$file_name"]
      }
    ]
}

```

