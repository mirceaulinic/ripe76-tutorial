Event-driven Network Automation and Orchestration: RIPE 76 tutorial
===================================================================

Docker and Docker compose files to easily startup with Salt for Event-driven
Network Automation and Orchestration.

The files in this repository are used in my `RIPE 76 
tutorial <https://ripe76.ripe.net/programme/meeting-plan/tutorials/>`_, 
*Event-driven Network Automation and Orchestration*.

Slides to be published soon, with a detailed description of the files and 
usage examples.

Please follow the installation notes for `Docker 
<https://docs.docker.com/install/>`_ and `Docker Compose 
<https://docs.docker.com/compose/install/>`_ to be able to reproduce the steps 
below.

Usage (briefly)
---------------

1. Clone this repo:

   .. code-block:: bash

     git clone https://github.com/mirceaulinic/ripe76-tutorial.git

2. Change dir:

   .. code-block:: bash

     cd ripe76-tutorial

3. Edit the file ``pillar/device1_pillar.sls`` with the correct credentials of
   your device you want to manage.

4. Start using it:

   .. code-block:: bash

     make PROXYID=device1

Example output:

.. code-block:: bash

  $ make PROXYID=device1
  docker-compose up -d
  Creating salt-proxy-device1 ... done
  Creating napalm-logs        ... done
  Creating salt-master        ... done

Check that the ``device1`` Proxy Minion is up:

.. code-block:: bash

  $ docker exec -it salt-master bash
  root@salt-master:/# salt device1 test.ping
  device1:
      True

If the device does not return, you might want to start the containers in debug
mode (i.e., execute ``$ make PROXYID=device1 LOG_LEVEL=debug``), and check why
the Minion does not come up (most frequently the device is unreachable, e.g.,
blocked by a firewall, incorrect credentials etc.): ``$ docker logs -f salt-proxy-device1``.

Run a test State:

.. code-block:: bash

  $ docker exec -it salt-master bash
  root@salt-master:/# salt device1 state.apply test
  device1:
  ----------
            ID: Yay it works
      Function: test.succeed_without_changes
        Result: True
       Comment: Success!
       Started: 11:57:21.295204
      Duration: 0.76 ms
       Changes:

  Summary for device1
  ------------
  Succeeded: 1
  Failed:    0
  ------------
  Total states run:     1
  Total run time:   0.760 ms
  root@salt-master:/# %

