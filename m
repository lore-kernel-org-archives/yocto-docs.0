Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5843DD61028
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17185.1769700247437962409
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mL3YSYfU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DA985C22F48;
	Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DADA7606FD;
	Thu, 29 Jan 2026 15:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 017E2119A8856;
	Thu, 29 Jan 2026 16:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qhztzmMSSmDEfYP91g9lyBLwHEUb0kNBVvXBoC44vXI=;
	b=mL3YSYfUOy4f1Unu0ib9lDZW1F2AmnoWN2N0pv40cLypG0fFj/j5lnEfeekIVEnnOr88pF
	Igl5Yz+81LI3QACCkn96b5lx+iP9AqZC/Joca8tQbBuHOdc2K6nJrsR0KkN5Nc4uj337Dn
	xJeLmFtrW16HO8rxhti2DUjC5SjHLpRas4Cju2KfPxGtz/gXeeTEGziSTQb2Rs9rq78o18
	LAlUqUuTFfVBkcqP16N7j/2CEWbQ5H781X9W0Y0YLiFwF/3CEGJNH38rpdnzWuukIvlrpI
	urYIf5V4Z05u/BoIVkBQAi58Uu88ZlXnudBRYO9quYcnrGBD6rhj5s6hZwFOVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:54 +0100
Subject: [PATCH v3 03/57] dev-manual/start.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-3-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=27070;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h4tM0t5TnWgJxc3JRzxEgmxsDLpFvzlbFqnLgpMHDvc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uJ5xiesIWDXD/ddUtYX7THWHafbfPfRPM0a
 hAE5+MqS0iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iQAKCRDRgEFAKaOo
 NsphD/0cqyvwIw8mTgQgvQ/fp8oITZTaRnIpVQbsct3KEymoychmNs+4PIcroZhhkk6TGVbqDmU
 DJ1qsonGgkaifxoc94ZOoWROenkEbJJjqOXahV4HeFXTEDF7yshfuc13OOD21EGs7psqSDf27s0
 nEOEpRclWEeCVvSYoFrKtVypTbyd6+HRaBJ8w48i3l38tu0OVf4vbcin1scNej0faSWhSPjBy4X
 2joXsNO8u41v77XLoVV9Nek2HN7O/Y4trEOTJhg/BrkZDB7idz+FhcYKamI+/qsEiZ+Ov/B79aG
 V5tJ08tsSHkXsi1QvtEmTFWafNF53fbXY2bmOSixYO2VoyY75hhL9nD6AJFw5aSyRHb6xsZjSAH
 gPp4K8pakkMSdeOzRB+ABuu2+OpD0Ni7amy59eIbE6zb7jlmfyTOH2OpMgFKqPATu7dEl44RKKj
 aX8giEAlF9HtxyRVLogbvEYUqwsHHtQUACGxUjTXtloL64vlkyIVgggvskvL9nyA7wcIRU7JLmI
 U+Ug1KLYTrQlx1rAzpv5VEpB+BKLLOwj3GBmZI43dFXb3c+0+yu67BIh1sop76EEqA7HMgMGajZ
 XosgbJdZ74u9jaKzwQwEmdC2xAOqKpcC2m3wtPOQROoe3RWTKXlYnruF/Mnx/Yip4APVG45oB0k
 wsKa/XLOXODc+Vw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8789

The Poky repository has stopped being updated in favor of bitbake-setup
or manual clones of the required repositories. Simplify the document by
making references to these guides as well as removing sections that
are covered in the references documents.

Keep a "Initializing the Build Environment" as this task is common and
referenced in different places in the documentation.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst                    |   7 +-
 documentation/dev-manual/start.rst                 | 324 +++------------------
 documentation/kernel-dev/common.rst                |  36 +--
 .../overview-manual/development-environment.rst    |  21 +-
 documentation/ref-manual/structure.rst             |   5 -
 documentation/sdk-manual/appendix-obtain.rst       |  27 +-
 6 files changed, 49 insertions(+), 371 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a6444d9af..056f69249 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -72,7 +72,7 @@ For information on typical BSP development workflow, see the
 section. For more
 information on how to set up a local copy of source files from a Git
 repository, see the
-:ref:`dev-manual/start:locating yocto project source files`
+:doc:`/dev-manual/poky-manual-setup`
 section in the Yocto Project Development Tasks Manual.
 
 The BSP layer's base directory (``meta-bsp_root_name``) is the root
@@ -204,10 +204,7 @@ section.
       .. note::
 
          To see the available branch names in a cloned repository, use the ``git
-         branch -a`` command. See the
-         ":ref:`dev-manual/start:checking out by branch in poky`"
-         section in the Yocto Project Development Tasks Manual for more
-         information.
+         branch -a`` command.
 
 #. *Optionally Set Up an Alternative BSP Layer:* If your hardware can be
    more closely leveraged to an existing BSP not within the
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index b21cd4f0f..2aa3d5da5 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -76,7 +76,7 @@ particular working environment and set of practices.
     :term:`Metadata` (i.e. recipes,
     configuration files, classes, and so forth) and any software you are
     developing under the control of an SCM system that is compatible
-    with the OpenEmbedded build system is advisable. Of all of the SCMs
+    with the :term:`OpenEmbedded build system` is advisable. Of all of the SCMs
     supported by BitBake, the Yocto Project team strongly recommends using
     :ref:`overview-manual/development-environment:git`.
     Git is a distributed system
@@ -218,7 +218,7 @@ particular working environment and set of practices.
        repositories. See the ":ref:`overview-manual/development-environment:yocto project source repositories`"
        section in the Yocto Project Overview and Concepts Manual for
        information on these repositories. See the
-       ":ref:`dev-manual/start:locating yocto project source files`"
+       ":doc:`/dev-manual/poky-manual-setup`"
        section for information on how to set up local Git repositories
        for related upstream Yocto Project Git repositories.
 
@@ -338,7 +338,7 @@ Project Build Host:
 Once you have completed the previous steps, you are ready to continue
 using a given development path on your native Linux machine. If you are
 going to use BitBake, see the
-":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
+":ref:`dev-manual/start:preparing the poky reference distro`"
 section. If you are going
 to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
@@ -433,7 +433,7 @@ as your Yocto Project build host:
 Once you have a container set up, everything is in place to develop just
 as if you were running on a native Linux machine. If you are going to
 use the Poky container, see the
-":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
+":ref:`dev-manual/start:preparing the Poky reference distro`"
 section. If you are going to use the Extensible SDK container, see the
 ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
@@ -576,302 +576,60 @@ the `Yocto Project BitBake
 <https://marketplace.visualstudio.com/items?itemName=yocto-project.yocto-bitbake>`__
 extension accordingly.
 
-Locating Yocto Project Source Files
-===================================
+Preparing the Poky Reference Distro
+-----------------------------------
 
-This section shows you how to locate, fetch, unpack, patch and configure the source
-files you'll need to work with the Yocto Project.
+Now that the :term:`Build Host` has been prepared to build images, the next step
+can be to build the :term:`Poky` reference distro. There are two ways of setting
+up the :term:`Poky` reference distro:
 
-.. note::
-
-   -  For concepts and introductory information about Git as it is used
-      in the Yocto Project, see the ":ref:`overview-manual/development-environment:git`"
-      section in the Yocto Project Overview and Concepts Manual.
-
-   -  For concepts on Yocto Project source repositories, see the
-      ":ref:`overview-manual/development-environment:yocto project source repositories`"
-      section in the Yocto Project Overview and Concepts Manual."
-
-Accessing Source Repositories
------------------------------
-
-Working from a copy of the upstream :ref:`dev-manual/start:accessing source repositories` is the
-preferred method for obtaining and using a Yocto Project release. You
-can view the Yocto Project Source Repositories at
-:yocto_git:`/`. In particular, you can find the ``poky``
-repository at :yocto_git:`/poky`.
-
-Use the following procedure to locate the latest upstream copy of the
-``poky`` Git repository:
-
-#. *Access Repositories:* Open a browser and go to
-   :yocto_git:`/` to access the GUI-based interface into the
-   Yocto Project source repositories.
+-  Using the ``bitbake-setup`` command-line utility from :term:`BitBake`.
+   Follow:
 
-#. *Select the Repository:* Click on the repository in which you are
-   interested (e.g. ``poky``).
+   :doc:`Setting Up The Environment With bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
 
-#. *Find the URL Used to Clone the Repository:* At the bottom of the
-   page, note the URL used to clone that repository
-   (e.g. :yocto_git:`/poky`).
+-  Manually cloning the required repositories. Follow:
 
-   .. note::
+   :doc:`/dev-manual/poky-manual-setup`
 
-      For information on cloning a repository, see the
-      ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" section.
+.. note::
 
-Accessing Source Archives
--------------------------
+   The :term:`Poky` distro is a reference distro. It can be used to try the
+   Yocto Project but should not be used in a production environment. Instead, it
+   is recommended to create your own distro, see the
+   :doc:`/dev-manual/custom-distribution` section of the Yocto Project
+   Development Tasks Manual.
 
-The Yocto Project also provides source archives of its releases, which
-are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
-containing the release you wish to use, for example
-:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
+Initializing the Build Environment
+----------------------------------
 
-You will find there source archives of individual components (if you wish
-to use them individually), and of the corresponding Poky release bundling
-a selection of these components.
+Initializing the build environment is a common task, as it needs to be done for
+each new instance of the shell where the :term:`Poky` reference distro was set up:
 
-.. note::
+-  If ``bitbake-setup`` was used to setup the :term:`Poky` reference distro, you
+   need to source the ``init-build-env`` file of the :term:`bitbake:Setup`
+   directory that was created after the :ref:`bitbake:ref-bbsetup-command-init`
+   command execution:
 
-   The recommended method for accessing Yocto Project components is to
-   use Git to clone the upstream repository and work from within that
-   locally cloned repository.
-
-Using the Downloads Page
-------------------------
-
-The :yocto_home:`Yocto Project Website <>` uses a "RELEASES" page
-from which you can locate and download tarballs of any Yocto Project
-release. Rather than Git repositories, these files represent snapshot
-tarballs similar to the tarballs located in the Index of Releases
-described in the ":ref:`dev-manual/start:accessing source archives`" section.
-
-#. *Go to the Yocto Project Website:* Open The
-   :yocto_home:`Yocto Project Website <>` in your browser.
-
-#. *Get to the Downloads Area:* Select the "RELEASES" item from the
-   pull-down "DEVELOPMENT" tab menu near the top of the page.
-
-#. *Select a Yocto Project Release:* On the top of the "RELEASES" page, currently
-   supported releases are displayed; further down, past supported Yocto Project
-   releases are visible. The "Download" links in the rows of the table there
-   will lead to the download tarballs for the release.
-
-   .. note::
-
-      For a "map" of Yocto Project releases to version numbers, see the
-      :yocto_home:`Releases </development/releases/>` page.
-
-   You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
-   Project releases.
-
-#. *Download Tools or Board Support Packages (BSPs):* Next to the tarballs you
-   will find download tools or BSPs as well. Just select a Yocto Project
-   release and look for what you need.
-
-Cloning and Checking Out Branches
-=================================
-
-To use the Yocto Project for development, you need a release locally
-installed on your development system. This locally installed set of
-files is referred to as the :term:`Source Directory`
-in the Yocto Project documentation.
-
-The preferred method of creating your Source Directory is by using
-:ref:`overview-manual/development-environment:git` to clone a local copy of the upstream
-``poky`` repository. Working from a cloned copy of the upstream
-repository allows you to contribute back into the Yocto Project or to
-simply work with the latest software on a development branch. Because
-Git maintains and creates an upstream repository with a complete history
-of changes and you are working with a local clone of that repository,
-you have access to all the Yocto Project development branches and tag
-names used in the upstream repository.
-
-Cloning the ``poky`` Repository
--------------------------------
-
-Follow these steps to create a local version of the upstream
-:term:`Poky` Git repository.
-
-#. *Set Your Directory:* Change your working directory to where you want
-   to create your local copy of ``poky``.
-
-#. *Clone the Repository:* The following example command clones the
-   ``poky`` repository and uses the default name "poky" for your local
-   repository::
-
-      $ git clone git://git.yoctoproject.org/poky
-      Cloning into 'poky'...
-      remote: Counting objects: 432160, done.
-      remote: Compressing objects: 100% (102056/102056), done.
-      remote: Total 432160 (delta 323116), reused 432037 (delta 323000)
-      Receiving objects: 100% (432160/432160), 153.81 MiB | 8.54 MiB/s, done.
-      Resolving deltas: 100% (323116/323116), done.
-      Checking connectivity... done.
-
-   Unless you
-   specify a specific development branch or tag name, Git clones the
-   "master" branch, which results in a snapshot of the latest
-   development changes for "master". For information on how to check out
-   a specific development branch or on how to check out a local branch
-   based on a tag name, see the
-   ":ref:`dev-manual/start:checking out by branch in poky`" and
-   ":ref:`dev-manual/start:checking out by tag in poky`" sections, respectively.
-
-   Once the local repository is created, you can change to that
-   directory and check its status. The ``master`` branch is checked out
-   by default::
-
-      $ cd poky
-      $ git status
-      On branch master
-      Your branch is up-to-date with 'origin/master'.
-      nothing to commit, working directory clean
-      $ git branch
-      * master
-
-   Your local repository of poky is initially identical to the
-   upstream poky repository from which it was cloned. As you
-   work with the local branch, you can periodically use the
-   ``git pull`` command to be sure you stay up-to-date
-   with the upstream poky branch.
-
-Checking Out by Branch in Poky
-------------------------------
+   .. code-block:: console
 
-When you clone the upstream poky repository, you have access to all its
-development branches. Each development branch in a repository is unique
-as it forks off the "master" branch. To see and use the files of a
-particular development branch locally, you need to know the branch name
-and then specifically check out that development branch.
+      $ source <setup-dir>/build/init-build-env
 
-.. note::
 
-   Checking out an active development branch by branch name gives you a
-   snapshot of that particular branch at the time you check it out.
-   Further development on top of the branch that occurs after check it
-   out can occur.
-
-#. *Switch to the Poky Directory:* If you have a local poky Git
-   repository, switch to that directory. If you do not have the local
-   copy of poky, see the
-   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
-   section.
-
-#. *Determine Existing Branch Names:*
-   ::
-
-      $ git branch -a
-      * master
-      remotes/origin/1.1_M1
-      remotes/origin/1.1_M2
-      remotes/origin/1.1_M3
-      remotes/origin/1.1_M4
-      remotes/origin/1.2_M1
-      remotes/origin/1.2_M2
-      remotes/origin/1.2_M3
-      . . .
-      remotes/origin/thud
-      remotes/origin/thud-next
-      remotes/origin/warrior
-      remotes/origin/warrior-next
-      remotes/origin/zeus
-      remotes/origin/zeus-next
-      ... and so on ...
-
-#. *Check out the Branch:* Check out the development branch in which you
-   want to work. For example, to access the files for the Yocto Project
-   &DISTRO; Release (&DISTRO_NAME;), use the following command::
-
-      $ git checkout -b &DISTRO_NAME_NO_CAP; origin/&DISTRO_NAME_NO_CAP;
-      Branch &DISTRO_NAME_NO_CAP; set up to track remote branch &DISTRO_NAME_NO_CAP; from origin.
-      Switched to a new branch '&DISTRO_NAME_NO_CAP;'
-
-   The previous command checks out the "&DISTRO_NAME_NO_CAP;" development
-   branch and reports that the branch is tracking the upstream
-   "origin/&DISTRO_NAME_NO_CAP;" branch.
-
-   The following command displays the branches that are now part of your
-   local poky repository. The asterisk character indicates the branch
-   that is currently checked out for work::
-
-      $ git branch
-        master
-        * &DISTRO_NAME_NO_CAP;
-
-Checking Out by Tag in Poky
----------------------------
-
-Similar to branches, the upstream repository uses tags to mark specific
-commits associated with significant points in a development branch (i.e.
-a release point or stage of a release). You might want to set up a local
-branch based on one of those points in the repository. The process is
-similar to checking out by branch name except you use tag names.
+-  If the :term:`Poky` distro was setup using manual clones of the layers, you
+   need to source the ``oe-init-build-env`` script present in the
+   :term:`OpenEmbedded-Core (OE-Core)` layer:
 
-.. note::
+   .. code-block:: console
 
-   Checking out a branch based on a tag gives you a stable set of files
-   not affected by development on the branch above the tag.
-
-#. *Switch to the Poky Directory:* If you have a local poky Git
-   repository, switch to that directory. If you do not have the local
-   copy of poky, see the
-   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
-   section.
-
-#. *Fetch the Tag Names:* To checkout the branch based on a tag name,
-   you need to fetch the upstream tags into your local repository::
-
-      $ git fetch --tags
-      $
-
-#. *List the Tag Names:* You can list the tag names now::
-
-      $ git tag
-      1.1_M1.final
-      1.1_M1.rc1
-      1.1_M1.rc2
-      1.1_M2.final
-      1.1_M2.rc1
-         .
-         .
-         .
-      yocto-2.5
-      yocto-2.5.1
-      yocto-2.5.2
-      yocto-2.5.3
-      yocto-2.6
-      yocto-2.6.1
-      yocto-2.6.2
-      yocto-2.7
-      yocto_1.5_M5.rc8
-
-
-#. *Check out the Branch:*
-   ::
-
-      $ git checkout tags/yocto-&DISTRO; -b my_yocto_&DISTRO;
-      Switched to a new branch 'my_yocto_&DISTRO;'
-      $ git branch
-        master
-      * my_yocto_&DISTRO;
-
-   The previous command creates and
-   checks out a local branch named "my_yocto_&DISTRO;", which is based on
-   the commit in the upstream poky repository that has the same tag. In
-   this example, the files you have available locally as a result of the
-   ``checkout`` command are a snapshot of the "&DISTRO_NAME_NO_CAP;"
-   development branch at the point where Yocto Project &DISTRO; was
-   released.
+      $ source openembedded-core/oe-init-build-env
 
-Initializing the Build Environment
-==================================
+This will setup your current shell and change the current working directory to
+the :term:`Build Directory`.
 
-Before you can use Yocto you need to setup the build environment.
-From within the ``poky`` directory, source the :ref:`ref-manual/structure:``oe-init-build-env``` environment
-setup script to define Yocto Project's build environment on your build host::
+Where To Go From Here
+---------------------
 
-   $ source oe-init-build-env
+-  Configure your build: follow :ref:`overview-manual/concepts:User Configuration`.
 
-Note, that this step will have to be repeated every time you open a new shell.
+-  Learn how and what to build with :term:`BitBake`: follow :doc:`/dev-manual/building`.
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index c0df39e39..1e098c158 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -22,21 +22,13 @@ Preparing the Build Host to Work on the Kernel
 Before you can do any kernel development, you need to be sure your build
 host is set up to use the Yocto Project. For information on how to get
 set up, see the ":doc:`/dev-manual/start`" section in
-the Yocto Project Development Tasks Manual. Part of preparing the system
-is creating a local Git repository of the
-:term:`Source Directory` (``poky``) on your system. Follow the steps in the
-":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
-section in the Yocto Project Development Tasks Manual to set up your
-Source Directory.
+the Yocto Project Development Tasks Manual.
 
 .. note::
 
    Be sure you check out the appropriate development branch or you
    create your local branch by checking out a specific tag to get the
-   desired version of Yocto Project. See the
-   ":ref:`dev-manual/start:checking out by branch in poky`" and
-   ":ref:`dev-manual/start:checking out by tag in poky`"
-   sections in the Yocto Project Development Tasks Manual for more information.
+   desired version of Yocto Project.
 
 Kernel development is best accomplished using
 :ref:`devtool <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
@@ -158,28 +150,8 @@ this procedure leaves you ready to make modifications to the kernel
 source as described in the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 section:
 
-#. *Initialize the BitBake Environment:* Before you can do anything
-   using BitBake, you need to initialize the BitBake build environment
-   by sourcing the build environment script (i.e.
-   :ref:`structure-core-script`).
-   Also, for this example, be sure that the local branch you have
-   checked out for ``poky`` is the Yocto Project &DISTRO_NAME; branch. If
-   you need to checkout out the &DISTRO_NAME; branch, see the
-   ":ref:`dev-manual/start:checking out by branch in poky`"
-   section in the Yocto Project Development Tasks Manual::
-
-      $ cd poky
-      $ git branch
-      master
-      * &DISTRO_NAME_NO_CAP;
-      $ source oe-init-build-env
-
-   .. note::
-
-      The previous commands assume the
-      :ref:`overview-manual/development-environment:yocto project source repositories`
-      (i.e. ``poky``) have been cloned using Git and the local repository is named
-      "poky".
+#. *Initialize the BitBake Environment:* Follow the steps in the
+   :doc:`/dev-manual/start` section of the Yocto Project Development Tasks Manual.
 
 #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable is
    set to "qemux86-64", which is fine if you are building for the QEMU emulator
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 066d78431..ab9bd084c 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -184,15 +184,6 @@ development:
    .. image:: figures/source-repos.png
       :width: 100%
 
-   For steps on how to view and access these upstream Git repositories,
-   see the ":ref:`dev-manual/start:accessing source repositories`"
-   Section in the Yocto Project Development Tasks Manual.
-
--  :yocto_dl:`Yocto release archives: </releases/yocto>` This is where you can
-   download tarballs corresponding to each Yocto Project release. Downloading
-   and extracting these files does not produce a local copy of a Git repository
-   but rather a snapshot corresponding to a particular release.
-
 -  :yocto_home:`DOWNLOADS page </software-overview/downloads/>`:
    The :yocto_home:`Yocto Project website <>` includes a "DOWNLOADS" page accessible
    through the "SOFTWARE" menu that allows you to download any Yocto
@@ -203,10 +194,6 @@ development:
    .. image:: figures/yp-download.png
       :width: 100%
 
-   For steps on how to use the "DOWNLOADS" page, see the
-   ":ref:`dev-manual/start:using the downloads page`"
-   section in the Yocto Project Development Tasks Manual.
-
 Git Workflows and the Yocto Project
 ===================================
 
@@ -372,10 +359,6 @@ commands.
       Ubuntu, use the Ubuntu Software feature). For the Git download
       page, see https://git-scm.com/download.
 
-   -  For information beyond the introductory nature in this section,
-      see the ":ref:`dev-manual/start:locating yocto project source files`"
-      section in the Yocto Project Development Tasks Manual.
-
 Repositories, Tags, and Branches
 --------------------------------
 
@@ -403,9 +386,7 @@ You can create a local copy of any repository by "cloning" it with the
 ``git clone`` command. When you clone a Git repository, you end up with
 an identical copy of the repository on your development system. Once you
 have a local copy of a repository, you can take steps to develop
-locally. For examples on how to clone Git repositories, see the
-":ref:`dev-manual/start:locating yocto project source files`"
-section in the Yocto Project Development Tasks Manual.
+locally.
 
 It is important to understand that Git tracks content change and not
 files. Git uses "branches" to organize different development efforts.
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index c0eae9b7b..d567cade0 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -10,11 +10,6 @@ contents is key to using the Yocto Project effectively. This chapter
 describes the Source Directory and gives information about those files
 and directories.
 
-For information on how to establish a local Source Directory on your
-development system, see the
-":ref:`dev-manual/start:locating yocto project source files`"
-section in the Yocto Project Development Tasks Manual.
-
 .. note::
 
    The OpenEmbedded build system does not support file or directory
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 83eefecd6..fb2326fac 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -94,36 +94,11 @@ As an alternative to locating and downloading an SDK installer, you can
 build the SDK installer. Follow these steps:
 
 #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
-   in a shell. See the ":ref:`dev-manual/start:preparing the build host`" section
+   in a shell. See the ":doc:`/dev-manual/start`" section
    in the Yocto Project Development Tasks Manual for information on how
    to get a build host ready that is either a native Linux machine or a
    machine that uses CROPS.
 
-#. *Clone the ``poky`` Repository:* You need to have a local copy of the
-   Yocto Project :term:`Source Directory`
-   (i.e. a local
-   ``poky`` repository). See the ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
-   possibly the ":ref:`dev-manual/start:checking out by branch in poky`" and
-   ":ref:`dev-manual/start:checking out by tag in poky`" sections
-   all in the Yocto Project Development Tasks Manual for information on
-   how to clone the ``poky`` repository and check out the appropriate
-   branch for your work.
-
-#. *Initialize the Build Environment:* While in the root directory of
-   the Source Directory (i.e. ``poky``), run the
-   :ref:`structure-core-script` environment
-   setup script to define the OpenEmbedded build environment on your
-   build host:
-
-   .. code-block:: console
-
-      $ source oe-init-build-env
-
-   Among other things, the script creates the :term:`Build Directory`, which
-   is ``build`` in this case and is located in the Source Directory. After
-   the script runs, your current working directory is set to the ``build``
-   directory.
-
 #. *Make Sure You Are Building an Installer for the Correct Machine:*
    Check to be sure that your :term:`MACHINE` variable in the ``local.conf``
    file in your :term:`Build Directory` matches the architecture

-- 
2.52.0


