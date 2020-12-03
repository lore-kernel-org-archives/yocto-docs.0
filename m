Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.4173.1607031547392480351
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N8NTLCxB;
 spf=pass (domain: linaro.org, ip: 209.85.221.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f54.google.com with SMTP id o1so3371247wrx.7
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kNQnxdLbZ5Q1Nzlb6WuIF+kC3c3vdU6i6q/wXZHu9YI=;
        b=N8NTLCxBsXxkJY2yAbGIFJKK30IfPXPko4wn+a6Y9WEInV6gzc4gOEK55x5lRRkKel
         CrmIyIIMNJ6TCOxD9PU4lOd2fBaLLCPy6O117yn7n3hbYNSUNtTx+cJlPS+Lr/thrRAV
         RwmrVUfT8a1ITLQAOJ27fZIaxA3TmlOT7j8qCD9szBZarjdPE5J8QuncM08cutb+kuRl
         LIWkOSRfr9oi2aLNgxiyxPysS0F0PEZrZFnocG/hUQEeX1rLEXioCjJsOHT5HB6tKA/L
         15IxS2YensedVq5IxNguGKWZ2+UY3NtSzDok9HtdRmxxH90ZH84iGc/w4rhTngJ3pnqG
         etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNQnxdLbZ5Q1Nzlb6WuIF+kC3c3vdU6i6q/wXZHu9YI=;
        b=txC0LzmOvJc2IUEmMvKWgNtf4ii93zIBAjEgy8ljNPlDhiRMU46t+UMwuRRZW2xoVv
         3QRzmvSKhPwCogCaXNqjMpwKcs5Xl7BmmsqeleU99VO6C13PsPtOnKBFtgf96cO+fb2T
         gA/7GRSeFe5QiJeME9hhlgXfwPvq+JJ2OGk94XUmomg4VjNvPzyEL2Wcvk8qYrPYQz1E
         5mTDo1z3F5Z+0RNtzTdUcmk2ef5Wy/9KCqeQv7VudjJYB5OhPA9CLXRr1DS/sfVt8ocj
         72L+XcaGu1Y8unRxC/nVuJ4oriCNoHixgsqVjXjI0+rGkBYMMEDys80UtX9uRga3NDY4
         4fqA==
X-Gm-Message-State: AOAM531l5x+HITdThi7Ul0GUh9hVayakHwv4iqf70YD9GGf+7UWxcjeb
	75BchEne5+WoIt2iVjvP1oi29pMCUGfMtOOn
X-Google-Smtp-Source: ABdhPJx7YCJ0tzbWr9U7nbzCdzhKj2PMahqNfTxKhLHFsbBIL5OgPULrChePxdudoBvhJSLSgXZEZA==
X-Received: by 2002:a5d:4ec8:: with SMTP id s8mr1300382wrv.349.1607031543894;
        Thu, 03 Dec 2020 13:39:03 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:39:02 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 08/10] overview-manual: remove 'overview-manual' from filenames
Date: Thu,  3 Dec 2020 22:38:41 +0100
Message-Id: <20201203213843.347671-9-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All filenames duplicate the 'manual name', which is not needed, and
make all references longer than they should. Rename all files to be as
consise as possible, and fix all references

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/bsp-guide/bsp.rst               |  6 +--
 documentation/dev-manual/common-tasks.rst     | 40 ++++++++--------
 documentation/dev-manual/start.rst            | 16 +++----
 documentation/kernel-dev/advanced.rst         |  4 +-
 documentation/kernel-dev/common.rst           |  4 +-
 documentation/kernel-dev/concepts-appx.rst    |  6 +--
 ...rview-manual-concepts.rst => concepts.rst} |  4 +-
 ...onment.rst => development-environment.rst} |  0
 documentation/overview-manual/index.rst       |  8 ++--
 .../{overview-manual-intro.rst => intro.rst}  |  2 +-
 ...rview-manual-yp-intro.rst => yp-intro.rst} |  2 +-
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/migration-1.7.rst    |  2 +-
 documentation/ref-manual/migration-2.3.rst    |  2 +-
 documentation/ref-manual/ref-classes.rst      | 12 ++---
 .../ref-manual/ref-release-process.rst        |  2 +-
 documentation/ref-manual/ref-structure.rst    |  6 +--
 .../ref-manual/ref-system-requirements.rst    |  2 +-
 documentation/ref-manual/ref-tasks.rst        | 36 +++++++--------
 documentation/ref-manual/ref-terms.rst        |  6 +--
 documentation/ref-manual/ref-variables.rst    | 46 +++++++++----------
 .../sdk-manual/sdk-appendix-customizing.rst   |  2 +-
 documentation/sdk-manual/sdk-extensible.rst   |  2 +-
 documentation/toaster-manual/reference.rst    |  2 +-
 25 files changed, 108 insertions(+), 108 deletions(-)
 rename documentation/overview-manual/{overview-manual-concepts.rst => concepts.rst} (99%)
 rename documentation/overview-manual/{overview-manual-development-environment.rst => development-environment.rst} (100%)
 rename documentation/overview-manual/{overview-manual-intro.rst => intro.rst} (98%)
 rename documentation/overview-manual/{overview-manual-yp-intro.rst => yp-intro.rst} (99%)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 51f684af0..5dc0bc792 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -244,7 +244,7 @@ an entire Linux distribution, including the toolchain, from source.
       $ bitbake core-image-sato
 
    For information on using the ``bitbake`` command, see the
-   :ref:`overview-manual/overview-manual-concepts:bitbake` section in the Yocto Project Overview and
+   :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
    Concepts Manual, or see the ":ref:`BitBake Command
    <bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command>`" section in the BitBake User Manual.
 
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index e20df3f6b..48bff35fa 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -44,7 +44,7 @@ machine or platform name, which is "bsp_root_name" in the above form.
 To help understand the BSP layer concept, consider the BSPs that the
 Yocto Project supports and provides with each release. You can see the
 layers in the
-:ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+:ref:`overview-manual/development-environment:yocto project source repositories`
 through
 a web interface at :yocto_git:`/`. If you go to that interface,
 you will find a list of repositories under "Yocto Metadata Layers".
@@ -253,7 +253,7 @@ developers can use this structure with other build systems besides the
 OpenEmbedded build system. It is also intended that it will be be simple
 to extract information and convert it to other formats if required. The
 OpenEmbedded build system, through its standard :ref:`layers mechanism
-<overview-manual/overview-manual-yp-intro:the yocto project layer model>`, can
+<overview-manual/yp-intro:the yocto project layer model>`, can
 directly accept the format described as a layer. The BSP layer captures
 all the hardware-specific details in one place using a standard format,
 which is useful for any person wishing to use the hardware platform
@@ -754,7 +754,7 @@ workflow.
    are kept. The key point for a layer is that it is an isolated area
    that contains all the relevant information for the project that the
    OpenEmbedded build system knows about. For more information on
-   layers, see the ":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
+   layers, see the ":ref:`overview-manual/yp-intro:the yocto project layer model`"
    section in the Yocto Project Overview and Concepts Manual. You can also
    reference the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For more
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index fe3667bfb..abeb1ed9c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -18,7 +18,7 @@ The OpenEmbedded build system supports organizing
 Layers allow you to isolate different types of customizations from each
 other. For introductory information on the Yocto Project Layer Model,
 see the
-":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
+":ref:`overview-manual/yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual.
 
 Creating Your Own Layer
@@ -1319,7 +1319,7 @@ to determine how well the build went.
    ``log.do_fetch``, and ``log.do_compile``).
 
 You can find more information about the build process in
-":doc:`/overview-manual/overview-manual-development-environment`"
+":doc:`/overview-manual/development-environment`"
 chapter of the Yocto Project Overview and Concepts Manual.
 
 Fetching Code
@@ -1330,7 +1330,7 @@ files. Fetching is controlled mainly through the
 :term:`SRC_URI` variable. Your recipe
 must have a ``SRC_URI`` variable that points to where the source is
 located. For a graphical representation of source locations, see the
-":ref:`overview-manual/overview-manual-concepts:sources`" section in
+":ref:`overview-manual/concepts:sources`" section in
 the Yocto Project Overview and Concepts Manual.
 
 The :ref:`ref-tasks-fetch` task uses
@@ -1599,7 +1599,7 @@ package "example" contains "libexample" and another package "mypackage"
 contains a binary that links to "libexample" then the OpenEmbedded build
 system will automatically add a runtime dependency to "mypackage" on
 "example"). See the
-":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+":ref:`overview-manual/concepts:automatically added runtime dependencies`"
 section in the Yocto Project Overview and Concepts Manual for further
 details.
 
@@ -2486,7 +2486,7 @@ Reference Manual's variable glossary.
 
    -  Using ``DEPENDS`` also allows runtime dependencies between
       packages to be added automatically. See the
-      ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+      ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual for more
       information.
 
@@ -3658,7 +3658,7 @@ build host running Linux.
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under
 ``tmp/deploy/images``. For detailed information on the build process
-using BitBake, see the ":ref:`overview-manual/overview-manual-concepts:images`" section in the
+using BitBake, see the ":ref:`overview-manual/concepts:images`" section in the
 Yocto Project Overview and Concepts Manual.
 
 The following figure and list overviews the build process:
@@ -5490,7 +5490,7 @@ Using an Existing Kickstart File
 
 If you do not want to create your own kickstart file, you can use an
 existing file provided by the Wic installation. As shipped, kickstart
-files can be found in the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories` in the
+files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
 following two locations:
 ::
 
@@ -6526,7 +6526,7 @@ revision, respectively). The values are highly dependent on the policies
 and procedures of a given distribution and package feed.
 
 Because the OpenEmbedded build system uses
-":ref:`signatures <overview-manual/overview-manual-concepts:checksums (signatures)>`", which are
+":ref:`signatures <overview-manual/concepts:checksums (signatures)>`", which are
 unique to a given build, the build system knows when to rebuild
 packages. All the inputs into a given task are represented by a
 signature, which can trigger a rebuild when different. Thus, the build
@@ -6600,7 +6600,7 @@ Quality <#maintaining-build-output-quality>`__" section.
    use a PR Service while others do not leads to obvious problems.
 
    For more information on shared state, see the
-   ":ref:`overview-manual/overview-manual-concepts:shared state cache`"
+   ":ref:`overview-manual/concepts:shared state cache`"
    section in the Yocto Project Overview and Concepts Manual.
 
 Manually Bumping PR
@@ -6767,7 +6767,7 @@ multiple times if you have more than one set of modules to package.
 
 For more examples that show how to use ``do_split_packages``, see the
 ``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
-directory of the ``poky`` :ref:`source repository <overview-manual/overview-manual-development-environment:yocto project source repositories>`. You can
+directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
 also find examples in ``meta/classes/kernel.bbclass``.
 
 Following is a reference that shows ``do_split_packages`` mandatory and
@@ -8080,7 +8080,7 @@ variable to "1" at the end of your ``conf/local.conf`` file found in the
 Enabling build history as
 previously described causes the OpenEmbedded build system to collect
 build output information and commit it as a single commit to a local
-:ref:`overview-manual/overview-manual-development-environment:git` repository.
+:ref:`overview-manual/development-environment:git` repository.
 
 .. note::
 
@@ -9394,7 +9394,7 @@ BitBake has determined by doing the following:
       ${BUILDDIR}/tmp/stamps/i586-poky-linux/db/6.0.30-r1.do_fetch.sigdata.7c048c18222b16ff0bcee2000ef648b1
 
    For tasks that are accelerated through the shared state
-   (:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`) cache, an
+   (:ref:`sstate <overview-manual/concepts:shared state cache>`) cache, an
    additional ``siginfo`` file is written into
    :term:`SSTATE_DIR` along with
    the cached task output. The ``siginfo`` files contain exactly the
@@ -9461,15 +9461,15 @@ files, see the "`Viewing Task Variable
 Dependencies <#dev-viewing-task-variable-dependencies>`__" section.
 
 For conceptual information on shared state, see the
-":ref:`overview-manual/overview-manual-concepts:shared state`"
+":ref:`overview-manual/concepts:shared state`"
 section in the Yocto Project Overview and Concepts Manual.
 
 Invalidating Shared State to Force a Task to Run
 ------------------------------------------------
 
 The OpenEmbedded build system uses
-:ref:`checksums <overview-manual/overview-manual-concepts:checksums (signatures)>` and
-:ref:`overview-manual/overview-manual-concepts:shared state` cache to avoid unnecessarily
+:ref:`checksums <overview-manual/concepts:checksums (signatures)>` and
+:ref:`overview-manual/concepts:shared state` cache to avoid unnecessarily
 rebuilding tasks. Collectively, this scheme is known as "shared state
 code".
 
@@ -9530,7 +9530,7 @@ tasks (including tasks from other recipes) that the specified task
 depends on will be run before the task. Even when you manually specify a
 task to run with ``-c``, BitBake will only run the task if it considers
 it "out of date". See the
-":ref:`overview-manual/overview-manual-concepts:stamp files and the rerunning of tasks`"
+":ref:`overview-manual/concepts:stamp files and the rerunning of tasks`"
 section in the Yocto Project Overview and Concepts Manual for how
 BitBake determines whether a task is "out of date".
 
@@ -10458,7 +10458,7 @@ Yocto general mailing list or on the openembedded-devel mailing list.
 You can also push a change upstream and request a maintainer to pull the
 change into the component's upstream repository. You do this by pushing
 to a contribution repository that is upstream. See the
-":ref:`overview-manual/overview-manual-development-environment:git workflows and the yocto project`"
+":ref:`overview-manual/development-environment:git workflows and the yocto project`"
 section in the Yocto Project Overview and Concepts Manual for additional
 concepts on working in the Yocto Project development environment.
 
@@ -10707,7 +10707,7 @@ been followed:
       located in the :term:`Source Directory` at
       ``meta/conf/distro/include``, to see who is responsible for code.
 
-   -  *Search by File:* Using :ref:`overview-manual/overview-manual-development-environment:git`, you can
+   -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
       enter the following command to bring up a short list of all
       commits against a specific file:
       ::
@@ -10856,7 +10856,7 @@ follows:
 Working With Licenses
 =====================
 
-As mentioned in the ":ref:`overview-manual/overview-manual-development-environment:licensing`"
+As mentioned in the ":ref:`overview-manual/development-environment:licensing`"
 section in the Yocto Project Overview and Concepts Manual, open source
 projects are open to the public and they consequently have different
 licensing structures in place. This section describes the mechanism by
@@ -11299,7 +11299,7 @@ By releasing the version of the OpenEmbedded build system and the layers
 used during the build, you will be providing both compilation scripts
 and the source code modifications in one step.
 
-If the deployment team has a :ref:`overview-manual/overview-manual-concepts:bsp layer`
+If the deployment team has a :ref:`overview-manual/concepts:bsp layer`
 and a distro layer, and those
 those layers are used to patch, compile, package, or modify (in any way)
 any open source software included in your released images, you might be
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 8244d68ed..a26d2a3ea 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -78,7 +78,7 @@ particular working environment and set of practices.
     developing under the control of an SCM system that is compatible
     with the OpenEmbedded build system is advisable. Of all of the SCMs
     supported by BitBake, the Yocto Project team strongly recommends using
-    :ref:`overview-manual/overview-manual-development-environment:git`.
+    :ref:`overview-manual/development-environment:git`.
     Git is a distributed system
     that is easy to back up, allows you to work remotely, and then
     connects back to the infrastructure.
@@ -165,7 +165,7 @@ particular working environment and set of practices.
     -  Highlights when commits break the build.
 
     -  Populates an :ref:`sstate
-       cache <overview-manual/overview-manual-concepts:shared state cache>` from which
+       cache <overview-manual/concepts:shared state cache>` from which
        developers can pull rather than requiring local builds.
 
     -  Allows commit hook triggers, which trigger builds when commits
@@ -218,17 +218,17 @@ particular working environment and set of practices.
     some best practices exist within the Yocto Project development
     environment. Consider the following:
 
-    -  Use :ref:`overview-manual/overview-manual-development-environment:git` as the source control
+    -  Use :ref:`overview-manual/development-environment:git` as the source control
        system.
 
     -  Maintain your Metadata in layers that make sense for your
-       situation. See the ":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
+       situation. See the ":ref:`overview-manual/yp-intro:the yocto project layer model`"
        section in the Yocto Project Overview and Concepts Manual and the
        ":ref:`dev-manual/common-tasks:understanding and creating layers`"
        section for more information on layers.
 
     -  Separate the project's Metadata and code by using separate Git
-       repositories. See the ":ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`"
+       repositories. See the ":ref:`overview-manual/development-environment:yocto project source repositories`"
        section in the Yocto Project Overview and Concepts Manual for
        information on these repositories. See the "`Locating Yocto
        Project Source Files <#locating-yocto-project-source-files>`__"
@@ -572,11 +572,11 @@ files you'll need to work with the Yocto Project.
 .. note::
 
    -  For concepts and introductory information about Git as it is used
-      in the Yocto Project, see the ":ref:`overview-manual/overview-manual-development-environment:git`"
+      in the Yocto Project, see the ":ref:`overview-manual/development-environment:git`"
       section in the Yocto Project Overview and Concepts Manual.
 
    -  For concepts on Yocto Project source repositories, see the
-      ":ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`"
+      ":ref:`overview-manual/development-environment:yocto project source repositories`"
       section in the Yocto Project Overview and Concepts Manual."
 
 Accessing Source Repositories
@@ -722,7 +722,7 @@ files is referred to as the :term:`Source Directory`
 in the Yocto Project documentation.
 
 The preferred method of creating your Source Directory is by using
-:ref:`overview-manual/overview-manual-development-environment:git` to clone a local copy of the upstream
+:ref:`overview-manual/development-environment:git` to clone a local copy of the upstream
 ``poky`` repository. Working from a cloned copy of the upstream
 repository allows you to contribute back into the Yocto Project or to
 simply work with the latest software on a development branch. Because
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 163560b69..dd0b76bc3 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -16,7 +16,7 @@ complexity of the configuration and sources used to support multiple
 BSPs and Linux kernel types.
 
 Kernel Metadata exists in many places. One area in the
-:ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+:ref:`overview-manual/development-environment:yocto project source repositories`
 is the ``yocto-kernel-cache`` Git repository. You can find this repository
 grouped under the "Yocto Linux Kernel" heading in the
 :yocto_git:`Yocto Project Source Repositories <>`.
@@ -386,7 +386,7 @@ type as follows:
 .. note::
 
    You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
-   of the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+   of the :ref:`overview-manual/development-environment:yocto project source repositories`
    (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
    ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`"
    section for more information.
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 403a63d58..67f8777c4 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -63,7 +63,7 @@ section:
    .. note::
 
       The previous commands assume the
-      :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+      :ref:`overview-manual/development-environment:yocto project source repositories`
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
@@ -249,7 +249,7 @@ section:
    .. note::
 
       The previous commands assume the
-      :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+      :ref:`overview-manual/development-environment:yocto project source repositories`
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 865f6d8be..4b6dbe5ef 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -35,7 +35,7 @@ Yocto Project Linux kernel that caters to specific embedded designer
 needs for targeted hardware.
 
 You can find a web interface to the Yocto Linux kernels in the
-:ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+:ref:`overview-manual/development-environment:yocto project source repositories`
 at :yocto_git:`/`. If you look at the interface, you will see to
 the left a grouping of Git repositories titled "Yocto Linux Kernel".
 Within this group, you will find several Linux Yocto kernels developed
@@ -160,7 +160,7 @@ implemented by the Yocto Project team using the Source Code Manager
 
    -  You can find documentation on Git at https://git-scm.com/doc. You can
       also get an introduction to Git as it applies to the Yocto Project in the
-      ":ref:`overview-manual/overview-manual-development-environment:git`" section in the Yocto Project
+      ":ref:`overview-manual/development-environment:git`" section in the Yocto Project
       Overview and Concepts Manual. The latter reference provides an
       overview of Git and presents a minimal set of Git commands that
       allows you to be functional using Git. You can use as much, or as
@@ -258,7 +258,7 @@ Yocto Linux kernel needed for any given set of requirements.
    Yocto Linux kernels, but rather shows a single generic kernel just
    for conceptual purposes. Also keep in mind that this structure
    represents the
-   :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+   :ref:`overview-manual/development-environment:yocto project source repositories`
    that are either pulled from during the build or established on the
    host development system prior to the build by either cloning a
    particular kernel's Git repository or by downloading and unpacking a
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/concepts.rst
similarity index 99%
rename from documentation/overview-manual/overview-manual-concepts.rst
rename to documentation/overview-manual/concepts.rst
index a10670fc5..8aa86c06e 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -40,7 +40,7 @@ section of the Yocto Project Development Tasks Manual.
 Following are some brief details on these core components. For
 additional information on how these components interact during a build,
 see the
-":ref:`overview-manual/overview-manual-concepts:openembedded build system concepts`"
+":ref:`overview-manual/concepts:openembedded build system concepts`"
 section.
 
 BitBake
@@ -1109,7 +1109,7 @@ the extensible SDK (eSDK):
 .. note::
 
    For more information on the cross-development toolchain generation,
-   see the ":ref:`overview-manual/overview-manual-concepts:cross-development toolchain generation`"
+   see the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
    section. For information on advantages gained when building a
    cross-development toolchain using the do_populate_sdk task, see the
    ":ref:`sdk-manual/sdk-appendix-obtain:building an sdk installer`" section in
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/development-environment.rst
similarity index 100%
rename from documentation/overview-manual/overview-manual-development-environment.rst
rename to documentation/overview-manual/development-environment.rst
diff --git a/documentation/overview-manual/index.rst b/documentation/overview-manual/index.rst
index f20b20e32..123aed9b8 100644
--- a/documentation/overview-manual/index.rst
+++ b/documentation/overview-manual/index.rst
@@ -10,10 +10,10 @@ Yocto Project Overview and Concepts Manual
    :caption: Table of Contents
    :numbered:
 
-   overview-manual-intro
-   overview-manual-yp-intro
-   overview-manual-development-environment
-   overview-manual-concepts
+   intro
+   yp-intro
+   development-environment
+   concepts
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/intro.rst
similarity index 98%
rename from documentation/overview-manual/overview-manual-intro.rst
rename to documentation/overview-manual/intro.rst
index 50c623c3b..bd247dd45 100644
--- a/documentation/overview-manual/overview-manual-intro.rst
+++ b/documentation/overview-manual/intro.rst
@@ -28,7 +28,7 @@ The following list describes what you can get from this manual:
    Yocto Project source repositories, workflows using Git and the Yocto
    Project, a Git primer, and information about licensing.
 
--  :doc:`overview-manual-concepts` *:* This
+-  :doc:`/overview-manual/concepts` *:* This
    chapter presents various concepts regarding the Yocto Project. You
    can find conceptual information about components, development,
    cross-toolchains, and so forth.
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/yp-intro.rst
similarity index 99%
rename from documentation/overview-manual/overview-manual-yp-intro.rst
rename to documentation/overview-manual/yp-intro.rst
index a6568d1c8..3afbb9378 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -589,7 +589,7 @@ Project.
 .. note::
 
    For additional detail about the Yocto Project development
-   environment, see the ":doc:`overview-manual-development-environment`"
+   environment, see the ":doc:`/overview-manual/development-environment`"
    chapter.
 
 -  *Native Linux Host:* By far the best option for a Build Host. A
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 5b9fcc191..cc6b3aee1 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -198,7 +198,7 @@ and also any configuration information about how that package was
 configured and built.
 
 You can find more information on licensing in the
-":ref:`overview-manual/overview-manual-development-environment:licensing`"
+":ref:`overview-manual/development-environment:licensing`"
 section in the Yocto
 Project Overview and Concepts Manual and also in the
 ":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 85894d9df..177d40900 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -26,7 +26,7 @@ QEMU, you should now have these lines in ``local.conf``:
 Minimum Git version
 -------------------
 
-The minimum :ref:`overview-manual/overview-manual-development-environment:git`
+The minimum :ref:`overview-manual/development-environment:git`
 version required on the
 build host is now 1.7.8 because the ``--list`` option is now required by
 BitBake's Git fetcher. As always, if your host distribution does not
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 9e95f45e1..6984ff91e 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -51,7 +51,7 @@ Consider the following:
    :term:`SYSROOT_PREPROCESS_FUNCS`.
 
    For an example, see the ``pixbufcache`` class in ``meta/classes/`` in
-   the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`.
+   the :ref:`overview-manual/development-environment:yocto project source repositories`.
 
    .. note::
 
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 914ca4232..900341e5a 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -406,7 +406,7 @@ cross-compilation tools.
 
 The ``cross-canadian`` class provides support for the recipes that build
 the Canadian Cross-compilation tools for SDKs. See the
-":ref:`overview-manual/overview-manual-concepts:cross-development toolchain generation`"
+":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 discussion on these cross-compilation tools.
 
@@ -417,7 +417,7 @@ discussion on these cross-compilation tools.
 
 The ``crosssdk`` class provides support for the recipes that build the
 cross-compilation tools used for building SDKs. See the
-":ref:`overview-manual/overview-manual-concepts:cross-development toolchain generation`"
+":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 discussion on these cross-compilation tools.
 
@@ -930,7 +930,7 @@ For information on customizing images, see the
 ":ref:`dev-manual/common-tasks:customizing images`" section
 in the Yocto Project Development Tasks Manual. For information on how
 images are created, see the
-":ref:`overview-manual/overview-manual-concepts:images`" section in the
+":ref:`overview-manual/concepts:images`" section in the
 Yocto Project Overview and Concpets Manual.
 
 .. _ref-classes-image-buildinfo:
@@ -2039,7 +2039,7 @@ These classes are inherited by and used with the ``populate_sdk_base``
 class.
 
 For more information on the cross-development toolchain generation, see
-the ":ref:`overview-manual/overview-manual-concepts:cross-development toolchain generation`"
+the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
@@ -2268,7 +2268,7 @@ The root filesystem is created from packages using one of the
 :term:`PACKAGE_CLASSES` variable.
 
 For information on how root filesystem images are created, see the
-":ref:`overview-manual/overview-manual-concepts:image generation`"
+":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-sanity:
@@ -2375,7 +2375,7 @@ default, the class is enabled through the
 :term:`INHERIT_DISTRO` variable's default value.
 
 For more information on sstate, see the
-":ref:`overview-manual/overview-manual-concepts:shared state cache`"
+":ref:`overview-manual/concepts:shared state cache`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-staging:
diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
index 54cd9510f..20be09a4f 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/ref-release-process.rst
@@ -50,7 +50,7 @@ Major Release Codenames
 =======================
 
 Each major release receives a codename that identifies the release in
-the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`.
+the :ref:`overview-manual/development-environment:yocto project source repositories`.
 The concept is that branches of :term:`Metadata` with the same
 codename are likely to be compatible and thus work together.
 
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index b681e8233..606a77c7f 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -399,8 +399,8 @@ This directory contains any "end result" output from the OpenEmbedded
 build process. The :term:`DEPLOY_DIR` variable points
 to this directory. For more detail on the contents of the ``deploy``
 directory, see the
-":ref:`overview-manual/overview-manual-concepts:images`" and
-":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections in the Yocto
+":ref:`overview-manual/concepts:images`" and
+":ref:`overview-manual/concepts:application development sdk`" sections in the Yocto
 Project Overview and Concepts Manual.
 
 .. _structure-build-tmp-deploy-deb:
@@ -545,7 +545,7 @@ and timestamps for tracking purposes.
 
 For information on how BitBake uses stamp files to determine if a task
 should be rerun, see the
-":ref:`overview-manual/overview-manual-concepts:stamp files and the rerunning of tasks`"
+":ref:`overview-manual/concepts:stamp files and the rerunning of tasks`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _structure-build-tmp-log:
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index d162c9bad..66afb0810 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -15,7 +15,7 @@ Yocto Project.
 
 For introductory information on the Yocto Project, see the
 :yocto_home:`Yocto Project Website <>` and the
-":ref:`overview-manual/overview-manual-development-environment:the yocto project development environment`"
+":ref:`overview-manual/development-environment:the yocto project development environment`"
 chapter in the Yocto Project Overview and Concepts Manual.
 
 If you want to use the Yocto Project to quickly build an image without
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 768c10eeb..8b9e0c2d8 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -140,7 +140,7 @@ The ``do_image`` task performs pre-processing on the image through the
 :term:`IMAGE_PREPROCESS_COMMAND` and
 dynamically generates supporting ``do_image_*`` tasks as needed.
 
-For more information on image creation, see the ":ref:`overview-manual/overview-manual-concepts:image generation`"
+For more information on image creation, see the ":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-image-complete:
@@ -159,7 +159,7 @@ through the
 :term:`IMAGE_POSTPROCESS_COMMAND`.
 
 For more information on image creation, see the
-":ref:`overview-manual/overview-manual-concepts:image generation`"
+":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-install:
@@ -174,7 +174,7 @@ compilation directory. The ``do_install`` task, as well as other tasks
 that either directly or indirectly depend on the installed files (e.g.
 :ref:`ref-tasks-package`, ``do_package_write_*``, and
 :ref:`ref-tasks-rootfs`), run under
-:ref:`fakeroot <overview-manual/overview-manual-concepts:fakeroot and pseudo>`.
+:ref:`fakeroot <overview-manual/concepts:fakeroot and pseudo>`.
 
 .. note::
 
@@ -218,7 +218,7 @@ The ``do_package`` task, in conjunction with the
 :ref:`ref-tasks-packagedata` task, also saves some
 important package metadata. For additional information, see the
 :term:`PKGDESTWORK` variable and the
-":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+":ref:`overview-manual/concepts:automatically added runtime dependencies`"
 section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_qa:
@@ -237,7 +237,7 @@ see the :ref:`insane <ref-classes-insane>` class.
 Creates Debian packages (i.e. ``*.deb`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
+":ref:`overview-manual/concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_ipk:
@@ -248,7 +248,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates IPK packages (i.e. ``*.ipk`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
+":ref:`overview-manual/concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_rpm:
@@ -259,7 +259,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates RPM packages (i.e. ``*.rpm`` files) and places them in the
 ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
+":ref:`overview-manual/concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-package_write_tar:
@@ -270,7 +270,7 @@ the Yocto Project Overview and Concepts Manual.
 Creates tarballs and places them in the
 ``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory in
 the package feeds area. For more information, see the
-":ref:`overview-manual/overview-manual-concepts:package feeds`" section in
+":ref:`overview-manual/concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
 
 .. _ref-tasks-packagedata:
@@ -349,7 +349,7 @@ patch files end with either ``.patch`` or ``.diff``, every file would be
 applied as a patch by default except for the ``patch_file5`` patch.
 
 You can find out more about the patching process in the
-":ref:`overview-manual/overview-manual-concepts:patching`" section in
+":ref:`overview-manual/concepts:patching`" section in
 the Yocto Project Overview and Concepts Manual and the
 ":ref:`dev-manual/common-tasks:patching code`" section in the
 Yocto Project Development Tasks Manual.
@@ -368,7 +368,7 @@ the image is constructed.
 -------------------
 
 Creates the file and directory structure for an installable SDK. See the
-":ref:`overview-manual/overview-manual-concepts:sdk generation`"
+":ref:`overview-manual/concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
 
@@ -378,7 +378,7 @@ information.
 -----------------------
 
 Creates the file and directory structure for an installable extensible 
-SDK (eSDK). See the ":ref:`overview-manual/overview-manual-concepts:sdk generation`"
+SDK (eSDK). See the ":ref:`overview-manual/concepts:sdk generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information.
 
@@ -434,7 +434,7 @@ Unpacks the source code into a working directory pointed to by
 ``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
 variable also plays a role in where unpacked source files ultimately
 reside. For more information on how source files are unpacked, see the
-":ref:`overview-manual/overview-manual-concepts:source fetching`"
+":ref:`overview-manual/concepts:source fetching`"
 section in the Yocto Project Overview and Concepts Manual and also see
 the ``WORKDIR`` and ``S`` variable descriptions.
 
@@ -500,7 +500,7 @@ You can run this task using BitBake as follows:
    $ bitbake -c clean recipe
 
 Running this task does not remove the
-:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>` cache files.
+:ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
 Consequently, if no changes have been made and the recipe is rebuilt
 after cleaning, output files are simply restored from the sstate cache.
 If you want to remove the sstate cache files for the recipe, you need to
@@ -513,7 +513,7 @@ use the :ref:`ref-tasks-cleansstate` task instead
 ---------------
 
 Removes all output files, shared state
-(:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`) cache, and
+(:ref:`sstate <overview-manual/concepts:shared state cache>`) cache, and
 downloaded source files for a target (i.e. the contents of
 :term:`DL_DIR`). Essentially, the ``do_cleanall`` task is
 identical to the :ref:`ref-tasks-cleansstate` task
@@ -534,10 +534,10 @@ task.
 ------------------
 
 Removes all output files and shared state
-(:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`) cache for a
+(:ref:`sstate <overview-manual/concepts:shared state cache>`) cache for a
 target. Essentially, the ``do_cleansstate`` task is identical to the
 :ref:`ref-tasks-clean` task with the added removal of
-shared state (:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`)
+shared state (:ref:`sstate <overview-manual/concepts:shared state cache>`)
 cache.
 
 You can run this task using BitBake as follows:
@@ -593,7 +593,7 @@ Lists all defined tasks for a target.
 ``do_package_index``
 --------------------
 
-Creates or updates the index in the :ref:`overview-manual/overview-manual-concepts:package feeds` area.
+Creates or updates the index in the :ref:`overview-manual/concepts:package feeds` area.
 
 .. note::
 
@@ -631,7 +631,7 @@ has some more information about these types of images.
 -------------
 
 Creates the root filesystem (file and directory structure) for an image.
-See the ":ref:`overview-manual/overview-manual-concepts:image generation`"
+See the ":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual for more
 information on how the root filesystem is created.
 
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index ba1930ebd..f41073602 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -160,7 +160,7 @@ universal, the list includes them just in case:
 
       Creation of these toolchains is simple and automated. For information on
       toolchain concepts as they apply to the Yocto Project, see the
-      ":ref:`overview-manual/overview-manual-concepts:Cross-Development
+      ":ref:`overview-manual/concepts:Cross-Development
       Toolchain Generation`" section in the Yocto Project Overview and Concepts
       Manual. You can also find more information on using the relocatable
       toolchain in the :doc:`/sdk-manual/index` manual.
@@ -189,7 +189,7 @@ universal, the list includes them just in case:
       layers used within Yocto Project.
 
       For introductory information on layers, see the
-      ":ref:`overview-manual/overview-manual-yp-intro:The Yocto Project Layer
+      ":ref:`overview-manual/yp-intro:The Yocto Project Layer
       Model`" section in the Yocto Project Overview and Concepts Manual. For
       more detailed information on layers, see the
       ":ref:`dev-manual/common-tasks:Understanding and Creating
@@ -366,7 +366,7 @@ universal, the list includes them just in case:
 
      For more information on concepts related to Git repositories,
      branches, and tags, see the
-     ":ref:`overview-manual/overview-manual-development-environment:repositories, tags, and branches`"
+     ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
      section in the Yocto Project Overview and Concepts Manual.
 
    :term:`Task`
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index d98e35817..a8a949b92 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -1016,7 +1016,7 @@ system and gives an overview of their function and contents.
          (SDK).
 
       -  *task:* Save output file signatures for
-         :ref:`shared state <overview-manual/overview-manual-concepts:shared state cache>`
+         :ref:`shared state <overview-manual/concepts:shared state cache>`
          (sstate) tasks.
          This saves one file per task and lists the SHA-256 checksums for
          each file staged (i.e. the output of the task).
@@ -1522,7 +1522,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          Tasks that read from or write to this directory should run under
-         :ref:`fakeroot <overview-manual/overview-manual-concepts:fakeroot and pseudo>`.
+         :ref:`fakeroot <overview-manual/concepts:fakeroot and pseudo>`.
 
    :term:`DATE`
       The date the build was started. Dates appear using the year, month,
@@ -1641,7 +1641,7 @@ system and gives an overview of their function and contents.
          -  One recipe having another recipe in ``DEPENDS`` does not by
             itself add any runtime dependencies between the packages
             produced by the two recipes. However, as explained in the
-            ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+            ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
             section in the Yocto Project Overview and Concepts Manual,
             runtime dependencies will often be added automatically, meaning
             ``DEPENDS`` alone is sufficient for most recipes.
@@ -1672,9 +1672,9 @@ system and gives an overview of their function and contents.
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
-      ":ref:`overview-manual/overview-manual-concepts:images`",
-      ":ref:`overview-manual/overview-manual-concepts:package feeds`", and
-      ":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections all in the
+      ":ref:`overview-manual/concepts:images`",
+      ":ref:`overview-manual/concepts:package feeds`", and
+      ":ref:`overview-manual/concepts:application development sdk`" sections all in the
       Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_DEB`
@@ -1696,7 +1696,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-package_write_deb` task
       writes Debian packages into the appropriate folder. For more
       information on how packaging works, see the
-      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
+      ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_IMAGE`
@@ -1710,8 +1710,8 @@ system and gives an overview of their function and contents.
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/ref-structure:the build directory - \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
-      ":ref:`overview-manual/overview-manual-concepts:images`" and
-      ":ref:`overview-manual/overview-manual-concepts:application development sdk`" sections both in
+      ":ref:`overview-manual/concepts:images`" and
+      ":ref:`overview-manual/concepts:application development sdk`" sections both in
       the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_IPK`
@@ -1732,7 +1732,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-package_write_ipk` task
       writes IPK packages into the appropriate folder. For more information
       on how packaging works, see the
-      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
+      ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_RPM`
@@ -1753,7 +1753,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-package_write_rpm` task
       writes RPM packages into the appropriate folder. For more information
       on how packaging works, see the
-      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
+      ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOY_DIR_TAR`
@@ -1774,7 +1774,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-package_write_tar` task
       writes TAR packages into the appropriate folder. For more information
       on how packaging works, see the
-      ":ref:`overview-manual/overview-manual-concepts:package feeds`" section
+      ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOYDIR`
@@ -2419,7 +2419,7 @@ system and gives an overview of their function and contents.
 
       The previous statement appears in the
       ``linux-yocto-dev.bbappend`` file, which is found in the
-      :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories` in
+      :ref:`overview-manual/development-environment:yocto project source repositories` in
       ``meta-intel/common/recipes-kernel/linux``. Here, the machine
       override is a special :term:`PACKAGE_ARCH`
       definition for multiple ``meta-intel`` machines.
@@ -2509,7 +2509,7 @@ system and gives an overview of their function and contents.
       build system uses files from ``files/defconfig``.
 
       You can find out more about the patching process in the
-      ":ref:`overview-manual/overview-manual-concepts:patching`" section
+      ":ref:`overview-manual/concepts:patching`" section
       in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/common-tasks:patching code`" section in
       the Yocto Project Development Tasks Manual. See the
@@ -3126,7 +3126,7 @@ system and gives an overview of their function and contents.
       The location is
       derived using the :term:`DEPLOY_DIR_IMAGE`
       and :term:`IMAGE_NAME` variables. You can find
-      information on how the image is created in the ":ref:`overview-manual/overview-manual-concepts:image generation`"
+      information on how the image is created in the ":ref:`overview-manual/concepts:image generation`"
       section in the Yocto Project Overview and Concepts Manual.
 
    :term:`IMAGE_NAME`
@@ -5578,7 +5578,7 @@ system and gives an overview of their function and contents.
          ${STAGING_DIR_HOST}/pkgdata
 
       For examples of how this data is used, see the
-      ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+      ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
       section in the Yocto Project Development Tasks Manual. For more
@@ -5691,9 +5691,9 @@ system and gives an overview of their function and contents.
 
          The OpenEmbedded build system does not need the aid of ``PR``
          to know when to rebuild a recipe. The build system uses the task
-         :ref:`input checksums <overview-manual/overview-manual-concepts:checksums (signatures)>` along with the
+         :ref:`input checksums <overview-manual/concepts:checksums (signatures)>` along with the
          :ref:`stamp <structure-build-tmp-stamps>` and
-         :ref:`overview-manual/overview-manual-concepts:shared state cache`
+         :ref:`overview-manual/concepts:shared state cache`
          mechanisms.
 
       The ``PR`` variable primarily becomes significant when a package
@@ -5875,7 +5875,7 @@ system and gives an overview of their function and contents.
                          libplds4.so"
 
       For more information, see the
-      ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+      ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual.
 
    :term:`PROVIDES`
@@ -6068,7 +6068,7 @@ system and gives an overview of their function and contents.
       runtime dependencies are automatically detected and added. Therefore,
       most recipes do not need to set ``RDEPENDS``. For more information,
       see the
-      ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
+      ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual.
 
       The practical effect of the above ``RDEPENDS`` assignment is that
@@ -7023,7 +7023,7 @@ system and gives an overview of their function and contents.
 
       -  ``file://`` - Fetches files, which are usually files shipped
          with the :term:`Metadata`, from the local machine (e.g.
-         :ref:`patch <overview-manual/overview-manual-concepts:patching>` files).
+         :ref:`patch <overview-manual/concepts:patching>` files).
          The path is relative to the :term:`FILESPATH`
          variable. Thus, the build system searches, in order, from the
          following directories, which are assumed to be a subdirectories of
@@ -7316,7 +7316,7 @@ system and gives an overview of their function and contents.
       see the :ref:`ref-tasks-populate_sysroot`
       task, the ":ref:`sdk-manual/sdk-extensible:sharing files between recipes`"
       section in the Yocto Project Development Tasks Manual, the
-      ":ref:`overview-manual/overview-manual-concepts:configuration, compilation, and staging`"
+      ":ref:`overview-manual/concepts:configuration, compilation, and staging`"
       section in the Yocto Project Overview and Concepts Manual, and the
       :term:`SYSROOT_DIRS` variable.
 
@@ -7437,7 +7437,7 @@ system and gives an overview of their function and contents.
 
       For information on how BitBake uses stamp files to determine if a
       task should be rerun, see the
-      ":ref:`overview-manual/overview-manual-concepts:stamp files and the rerunning of tasks`"
+      ":ref:`overview-manual/concepts:stamp files and the rerunning of tasks`"
       section in the Yocto Project Overview and Concepts Manual.
 
       See :term:`STAMPS_DIR`,
diff --git a/documentation/sdk-manual/sdk-appendix-customizing.rst b/documentation/sdk-manual/sdk-appendix-customizing.rst
index 5a33f6385..97ade0801 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing.rst
+++ b/documentation/sdk-manual/sdk-appendix-customizing.rst
@@ -87,7 +87,7 @@ adjustments:
    following:
 
    -  After ensuring the tasks are :ref:`shared
-      state <overview-manual/overview-manual-concepts:shared state cache>` tasks (i.e. the
+      state <overview-manual/concepts:shared state cache>` tasks (i.e. the
       output of the task is saved to and can be restored from the shared
       state cache) or ensuring the tasks are able to be produced quickly
       from a task that is a shared state task, add the task name to the
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 14ad23ba8..c94213d6c 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -183,7 +183,7 @@ system.
    part of an image built using the build system.
 
 The ``devtool`` command line is organized similarly to
-:ref:`overview-manual/overview-manual-development-environment:git` in that it has a number of
+:ref:`overview-manual/development-environment:git` in that it has a number of
 sub-commands for each function. You can run ``devtool --help`` to see
 all the commands.
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 4da415d86..dfe51889e 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -65,7 +65,7 @@ set up the code for the web application that "hooks" into your set of
 layers.
 
 For general information on layers, see the
-":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
+":ref:`overview-manual/yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual. For information on how
 to create layers, see the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
-- 
2.29.2

