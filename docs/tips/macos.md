# MacOS tips


- Grep three lines....

  ```bash
  # highlight `app:`
  kustomize build $BASE | grep -C 3 app:

  # Compare the output directly to see how staging and production differ:
  diff \
    <(kustomize build $OVERLAYS/staging) \
    <(kustomize build $OVERLAYS/production) |\
    more
  ```

- how to add multiple localhosts to mac, sothat I can run multiple services on same port?

  Add alias IPs for lo0
  ```bash
  sudo ifconfig lo0 alias 127.0.0.2
  sudo ifconfig lo0 alias 127.0.0.3
  ```

  Add  hostnames for each of those IPs in `/etc/hosts`
  ```
  ##
  # Host Database
  #
  # localhost is used to configure the loopback interface
  # when the system is booting.  Do not change this entry.
  ##
  127.0.0.1       localhost
  255.255.255.255 broadcasthost
  ::1             localhost
  # Added by Sumanth
  127.0.0.1 accountsrv
  127.0.0.2 emailersrv
  127.0.0.3 greetersrv
  # End of section
  # Added by Docker Desktop
  # To allow the same kube context to work on the host and the container:
  127.0.0.1 kubernetes.docker.internal
  # End of section
  ```