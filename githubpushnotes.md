Github Push notes

#6 I added the index timeseries in this push

- The site_libs folder was created with this push
    - So if the timeseries folder is remove, more than likely this folder is not needed.


#17 transferring files from raw repo
- hw 1.5 had a classical decomposition table not work due to the common library issue.
- I just comment that part of the code to fix later

#18 - transferring more files
- hw 3.3 has the mult classical forecast models that take 7 minutes to run
    - I excluded the last two code chunks for faster rendering but can add later
    
#43 - adding _Site folder 
    - I have been having trouble rendering qmd files and them updating locally
    - I commented the output-dir on the yml and that basically generated the whole _site folder which is same as docs
        - but i belive _site folder is like the default for the build website with quarto
        - This can be true because when not using the output for docs, the qmd files, when render locally, will update
        
        

# 52 cache and render issues # 52
quarto render --clean # this is supposed to remove any temporary files created during the rendering process
but it did not help my issue with the temp folder in my harddrive

added this but didnt seem to solve the problem, but keeping to better research the output of the cache. 
right now i'm using local cache but just want everything to be in the same repo. 
execute:
  cache: true
  cache-dir: .cache
  
thinking this can be causing an issue and led to creating of .Rprofile file
   - If lazy loading is causing issues, disable it explicitly. Add this to the .Rprofile in your project directory:

adding a .Rprofile file with options(lazyLoad = FALSE)
   - this led to updating the .gitignore file with this code
      - .Rprofile seems useful to make sure i have the same setting in different devices, specially when I deviate from the global settings
USE IT BUT STILL HAD THE SAME PROBLEM. DOES NOT MEAN THIS IS NOT USEFUL BUT NOT USING FOR NOW. 
# RStudio project files
.Rproj.user
.Rhistory
.RData
.Ruserdata

# Quarto-specific files
/.quarto/

# Cache directories
.cache/
chapters/*_cache/

# Logs and temporary files
*.log
*.out

# OS-specific files
.DS_Store  # macOS
Thumbs.db  # Windows

# Other temporary or auxiliary files
.Rprofile


trying another lazy load false in .Rprofile
# in .Rprofile
options(knitr.cache.lazy = FALSE)


none of the above is working so just went back to how it originally was. I have been running into cache errors since i can remember 
I did make a mistake of deleting the temp folder of my pc so now I'm running into errors i havent before. I may just need to delete this repo and start a new one

I'm re adding the workspace to restore .Rdata and history to always save history amd remove duplicates. 
    - i originally did this to make my r studio faster but eneded up making it slower, just wanted to wait till semester end to fix this
     -not gonna try and fix now but maybe adding this can help me get over the lazyload error

I still ran into errors after changing the workspace and history

I ended up temporarily disabling cache, and the file ran. 
    - the cache is maybe what was link, so my r studio was first looking for the cache version, but since i deleted the auto generated folders and the temp folder in my pc, it couldn't find that cache so it kept getting that lazy load error
    - So this cache option currently depends on external folders an not within my root folder than.
    - The other option was going to be to just delete this local repo and restart which would have clear all the local links
    - I wonder if this cache will solve my render old cache issue.



