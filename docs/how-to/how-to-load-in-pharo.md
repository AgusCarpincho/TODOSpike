# How to load TODOSpike in a Pharo image

## Using Metacello

1. Download a [Pharo VM and image](https://pharo.org/download)
2. Open your Pharo image
3. Open a Playground
4. Evaluate:

    ```smalltalk
    Metacello new
      baseline: 'TODOSpike';
      repository: 'github://AgusCarpincho/TODOSpike:release-candidate';
      load: 'Development'.
    ```

> Change `release-candidate` to some released version if you want a pinned version

## Using Iceberg

1. Download [pharo VM and image](https://pharo.org/download)
2. Open your Pharo image
3. Open Iceberg
4. Click the *Add* repository button
5. Select *Clone from github.com* and enter `AgusCarpincho` as owner name and `TODOSpike`
   as project name
6. Click *Ok*
7. Select the repository in the main Iceberg window
8. Open the contextual menu and select
  *Metacello -> Install baseline of TODOSpike ...*
9. Open a playgroud and evaluate:
 
 ```TODOSpikeApplication startAsDevelopment```
 
 and you will start the application as development (Its the only current mode now).
 
10. Now if you open in your browser [local](http://localhost:8080/home) you can use it for test your application

> After Iceberg cloned a repository, it will be checked-out at the default
> branch (in this case `release-candidate`). If you want to work on a different
> branch or commit, perform the checkout before the baseline installation step.
