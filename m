Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16439CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 21:35:46 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.5522.1755639337544604787
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 14:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qGH7Io/W;
 spf=pass (domain: konsulko.com, ip: 209.85.215.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4717543ed9so3953988a12.3
        for <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755639336; x=1756244136; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6lv70nlMop5hbcU1dAJ9RgaCLOfObNI8fP67sX/ouQ=;
        b=qGH7Io/WkwcS5N3XvefWQAmt8kuBlDdAOY2JH0w0QPTjg2d3Tn8lXos7f/tY1gbQhN
         UMLmC9Hd6wXs9mm3zhNupihd7jpTnqlatdVt1Osf6XKvGJ928xzNFPXMuZODRH3s7xkQ
         lcOStrCCMqiNolsw+w1jjmA1Q7kfZtZRsIOOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755639336; x=1756244136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6lv70nlMop5hbcU1dAJ9RgaCLOfObNI8fP67sX/ouQ=;
        b=J9p5YUPeu9V38D1b3Z4rguyPDXTAnS4crHpRZZrbtEqi8dB//73fbx2KTkF6IwAhTl
         p4RIQoSAT6QbADg1EETDSXJEiwsA9Cg5knjzzR5nTcSzhVQbmuPBp4vjOoP4W4J4QPLc
         C+2k4bf6TDAne/kGQaKlCe8rkUoJQmRCLSwFv2Jcsbu9P81X54PfolUH8w/iFkLjVvU9
         4nYUOqFbuq/el0o7v2q4uI10X+htMh/hvJGyUBoipz1On2DS3smEwAyrsgnefWLnctwU
         DV4hZwuD4mxygi3a51Z99EE6C1V0z+XYIUkvjHIz/cldUfVQY7zhPnp0Pofc3b6AvMDn
         KQVg==
X-Gm-Message-State: AOJu0Yy6piVgYV2POTg9PUNHiUZ5ylpwv03H8Wzy3UExyYKOcVztgZwp
	T5D5vXleZ+Sz49Tkdlj+0qghYIPLd8//0VGtLT4tJ0Rb75PTUq7IVI7oqE1y02TRe94KduI02ZV
	Q11J+Mtk=
X-Gm-Gg: ASbGncsjI74KmLmYhSgOLFgGGfZ/ljMmLhl6gI6vj3ufdDmSZ8MFDklvCcUbW3TGDGd
	ppf9dgP7zAsnHFhqZbkA+tnkWMKr45RlhVBExy5Dms9b2Ir23TchFM5/jP6gb7M+rv1ZjCauG2q
	69uxghIuLY5ASsocUfKUgPCwSIw6CAFZ083uH/wj6CiYW1YO7HN8nwvLYGfCPiwpqoqIL28dDEc
	+IQKudn1X9699B9Zvcd6MX7KJMTal2JxHFZTWcvyCRSn4PD7PVxTFT1frJyNYt+HYQMUysqnqgB
	DYDOHPtrp7Daitni77pELPd1o9dUG+utVeVaq5Sr0koUdluOfxysujTkxzrY5dfTPXhS1NSbMQt
	iy76owRIrgZiait7nYMqtQ/T51r+sfAbJh9mKwz64ufnLGGInQaV3+HRSuYFFyw==
X-Google-Smtp-Source: AGHT+IEoSfOzm+UspX043Bg6t96/0VhkZ4VI9N5vt3UMS+YsaYi/TOFCmlC/oPT0WjJObKjZoXo+Sg==
X-Received: by 2002:a17:903:198e:b0:235:f143:9b07 with SMTP id d9443c01a7336-245ef0d5758mr5744635ad.5.1755639334065;
        Tue, 19 Aug 2025 14:35:34 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324d31b83dcsm1748041a91.2.2025.08.19.14.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 14:35:33 -0700 (PDT)
From: tim.orling@konsulko.com
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup info
Date: Tue, 19 Aug 2025 14:34:46 -0700
Message-ID: <20250819213530.3616042-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 21:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7457

From: Tim Orling <tim.orling@konsulko.com>

Largely replace the original Poky instructions with
example instructions to use bitbake-setup.

Introduce the concept of OE_FRAGMENTS and how it is
used by bitbake-setup to setup SSTATE_MIRRORS, etc.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  - fix typos/grammar errors
  - use commas instead of en dash

 documentation/brief-yoctoprojectqs/index.rst | 221 ++++++++++---------
 1 file changed, 121 insertions(+), 100 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4a6f13d7e..8ef1f5bf5 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -87,75 +87,112 @@ distribution:
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
-Use Git to Clone Poky
-=====================
+Use Git to Clone bitbake-setup
+==============================
 
 Once you complete the setup instructions for your machine, you need to
-get a copy of the Poky repository on your build host. Use the following
-commands to clone the Poky repository.
+get a copy of the bitbake-setup tool to setup the Poky reference
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
+   Cloning into 'bitbake-setup'...
+   remote: Enumerating objects: 68454, done.
+   remote: Counting objects: 100% (49/49), done.
+   remote: Compressing objects: 100% (44/44), done.
+   remote: Total 68454 (delta 31), reused 5 (delta 5), pack-reused 68405 (from 1)
+   Receiving objects: 100% (68454/68454), 14.17 MiB | 10.56 MiB/s, done.
+   Resolving deltas: 100% (51776/51776), done.
 
-Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
-codename (such as ``&DISTRO_NAME_NO_CAP;``), corresponding to either the
-latest stable release or a Long Term Support release.
+Setup a build environment with the following command:
 
-Then move to the ``poky`` directory and take a look at existing branches:
+.. code-block:: shell
+
+   $ ./bitbake-setup/bin/bitbake-setup init
+
+By default, this will setup in $HOME/bitbake-builds. If you prefer to
+setup your builds in a different directory, for example the current
+directory, you can instead use the ``--top-dir`` argument:
 
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
+  $ ./bitbake-setup/bin/bitbake-setup init --top-dir $PWD
+
+`bitbake-setup init` is an interactive program by default and will ask
+you to make some decisions. Depending on your answers, the choices may
+differ from the examples below.
+
+#. Choose a configuration (for example, ``yocto-master-options``):
+
+   .. code-block:: shell
+
+      Available configurations:
+      0. yocto-master-nested-configs	(future) Official Yocto configurations: poky, poky-altcfg, poky-tiny, for qemux86-64 and arm64 (defined with nested configurations)
+      1. yocto-master-options	(future) Official Yocto configurations: poky, poky-altcfg, poky-tiny, for qemux86-64, riscv64 and arm64 (defined with options)
+
+      Please select one of the above configurations by its number:
+      1
+
+#. Choose a target machine (for example, ``qemux86-64``):
+
+   .. code-block:: shell
+
+      Selecting the only available bitbake configuration poky
+      Available target machines:
+      0. machine/qemux86-64
+      1. machine/qemuarm64
+      2. machine/qemuriscv64
+      Please select one of the above options by its number:
+      0
+
+#. Choose a distribution (for example, ``poky``):
+
+   .. code-block:: shell
+
+      Available distributions:
+      0. distro/poky
+      1. distro/poky-altcfg
+      2. distro/poky-tiny
+      Please select one of the above options by its number:
+      0
+      Run 'bitbake-setup yocto-master-options poky distro/poky machine/qemux86-64' to select this configuration non-interactively.
+      Initializing a build in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64
+      Fetching layer/tool repository bitbake into /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layers/bitbake
+      Fetching layer/tool repository openembedded-core into /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layers/openembedded-core
+      Fetching layer/tool repository meta-yocto into /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layers/meta-yocto
+      Fetching layer/tool repository yocto-docs into /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/layers/yocto-docs
+      ==============================
+      Setting up bitbake configuration in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build
+      This bitbake configuration provides: Poky reference distro build
+      Usage instructions and additional information are in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/README
+
+If you prefer to run non-interactively, you could use a command
+like the following:
 
 .. code-block:: shell
 
-   $ git checkout -t origin/&DISTRO_NAME_NO_CAP; -b my-&DISTRO_NAME_NO_CAP;
-   Branch 'my-&DISTRO_NAME_NO_CAP;' set up to track remote branch '&DISTRO_NAME_NO_CAP;' from 'origin'.
-   Switched to a new branch 'my-&DISTRO_NAME_NO_CAP;'
+   $ bitbake-setup yocto-master-options poky distro/poky machine/qemux86-64
 
-The previous Git checkout command creates a local branch named
-``my-&DISTRO_NAME_NO_CAP;``. The files available to you in that branch
-exactly match the repository's files in the ``&DISTRO_NAME_NO_CAP;``
-release branch.
+Among other things, the script creates the :term:`Build Directory`, which is
+``build`` in this case and is located in the "top-dir" directory.  The script
+also clones the layers needed to build the Poky reference distribution, in the
+``layers`` subdirectory. After the script runs, your current working directory
+is set to the :term:`Build Directory`. Later, when the build completes, the
+:term:`Build Directory` contains all the files created during the build.
 
-Note that you can regularly type the following command in the same directory
-to keep your local files in sync with the release branch:
+
+Information about the build environment can be found in ``/path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/README`` which should look something like the following:
 
 .. code-block:: shell
 
-   $ git pull
+   Poky reference distro build
+
+   Additional information is in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/conf/conf-summary.txt and /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/conf/conf-notes.txt
+
+   Source the environment using '. /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/init-build-env' to run builds from the command line.
+   The bitbake configuration files (local.conf, bblayers.conf and more) can be found in /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/conf
 
 For more options and information about accessing Yocto Project related
 repositories, see the
@@ -182,61 +219,47 @@ an entire Linux distribution, including the toolchain, from source.
       ":yocto_wiki:`Working Behind a Network Proxy </Working_Behind_a_Network_Proxy>`"
       page of the Yocto Project Wiki.
 
-#. **Initialize the Build Environment:** From within the ``poky``
-   directory, run the :ref:`ref-manual/structure:``oe-init-build-env```
-   environment
-   setup script to define Yocto Project's build environment on your
-   build host.
+#. **Initialize the Build Environment:**
+   Run the ``init-build-env`` environment setup script within the build directory
+   to define Yocto Project's build environment on your build host.
 
    .. code-block:: shell
 
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
+      $ source /path/to/top-dir/yocto-master-options-poky-distro_poky-machine_qemux86-64/build/init-build-env
+      Poky reference distro build
 
-      For more information about OpenEmbedded see their website:
-          https://www.openembedded.org/
+#. **Examine Your Auto Configuration File:** When you set up the build
+   environment, an auto configuration file named ``auto.conf`` becomes
+   available in aa ``conf`` subdirectory of the :term:`Build Directory`. For this
+   example, the defaults are set to include three ``OE_FRAGMENTS``:
+   ``core/yocto/sstate-mirror-cdn``, ``machine/qemux86-64`` and ``distro/poky``.
+   These set up the environment similar to what was previously in the local
+   configuration file named ``local.conf`` which is now largely empty.
+   For more information on fragments, see :ref:`bitbake-user-manual/bitbake-user-manual-metadata:\`\`addfragments\`\` directive` in the Bitbake User Manual.
 
-      ### Shell environment set up for builds. ###
+   ``core/yocto/sstate-mirror-cdn`` sets up :term:`BB_HASHSERVE_UPSTREAM` and
+   :term:`SSTATE_MIRRORS`. The definition can be found in
+   ``../layers/openembedded-core/meta/conf/fragments/yocto/sstate-mirror-cdn.conf``.
 
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
+   .. code-block:: shell
 
-      Other commonly useful commands are:
-       - 'devtool' and 'recipetool' handle common recipe tasks
-       - 'bitbake-layers' handles common layer tasks
-       - 'oe-pkgdata-util' handles common target package tasks
+      BB_CONF_FRAGMENT_SUMMARY = "Use prebuilt sstate artifacts for standard Yocto build configurations."
+      BB_CONF_FRAGMENT_DESCRIPTION = "The Yocto Project has prebuilt artefacts available for standard build configurations. \
+      This fragment enables their use. This will mean the build will query the \
+      the network to check for artefacts at the start of builds, which does slow it down \
+      initially but it will then speed up the builds by not having to build things if they are \
+      present in the cache. It assumes you can download something faster than you can build it \
+      which will depend on your network. \
+      Note: For this to work you also need hash-equivalence passthrough to the matching server \
+      "
 
-   Among other things, the script creates the :term:`Build Directory`, which is
-   ``build`` in this case and is located in the :term:`Source Directory`.  After
-   the script runs, your current working directory is set to the
-   :term:`Build Directory`. Later, when the build completes, the
-   :term:`Build Directory` contains all the files created during the build.
+      BB_HASHSERVE_UPSTREAM = 'wss://hashserv.yoctoproject.org/ws'
+      SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 #. **Examine Your Local Configuration File:** When you set up the build
    environment, a local configuration file named ``local.conf`` becomes
    available in a ``conf`` subdirectory of the :term:`Build Directory`. For this
-   example, the defaults are set to build for a ``qemux86`` target,
+   example, the defaults are set to build for a ``qemux86-64`` target,
    which is suitable for emulation. The package manager used is set to
    the RPM package manager.
 
@@ -249,13 +272,11 @@ an entire Linux distribution, including the toolchain, from source.
       This is relevant only when your network and the server that you use
       can download these artifacts faster than you would be able to build them.
 
-      To use such mirrors, uncomment the below lines in your ``conf/local.conf``
-      file in the :term:`Build Directory`::
+      To use such mirrors, ``bitbake-setup`` includes the following in your
+	  ``conf/auto.conf`` file (or you can add it to ``conf/local.conf``) in
+	  the :term:`Build Directory`::
 
-         BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
-         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
-         BB_HASHSERVE = "auto"
-         BB_SIGNATURE_HANDLER = "OEEquivHash"
+            OE_FRAGMENTS += "core/yocto/sstate-mirror-cdn"
 
       The hash equivalence server needs the websockets python module version 9.1
       or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
-- 
2.43.0


