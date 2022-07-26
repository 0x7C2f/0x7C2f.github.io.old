---
title: "My Categorical Loop"
layout: post
permalink: /my-categorical-nightmare/
author: "0x7C2f"
---

# My Categorical Nightmare

---

"Human beings are categorization machines, taking in voluminous amounts of messy data and then simplifying and structuring it. That’s how we make sense of the world and communicate our ideas to others. But according to the authors, categorization comes so naturally to us that we often see categories where none exist. That warps our view of the world and harms" - [hbr.org](https://hbr.org/2019/09/the-dangers-of-categorical-thinking)

I find this all too real. For example, I am current working on setting up my dotfiles with [Ansible](https://www.ansible.com/), and a feature of [Ansible](https://www.ansible.com/) lets you divide your workflow into what are known as "[roles](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html)". While these roles are supposidly suppose to help you will simplifying your workflow while organizing, I find myself focusing more on how to divide these roles rather than actually set them up.

## Ways I can Organize

---

### Organizing By Name

One way we can setup our project is to seperate each application, service, utility, etc by its individual name. Its a rather simple was of structuring the project, but some prefer this method:

```
.
├── bin
│   ├── bashrc
│   └── bash_profile
├── alacritty
│   ├── config.yml
├── polybar
│   ├── etc.conf
├── systemd
│   └── etc.conf
```

Altough it may seem simple, it starts to become redundent as you as your project size increases. As you can see below, I have a variety of stuff I would like to configure (and I only took a screenshot of half of the directory), and although going down the line like this seems logical, my brain tells me otherwise.

![dotfiles](/images/2022-07-26-151608_1920x1080_scrot.png)

### Organize By Function

Another way we can setup the project is to seperate by functions. Whether this is just a straight yml file or actually seperated into directories, this setup divides the project into actions. This would look something like this:

```
.
├── install_packages
│   ├── install_nvidia
│   ├── install_feh
│   ├── install_alacritty
│   └── install_firefox
├── configure_packages
│   ├── configure_nvidia
│   ├── configure_feh
│   ├── configure_alacritty
│   └── configure_firefox
├── etc...
```

## The Problem of Compatibility

---

So I have my structure, I am stoked by the way it works, everything is working well! What can go wrong? Well...lets add another machine in the mix.