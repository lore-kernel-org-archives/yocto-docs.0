Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85FCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 21:08:15 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.4902.1755637688545650308
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 14:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dHHFzwik;
 spf=pass (domain: konsulko.com, ip: 209.85.215.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1752685a12.0
        for <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 14:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755637687; x=1756242487; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOk54X8KuCusbyfvb5pWXVi/RhBPXbP9GfRE9Vcf+lY=;
        b=dHHFzwikhHDaSYz+0Hi1L14ciSFwe3ji37+hZqu2Hm2iyx3WlnVUNGjc4Y/WadUNGh
         O5c8yQS0Ky6hPMrp7v9oQQaTTnmJwx5CBXVHPiOmtqgC2z5Jp7hMdF6AZ3MIm3w6Svse
         UBPJhgJuJhdZ3IfgsCfw3Qu+Ld4Yrq4MBwbew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755637687; x=1756242487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOk54X8KuCusbyfvb5pWXVi/RhBPXbP9GfRE9Vcf+lY=;
        b=V+j70lJR8BIWizl6BpiWjU5pUAp2HRS0l28gcHLd/7WQtRMFTOpsdC2jDvKfR2l5+M
         BJOLFymVXRnkt8PORvlLlTQ9jQetlZjcm2FGreVsEJHzLw8YDuel2HXjlSSD4hgsEyn3
         vUFx/QMHX3HPQy6RlXDgsDN4Tww5Uo42AAOzVranpbl0gF8FkuN2eHZj+e31TrPwCe9+
         ozSHC55Jv5VMOF2EYepC9c88gARPfa0dX43l/gGlKW05puXIVs39B3ooPYCog23nKrPr
         gK2iwFC2ELObyPFZJ7xWTNclmvav5PD0eLAA6y/4mcH7vq1BFN9seVyPZNJPySL3WN+I
         IRuw==
X-Gm-Message-State: AOJu0Yx7vtxytY/+aK1FWRBF3Ib2oJLABA/DtL0JEnPnlznBKXTrrAiM
	wrQqbRnq7/ZbIaK4LO3mfGny9DcyT+dqYS+lSVFGYLVsPSt8M8t5OXNb0mdCvEsqy80mrv1KPSb
	MZWoYK30=
X-Gm-Gg: ASbGncswD8YZUQvaRKcHHkzzuNpNbNVENNBHv9NUoSXBZI+2VhWRqXnoscw74+muT8y
	BqOkznzBrDVei9f9lher1TEVNOlAA0u36ILHBVsO0Co3GQh1/B6hVfmCUX5IOKgI2SR3CV79ZvH
	UJnVRL8T0+Wh879Pn1R6VfOjdgrGSFoXw+BSbDRQ6joXnfFTAmatLzxx/bJNaGaC95cNg+yEyBA
	HdlM6HIKJa3xuHSXLqHJ8CRuA+L0AkUTNo4S08sWnCu+V1Um396h/WpjDJn0ztV6tbMJJZlTTYg
	1Rr3t3SJTUf2kfbpdIWiP+J3tJjzRIl9BDBOBumV0NcmLAg758Hzw5FujYNX2gndcvMgwErslZf
	gpLQ1gxLSecvEkmlyI93xekRVaV6WH+aiZcKTXGVR1cPMM22TDaMTAo0siIVmIA==
X-Google-Smtp-Source: AGHT+IHX60jqKsItM3ynpEze434IFBqLi922l2xsZMfeSDnh/ultLDstnz+7Mng6xEhpR8tHAYJspQ==
X-Received: by 2002:a17:903:1103:b0:244:7bce:9530 with SMTP id d9443c01a7336-245ef1235d2mr4559565ad.18.1755637687096;
        Tue, 19 Aug 2025 14:08:07 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33d2a3sm6412195ad.12.2025.08.19.14.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 14:08:06 -0700 (PDT)
From: tim.orling@konsulko.com
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [RFC][PATCH] brief-yoctoprojectqs: add bitbake-setup info
Date: Tue, 19 Aug 2025 14:07:16 -0700
Message-ID: <20250819210758.3606038-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Aug 2025 21:08:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7456

From: Tim Orling <tim.orling@konsulko.com>

Largely replace the original Poky instructions with
example instructions to use bitbake-setup.

Introduce the concept of OE_FRAGMENTS and how it is
used by bitbake-setup to setup SSTATE_MIRRORS, etc.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 223 ++++++++++---------
 1 file changed, 122 insertions(+), 101 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4a6f13d7e..e304869d9 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -87,75 +87,112 @@ distribution:
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
-Use Git to Clone Poky
-=====================
+Use Git to Clone bitbake-setup
+==============================
 
-Once you complete the setup instructions for your machine, you need to
-get a copy of the Poky repository on your build host. Use the following
-commands to clone the Poky repository.
+Once you complete the setup instructions for you machine, you need to
+get a copy of the bitbake-setup tool to setup the Poky reference
+distributioin on your build host. Use the following commands to clone
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
+setup your builds in a different directory--for example the current
+directory--you can instead use the ``--top-dir`` argument:
 
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


