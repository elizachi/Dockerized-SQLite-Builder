# Project launch
Make sure `Vagrant` and `VirtualBox` are installed on your computer before starting the project

After copying the repository, run follow command
```
vagrant up
```

### What happens after the command is entered
1. A `Debian 11` virtual machine will be created via `VirtualBox`
2. A test user `user` will be created in the guest OS, with password `password`, so that you can interact with the virtual machine
3. Next, the first ansible playbook from the `docker-install-scripts` folder will run using a Bash script it will install Docker on the virtual machine
4. After that, the second ansible playbook from the `library-build-scripts` folder will be launched - it will copy the necessary files to the virtual machine to the `/task` folder and create a Docker container
5. SQLite library will be built in this Docker container, the results of the build will be located in the `task/build` directory
6. To enter the Docker container and find the build results run the following command
  ```
  docker exec -it library-env-container bash command
  ```
