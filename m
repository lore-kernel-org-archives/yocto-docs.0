Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66150CCFA03
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.2136.1761841756036951307
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E3MAVt1l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D2B3B4E413FD
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F4DF60331;
	Thu, 30 Oct 2025 16:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE18111808BEA;
	Thu, 30 Oct 2025 17:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZzGO5FnkyYoWbxT1V3riS9M3gm0GyuC2HsQ2L4ElTfQ=;
	b=E3MAVt1lI12/efnGlzwdMaMQSqg5ZSVBLFZlZ036prHgEGW2yTDucihjlTdIEFmMF5ARWJ
	46aGY9GhwKj4WJpaTakp2SH2c5zmkBT+ZcBZmSUwto3a0yF9unZfdcHIcPTWfPNXbb8x2O
	WueUO77u+4D3Wxb0+nJ05eBZuiuGx3OAWO+Ikcblsvjrg4xQIi0c0UCW0K25ny5w0A/z1z
	EJX28jL/7nF7+hzVbzKx6jrfhNltwkI+mlBbc8FpaDGJoa8lNROlJPgAf0YTCsVKv4tNV4
	ghZ6RfymeLeecfOn+krR28ex7h1yOH3E/NOZNl5MpHDVcrN4Q5LhoLXAitNiVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Oct 2025 17:28:33 +0100
Subject: [PATCH 4/6] brief-yoctoprojectqs: switch to bitbake-setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Tim Orling <tim.orling@konsulko.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21039;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=q1Fj0v7sgKkcSMtmkR5RxmswebACMcuU2Aht5wbKUwM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JVTrQ7GdJVM7m+gQa1lFhVPagZ7OwZpYOrg
 vl+eNH5daqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVQAKCRDRgEFAKaOo
 NqTREADAzfzifiVHjI35EyOtSoeuRPiVoAGj3RRfk3G4LQD7vWeuBOsMrIKNMXMQ7ei22pwFA42
 U73/uNbDkmATpBZ1mMG7hDGmHSUbatJX/UfQPo0TVte+0BZuxP6U0s7cvhb41hStMsZmYVqVFu7
 718LmtCbANRSblsTlooUl0G57sSZC/LlXg7kEZPug/ndPIaibmf5x2viqrMW1y/UbVX1WeZvg/3
 OZk+J7ivZEF57Wxm3sm2mG75besvp9y9XzcVrM/F9Q7Fd4KQlXrrp8bo2oDlyKkE0ltmDKb1ruz
 JzTTj0FAziBAKRawLBLklF63glHZePaO5xJdrzbLNxo4PjKMva+B1P4u+tz0v2e5NyaJtieRBRf
 g/vTcwQRjgo4ojV+vsQbpKlwYfFKUg9vqw5rHS4orcNC4eKXOKNjgcyeu7j4yS/tQkv1+XXj/Lb
 nq2Db25x7zh/hPWDaZgCRvEzNo7kfJ4yUkGSYJD+EEk9pzwV7oDqRFbYHbPif5XH4yUm7Wibbql
 2Eo0tCnt0u+t/NqlUrg8JUJOKawA08Ubt/vTCFnA4mkmatJg1XL/RAISSgeacFvBGzQhyD+3U8E
 5HceWoRTTRX/LBO4k58XzYh7m+SSZFYj8zIc6TtFRVVaQoEhT7+HiLKNFWnHTZkIRbrpXwDqSDB
 f10huWJHfa2j0GA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7932

Switch to bitbake-setup as it has been merged in BitBake with commit
b96154aeb1fc ("bitbake-setup: add the initial implementation"). This is
the default way to setup repositories now, so describe it in
brief-yoctoprojectqs.rst.

Update the BSP layer addition section to use meta-yocto-bsp as
meta-altera seems abandoned (latest compatible version: mickedore).
meta-yocto-bsp is probably already part of the bblayers.conf file when
we instruct to add it with bitbake-layers, but this does not produce an
error and is still nice to have for demo purposes.

Co-developed-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 390 +++++++++++++--------------
 documentation/ref-manual/structure.rst       |   5 +
 2 files changed, 198 insertions(+), 197 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4a6f13d7e..c79b53a8b 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -87,80 +87,122 @@ distribution:
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
-Use Git to Clone Poky
-=====================
+Use Git to Clone bitbake-setup
+==============================
 
 Once you complete the setup instructions for your machine, you need to
-get a copy of the Poky repository on your build host. Use the following
-commands to clone the Poky repository.
+get a copy of the ``bitbake-setup`` tool to setup the :term:`Poky` reference
+distribution on your build host. Use the following commands to clone
+the bitbake repository.
 
 .. code-block:: shell
 
-   $ git clone git://git.yoctoproject.org/poky
-   Cloning into 'poky'...
-   remote: Counting
-   objects: 432160, done. remote: Compressing objects: 100%
-   (102056/102056), done. remote: Total 432160 (delta 323116), reused
-   432037 (delta 323000) Receiving objects: 100% (432160/432160), 153.81 MiB | 8.54 MiB/s, done.
-   Resolving deltas: 100% (323116/323116), done.
-   Checking connectivity... done.
+   $ git clone git://git.openembedded.org/bitbake bitbake-setup
 
-Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
-codename (such as ``&DISTRO_NAME_NO_CAP;``), corresponding to either the
-latest stable release or a Long Term Support release.
-
-Then move to the ``poky`` directory and take a look at existing branches:
+Setup a build environment with the following command:
 
 .. code-block:: shell
 
-   $ cd poky
-   $ git branch -a
-   .
-   .
-   .
-   remotes/origin/HEAD -> origin/master
-   remotes/origin/dunfell
-   remotes/origin/dunfell-next
-   .
-   .
-   .
-   remotes/origin/gatesgarth
-   remotes/origin/gatesgarth-next
-   .
-   .
-   .
-   remotes/origin/master
-   remotes/origin/master-next
-   .
-   .
-   .
-
-
-For this example, check out the ``&DISTRO_NAME_NO_CAP;`` branch based on the
-``&DISTRO_NAME;`` release:
+   $ ./bitbake-setup/bin/bitbake-setup init
+
+By default, this will setup a top directory in ``$HOME/bitbake-builds``.
+
+If you prefer to setup your builds in a different top directory, for example the
+current directory, you can set it with the ``bitbake-setup settings`` command:
 
 .. code-block:: shell
 
-   $ git checkout -t origin/&DISTRO_NAME_NO_CAP; -b my-&DISTRO_NAME_NO_CAP;
-   Branch 'my-&DISTRO_NAME_NO_CAP;' set up to track remote branch '&DISTRO_NAME_NO_CAP;' from 'origin'.
-   Switched to a new branch 'my-&DISTRO_NAME_NO_CAP;'
+   $ ./bitbake-setup/bin/bitbake-setup settings set --global default top-dir-prefix $PWD
+
+.. note::
 
-The previous Git checkout command creates a local branch named
-``my-&DISTRO_NAME_NO_CAP;``. The files available to you in that branch
-exactly match the repository's files in the ``&DISTRO_NAME_NO_CAP;``
-release branch.
+   Use ``bitbake-setup settings list`` to get an overview of the settings.
 
-Note that you can regularly type the following command in the same directory
-to keep your local files in sync with the release branch:
+``bitbake-setup init`` is an interactive program by default and will ask you to
+make some decisions. Depending on your answers, the choices may differ from the
+examples below.
 
-.. code-block:: shell
+#. Choose a configuration (for example, ``poky-master``):
 
-   $ git pull
+   .. code-block:: shell
 
-For more options and information about accessing Yocto Project related
-repositories, see the
-:ref:`dev-manual/start:locating yocto project source files`
-section in the Yocto Project Development Tasks Manual.
+      Available configurations:
+      0. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
+      1. oe-nodistro  OpenEmbedded - 'nodistro' basic configuration
+
+      Please select one of the above configurations by its number:
+      0
+
+   Depending on the choice above, new options can be prompted to further specify
+   which configuration to use. For example:
+
+   .. code-block:: shell
+
+      Available bitbake configurations:
+      0. poky Poky - The Yocto Project testing distribution
+      1. poky-with-sstate     Poky - The Yocto Project testing distribution with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.
+
+      Please select one of the above bitbake configurations by its number:
+      0
+
+#. Choose a target :term:`MACHINE` (for example, ``qemux86-64``):
+
+   .. code-block:: shell
+
+      Target machines:
+      0. machine/qemux86-64
+      1. machine/qemuarm64
+      2. machine/qemuriscv64
+      3. machine/genericarm64
+      4. machine/genericx86-64
+
+      Please select one of the above options by its number:
+      0
+
+#. Choose a :term:`DISTRO` (for example, ``poky``):
+
+   .. code-block:: shell
+
+      Distribution configuration variants:
+      0. distro/poky
+      1. distro/poky-altcfg
+      2. distro/poky-tiny
+
+      Please select one of the above options by its number:
+      0
+
+.. note::
+
+   If you prefer to run non-interactively, you can run a command like the
+   following:
+
+   .. code-block:: shell
+
+      $ bitbake-setup init --non-interactive poky-master poky-with-sstate distro/poky machine/qemux86-64
+
+The ``init`` command creates a new folder in the top directory. Its name is
+derived from the selected configuration above.
+
+For the selected options in the above example, this would be::
+
+   poky-master-poky-distro_poky-machine_qemux86-64
+
+This will be our example configuration in the following sections.
+
+This directory contains:
+
+-  The :term:`Build Directory`, named ``build``. Later, when the build
+   completes, the :term:`Build Directory` contains all the files created during
+   the build.
+
+   This :term:`Build Directory` also contains a ``README``, describing the
+   currently configuration and minimal instructions.
+
+-  The :term:`layers <Layer>` needed to build the Poky reference distribution,
+   in the ``layers`` directory.
+
+-  A ``config`` directory, representing the current configuration used in this
+   directory.
 
 Building Your Image
 ===================
@@ -182,86 +224,64 @@ an entire Linux distribution, including the toolchain, from source.
       ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
       page of the Yocto Project Wiki.
 
-#. **Initialize the Build Environment:** From within the ``poky``
-   directory, run the :ref:`ref-manual/structure:``oe-init-build-env```
-   environment
-   setup script to define Yocto Project's build environment on your
-   build host.
+#.  **Initialize the Build Environment:** Source the ``init-build-env``
+    environment setup script within the build directory to setup Yocto Project's
+    build environment on your :term:`Build Host`:
 
-   .. code-block:: shell
+    .. code-block:: shell
+
+       $ source poky-master-poky-distro_poky-machine_qemux86-64/build/init-build-env
+       Poky reference distro build
+
+#.  **Examine Your Current Configuration:** When you set up the build
+    environment, an configuration file named :ref:`toolcfg.conf
+    <structure-build-conf-toolcfg.conf>` becomes available in a ``conf``
+    sub-directory of the :term:`Build Directory`. This file is automatically
+    modified by the ``bitbake-config-build`` command-line tool. With this tool,
+    list the currently enabled :term:`configuration fragments <Configuration
+    Fragment>`:
+
+    .. code-block:: shell
+
+       $ bitbake-config-build list-fragments
+
+    For this configuration, the default is to use two :term:`Built-in Fragments
+    <Built-in Fragment>`:
+
+    -  ``distro/poky`` sets the :term:`DISTRO` to :term:`Poky`
+       (:ref:`ref-fragments-builtin-core-distro`).
+    -  ``machine/qemux86-64`` sets the :term:`MACHINE` to ``qemux86-64``
+       (:ref:`ref-fragments-builtin-core-machine`).
+
+    These fragments correspond to the choices made when running ``bitbake-setup
+    init``.
+
+    The current configuration does not allow the ``root`` user to login. As this
+    can be useful for development, you can enable ``root`` login by opening the
+    :ref:`structure-build-conf-site.conf` file and adding the following
+    statement::
 
-      $ cd poky
-      $ source oe-init-build-env
-      You had no conf/local.conf file. This configuration file has therefore been
-      created for you with some default values. You may wish to edit it to, for
-      example, select a different MACHINE (target hardware). See conf/local.conf
-      for more information as common configuration options are commented.
-
-      You had no conf/bblayers.conf file. This configuration file has therefore
-      been created for you with some default values. To add additional metadata
-      layers into your configuration please add entries to conf/bblayers.conf.
-
-      The Yocto Project has extensive documentation about OE including a reference
-      manual which can be found at:
-          https://docs.yoctoproject.org
-
-      For more information about OpenEmbedded see their website:
-          https://www.openembedded.org/
-
-      ### Shell environment set up for builds. ###
-
-      You can now run 'bitbake <target>'
-
-      Common targets are:
-          core-image-minimal
-          core-image-full-cmdline
-          core-image-sato
-          core-image-weston
-          meta-toolchain
-          meta-ide-support
-
-      You can also run generated QEMU images with a command like 'runqemu qemux86-64'
-
-      Other commonly useful commands are:
-       - 'devtool' and 'recipetool' handle common recipe tasks
-       - 'bitbake-layers' handles common layer tasks
-       - 'oe-pkgdata-util' handles common target package tasks
-
-   Among other things, the script creates the :term:`Build Directory`, which is
-   ``build`` in this case and is located in the :term:`Source Directory`.  After
-   the script runs, your current working directory is set to the
-   :term:`Build Directory`. Later, when the build completes, the
-   :term:`Build Directory` contains all the files created during the build.
-
-#. **Examine Your Local Configuration File:** When you set up the build
-   environment, a local configuration file named ``local.conf`` becomes
-   available in a ``conf`` subdirectory of the :term:`Build Directory`. For this
-   example, the defaults are set to build for a ``qemux86`` target,
-   which is suitable for emulation. The package manager used is set to
-   the RPM package manager.
-
-   .. tip::
-
-      You can significantly speed up your build and guard against fetcher
-      failures by using :ref:`overview-manual/concepts:shared state cache`
-      mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
-      This way, you can use pre-built artifacts rather than building them.
-      This is relevant only when your network and the server that you use
-      can download these artifacts faster than you would be able to build them.
-
-      To use such mirrors, uncomment the below lines in your ``conf/local.conf``
-      file in the :term:`Build Directory`::
-
-         BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
-         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
-         BB_HASHSERVE = "auto"
-         BB_SIGNATURE_HANDLER = "OEEquivHash"
-
-      The hash equivalence server needs the websockets python module version 9.1
-      or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
-      9 and later, and Ubuntu 22.04 (LTS) and later, all have a recent enough
-      package. Other supported distributions need to get the module some other
-      place than their package feed, e.g. via ``pip``.
+       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"
+
+    .. note::
+
+       These set up the environment similar to what was previously in the local
+       configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
+       which is now largely empty.
+
+    .. note::
+
+       You can significantly speed up your build and guard against fetcher
+       failures by using :ref:`overview-manual/concepts:shared state cache`
+       mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
+       This way, you can use pre-built artifacts rather than building them.
+       This is relevant only when your network and the server that you use
+       can download these artifacts faster than you would be able to build them.
+
+       To use such mirrors, enable the
+       :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment:: 
+
+          $ bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
@@ -310,80 +330,53 @@ modular development and makes it easier to reuse the layer metadata.
 
 Follow these steps to add a hardware layer:
 
-#. **Find a Layer:** Many hardware layers are available. The Yocto Project
-   :yocto_git:`Source Repositories <>` has many hardware layers.
-   This example adds the
-   `meta-altera <https://github.com/kraj/meta-altera>`__ hardware layer.
+#.  **Find a Layer:** Many hardware layers, or :ref:`BSP layers
+    <overview-manual/concepts:bsp layer>` are available. The
+    :oe_layerindex:`layer index <>` can be used to find such layers. This example
+    adds the :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>` BSP
+    layer.
 
-#. **Clone the Layer:** Use Git to make a local copy of the layer on your
-   machine. You can put the copy in the top level of the copy of the
-   Poky repository created earlier:
-
-   .. code-block:: shell
+#.  **Add Your Layer to the Layer Configuration File:** Before you can use
+    a layer during a build, you must add it to your ``bblayers.conf``
+    file, which is found in the :term:`Build Directory` ``conf`` directory.
 
-      $ cd poky
-      $ git clone https://github.com/kraj/meta-altera.git
-      Cloning into 'meta-altera'...
-      remote: Counting objects: 25170, done.
-      remote: Compressing objects: 100% (350/350), done.
-      remote: Total 25170 (delta 645), reused 719 (delta 538), pack-reused 24219
-      Receiving objects: 100% (25170/25170), 41.02 MiB | 1.64 MiB/s, done.
-      Resolving deltas: 100% (13385/13385), done.
-      Checking connectivity... done.
+    This layer is already part of ``meta-yocto``, so from the :term:`Build
+    Directory` use the ``bitbake-layers add-layer`` command to add the layer to
+    the configuration file:
 
-   The hardware layer is now available
-   next to other layers inside the Poky reference repository on your build
-   host as ``meta-altera`` and contains all the metadata needed to
-   support hardware from Altera, which is owned by Intel.
+    .. code-block:: shell
 
-   .. note::
+       $ bitbake-layers add-layer ../layers/meta-yocto/meta-yocto-bsp
 
-      It is recommended for layers to have a branch per Yocto Project release.
-      Please make sure to checkout the layer branch supporting the Yocto Project
-      release you're using.
+    You can find more information on adding layers in the
+    :ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\`
+    script` section.
 
-#. **Change the Configuration to Build for a Specific Machine:** The
-   :term:`MACHINE` variable in the
-   ``local.conf`` file specifies the machine for the build. For this
-   example, set the :term:`MACHINE` variable to ``cyclone5``. These
-   configurations are used:
-   https://github.com/kraj/meta-altera/blob/master/conf/machine/cyclone5.conf.
+#.  **Change the Configuration to Build for a Specific Machine:** The
+    :term:`MACHINE` variable defined by the
+    :ref:`ref-fragments-builtin-core-machine` fragment defines the machine for
+    the build. For this example. The ``meta-yocto-bsp`` provides the
+    :yocto_git:`beaglebone-yocto </meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>` 
+    machine, make it the one used for the build with ``bitbake-config-build``:
 
-   .. note::
+    .. code-block:: shell
 
-      See the "Examine Your Local Configuration File" step earlier for more
-      information on configuring the build.
+       $ bitbake-config-build enable-fragment machine/beaglebone-yocto
 
-#. **Add Your Layer to the Layer Configuration File:** Before you can use
-   a layer during a build, you must add it to your ``bblayers.conf``
-   file, which is found in the :term:`Build Directory` ``conf`` directory.
+    .. note::
 
-   Use the ``bitbake-layers add-layer`` command to add the layer to the
-   configuration file:
+       See the "Examine Your Current Configuration" step earlier for more
+       information on configuring the build.
 
-   .. code-block:: shell
-
-      $ cd poky/build
-      $ bitbake-layers add-layer ../meta-altera
-      NOTE: Starting bitbake server...
-      Parsing recipes: 100% |##################################################################| Time: 0:00:32
-      Parsing of 918 .bb files complete (0 cached, 918 parsed). 1401 targets,
-      123 skipped, 0 masked, 0 errors.
-
-   You can find
-   more information on adding layers in the
-   :ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\` script`
-   section.
-
-Completing these steps has added the ``meta-altera`` layer to your Yocto
+Completing these steps has added the ``meta-yocto-bsp`` layer to your Yocto
 Project development environment and configured it to build for the
-``cyclone5`` machine.
+``beaglebone-yocto`` machine.
 
 .. note::
 
    The previous steps are for demonstration purposes only. If you were
-   to attempt to build an image for the ``cyclone5`` machine, you should
-   read the Altera ``README``.
+   to attempt to build an image for the ``beaglebone-yocto `` machine, you
+   should read the ``README`` in ``meta-yocto-bsp``.
 
 Creating Your Own General Layer
 ===============================
@@ -396,14 +389,17 @@ configuration file, a ``recipes-example`` subdirectory that contains an
 ``example.bb`` recipe, a licensing file, and a ``README``.
 
 The following commands run the tool to create a layer named
-``meta-mylayer`` in the ``poky`` directory:
+``meta-mylayer``:
 
 .. code-block:: shell
 
-   $ cd poky
-   $ bitbake-layers create-layer meta-mylayer
+   $ bitbake-layers create-layer ../layers/meta-mylayer
    NOTE: Starting bitbake server...
-   Add your new layer with 'bitbake-layers add-layer meta-mylayer'
+   Add your new layer with 'bitbake-layers add-layer ../layers/meta-mylayer'
+
+.. note::
+
+   By convention, layers are placed side-by-side.
 
 For more information
 on layers and how to create them, see the
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index d817ee426..b0e43c89f 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -368,6 +368,11 @@ symbolic link to a common ``site.conf`` file::
 This way, site-specific settings can be shared for multiple build
 configurations.
 
+.. note::
+
+   For more information on how to use ``bitbake-setup``, see the
+   :doc:`/brief-yoctoprojectqs/index` document.
+
 .. _structure-build-conf-bblock.conf:
 
 ``build/conf/bblock.conf``

-- 
2.51.0


