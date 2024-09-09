---
layout: page
title: Computer Setup 
permalink: /setup/
menu: true
order: 4
description: > 
  To fully participate in the hands-on sections of this course you will need access to the software described below on your **own laptop**. Note that you may need Administrator privileges/permissions to install some of these.

comments: true
---

Students in this course will learn that Bioinformatics frequently requires analyzing large complex datasets. The recommended approach to such analysis is to work with a computer that offers **UNIX** integration. Together we will lean the fundamentals of the UNIX command line and the R environment for data analysis and graphics.


### Student Laptops & Software Setup Instructions
To fully participate in this course students will need to bring a laptop to class.  I much prefer **Mac** and Linux based laptops as they already have a UNIX base.  If you can, please bring one of these.  However, don't worry if you are running Windows as we will be able to login to a campus based UNIX machine from your laptop or use a classroom Mac for classwork. 

Regardless of your laptop type you will need to install the software described below.

### An up-to-date **web browser** 
Current versions of [Chrome](https://www.google.com/chrome/), [Firefox](http://www.mozilla.org/firefox/) and [Safari](Safari) are preferred.

### The Zoom virtual meeting software  
We will use [Zoom](https://ucsd.zoom.us) on a weekly basis for office hours and other meetings. Please make sure you have Zoom installed and running to allow you to join these meetings.   

<a name="rsetup"></a>
### The data analysis environment **R** and **RStudio**
R Binaries for Windows, MacOSX and Linux can be downloaded and installed from [CRAN](http://cran.r-project.org/index.html) (Comprehensive R Archive Network). If possible download the latest binary version of R for your operating system. As of course launch (Sept 2024) the latest release (2024-06-14) is R-4.4.1.  

After installing R itself we recommend installing [RStudio Desktop](https://www.rstudio.com/products/rstudio/download/#download) (version 2024.04.2-764 or above), a slick visual interface for R. **N.B.** You will want the Open Source **FREE** version. If you have an older version of RStudio (without Quarto, i.e. pre-2023) you will need to update.

### RTools for windows
PC users will benefit from installing [RTool](https://cran.r-project.org/bin/windows/Rtools/). This is needed for building R packages with C/C++/Fortran code from source - something we will describe later in the course. Look for the **Rtools_4.4 installer** link (or the one that matches your version of R from above). **N.B. Rtools is ONLY needed for Windows users, Mac users will need xcode command line tools (see below)**.  


### Xcode Command Line Tools (Mac only)
Mac users will benefit from installing *Xcode Command Line Tools*. If you try to run any recognized command line tool in the Terminal application, macOS will prompt you to install these tools. For example. if you try to run `git --version` at the Terminal and don't have this software then you will be prompted to install. You can also install directly from the command line. Open your **Terminal** (found in `/Applications/Utilities`) and type the command `xcode-select --install` this will open a dialog for installation of the command line tools. Note that the time estimate for installation is usually ridiculously off so don't panic.  Also please don't worry if you don't know what this means yet as I will explain when we get to this point in the course.  


### The Bash Shell
Bash is a commonly-used UNIX shell that gives you the power to do simple tasks more quickly.

**Mac OS X:** You do not need to install anything. You can access bash from the **Terminal** (found in `/Applications/Utilities`). You may want to keep Terminal in your dock for this class.

**Linux:** There is no need to install anything.

**Windows:** Install *Git for Windows* from <https://gitforwindows.org> by downloading their latest .exe installer file, double click on the installer file, click "Next" and follow their default setup (latest version).  

To check if your install worked you can click on the "*Windows Menu button*" > "*All Apps*" and scroll down to **Git** and click to expand and select **Git Bash**. This should open a mostly black command line window. Success!! We can go ahead and close this for now.    




<!-- 
### Python
I am adding this here for others as I (Barry) will not use this for my first week. Others can uncomment and add whatever they want here: 

 Install the `Miniconda` package manager, which is highly recommended for python users and can also be used to manage your R dependencies. Miniconda philosophy is built around conda environments, which correspond to closed containers where all the versions of the different python/R dependencies are fixed. This structure highly benefits the reproducibility of the code, as each analysis can be done with an exclusively dedicated environment, which will not change any dependency version, even though the general python installation of the computer or a particular package is updated. **Please note that Miniconda installation differs between macOS and Windows users**.


```
# Install Miniconda
## macOS (Intel)
system('wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh')
system('bash Miniconda3-latest-MacOSX-x86_64.sh')

## macOS (Apple M1)
system('wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh')
system('Miniconda3-latest-MacOSX-arm64.sh')

## Windows
# Download https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
```



--> 


