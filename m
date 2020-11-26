Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.3001.1606384128070063017
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nvPnaAK+;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id a186so1533015wme.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8A9cZ1+DWAHGVTQpQUYjp3qWea6GJN//LsmTgRxQKo=;
        b=nvPnaAK+HwFLVlnI7/M5T/cXjkDE60FJdnBb6EcNj7rVltr9GBr9MZUwdrPW4+ek7P
         VO0/fncixqa4bOuEoqmqpAaWXDG+NULYDJDow0CY3m3kgpjX9jJZtAFIqyN4sOSyxV6j
         IW7nZMPrxqi2pDYMeZBcmGmCBhZEazHAc6So42S1I79qKvp7nG5IxPnr7aLVNzHiOkAP
         0Me1WAgLT+nyXusOqnuHik/rlUUX6G64Pnt3xXNya2g3U06wsqBuM+nTo2XC5GTwa0mG
         AMcEueDa3jr/V6v0Z81u+KaXiZ+3By2BWmkGiue9CfeWBVybYbXHWQo69NoviJT4SE+A
         3tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8A9cZ1+DWAHGVTQpQUYjp3qWea6GJN//LsmTgRxQKo=;
        b=ty/IcdxEldnZocuwGV0EXanoeJqHYkvAx0Su92aSI/JO4598fF6BTi/oQ0hNRvKXxK
         T6bbOWrLU9zQa8OuTU9Nvzp9BoUzTlBY41aXcqjMcbvkkOqAMC6o+1wY8EHYdsLTxam5
         tbTfOXKV7p5gUzLtHovkXFj544TrvLI+R+31WCrlXVa5zRxrhhxjccbxw6RkU016qWPH
         WpjqOX/DyF9UkqsJufzmGlU90B1zktH+MoHapJMx367glV05SHFJAOKRFv+pWvZKnz5h
         l7vsF0Q8Dy3NQ4Xk/kptI5B57dLo1YIAkg+CaHZtAkZPJ+2akmwV0L8E53roSxiimItu
         Exwg==
X-Gm-Message-State: AOAM532dAHYHXH6ud5CRzDr1Zt72+fVAAkPsnvaXwO2KFvULu2LSdksm
	SyveDOwmv2nnHuh5/wGcVs7afCXvDKO3ntCO
X-Google-Smtp-Source: ABdhPJzKNMKH21QwuzUmVbKCTQrMAJuzIkzKRxx8XPmwbQ5FAPdeaavYtq1VfYohyP+LNAV/w5hdYg==
X-Received: by 2002:a1c:e287:: with SMTP id z129mr2353059wmg.94.1606384125976;
        Thu, 26 Nov 2020 01:48:45 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:45 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 6/7] overview-manual: remove unused labels
Date: Thu, 26 Nov 2020 10:48:26 +0100
Message-Id: <20201126094827.95641-7-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../overview-manual-concepts.rst              | 40 -------------------
 ...verview-manual-development-environment.rst |  6 ---
 .../overview-manual/overview-manual-intro.rst |  4 --
 .../overview-manual-yp-intro.rst              | 22 ----------
 4 files changed, 72 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index f1f2b7f35..353a2f99f 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -43,8 +43,6 @@ see the
 ":ref:`overview-manual/overview-manual-concepts:openembedded build system concepts`"
 section.
 
-.. _usingpoky-components-bitbake:
-
 BitBake
 -------
 
@@ -92,8 +90,6 @@ occurs, the target that failed and those that depend on it cannot be
 remade. However, when you use this option other dependencies can still
 be processed.
 
-.. _overview-components-recipes:
-
 Recipes
 -------
 
@@ -109,8 +105,6 @@ the word "package" is used for the packaged output from the OpenEmbedded
 build system (i.e. ``.ipk`` or ``.deb`` files), this document avoids
 using the term "package" when referring to recipes.
 
-.. _overview-components-classes:
-
 Classes
 -------
 
@@ -122,8 +116,6 @@ The ":ref:`ref-manual/ref-classes:Classes`" chapter in the
 Yocto Project Reference Manual provides details about classes and how to
 use them.
 
-.. _overview-components-configurations:
-
 Configurations
 --------------
 
@@ -135,8 +127,6 @@ common configuration options, and user configuration options in
 ``conf/local.conf``, which is found in the :term:`Build Directory`.
 
 
-.. _overview-layers:
-
 Layers
 ======
 
@@ -166,8 +156,6 @@ layers suitable for the Yocto Project in the
 ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
-.. _openembedded-build-system-build-concepts:
-
 OpenEmbedded Build System Concepts
 ==================================
 
@@ -527,8 +515,6 @@ their respective layers.
 This layer contains any recipes, append files, and patches, that your
 project needs.
 
-.. _sources-dev-environment:
-
 Sources
 -------
 
@@ -601,8 +587,6 @@ class to include that local project. You use either the ``local.conf``
 or a recipe's append file to override or set the recipe to point to the
 local directory on your disk to pull in the whole source tree.
 
-.. _scms:
-
 Source Control Managers (Optional)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -644,8 +628,6 @@ Regular mirrors can be any site across the Internet that is used as an
 alternative location for source code should the primary site not be
 functioning for some reason or another.
 
-.. _package-feeds-dev-environment:
-
 Package Feeds
 -------------
 
@@ -709,8 +691,6 @@ qemux86 exist. Packages for the i586 architecture are placed in
 ``build/tmp/deploy/ipk/i586``, while packages for the qemux86
 architecture are placed in ``build/tmp/deploy/ipk/qemux86``.
 
-.. _bitbake-dev-environment:
-
 BitBake Tool
 ------------
 
@@ -727,8 +707,6 @@ those areas.
    BitBake User Manual
    for reference material on BitBake.
 
-.. _source-fetching-dev-environment:
-
 Source Fetching
 ~~~~~~~~~~~~~~~
 
@@ -819,8 +797,6 @@ Build Directory's hierarchy:
    what the OpenEmbedded build system is using as a build target (e.g.
    general architecture, a build host, an SDK, or a specific machine).
 
-.. _patching-dev-environment:
-
 Patching
 ~~~~~~~~
 
@@ -861,8 +837,6 @@ Software Development Kit (SDK) manual and the
 ":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
 section in the Yocto Project Linux Kernel Development Manual.
 
-.. _configuration-compilation-and-staging-dev-environment:
-
 Configuration, Compilation, and Staging
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -922,8 +896,6 @@ This step in the build process consists of the following tasks:
    variable. Packaging occurs later using files from this holding
    directory.
 
-.. _package-splitting-dev-environment:
-
 Package Splitting
 ~~~~~~~~~~~~~~~~~
 
@@ -1004,8 +976,6 @@ that part of the build process.
    functionality is highly distribution-specific and thus is not
    provided out of the box.
 
-.. _image-generation-dev-environment:
-
 Image Generation
 ~~~~~~~~~~~~~~~~
 
@@ -1127,8 +1097,6 @@ build system has created the final image output files.
    Pseudo. Running under Pseudo ensures that the files in the root filesystem
    have correct ownership.
 
-.. _sdk-generation-dev-environment:
-
 SDK Generation
 ~~~~~~~~~~~~~~
 
@@ -1303,8 +1271,6 @@ variable is the function that determines whether a given dependency
 needs to be followed, and whether for any given relationship the
 function needs to be passed. The function returns a True or False value.
 
-.. _images-dev-environment:
-
 Images
 ------
 
@@ -1363,8 +1329,6 @@ current configuration.
    These links might be useful for external scripts that need to obtain
    the latest version of each file.
 
-.. _sdk-dev-environment:
-
 Application Development SDK
 ---------------------------
 
@@ -1677,8 +1641,6 @@ them if they are deemed to be valid.
 The rest of this section goes into detail about the overall incremental
 build architecture, the checksums (signatures), and shared state.
 
-.. _concepts-overall-architecture:
-
 Overall Architecture
 --------------------
 
@@ -1697,8 +1659,6 @@ specific tasks. This methodology does not scale well and does not allow
 users to easily add new tasks in layers or as external recipes without
 touching the packaged-staging core.
 
-.. _overview-checksums:
-
 Checksums (Signatures)
 ----------------------
 
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 4bedd6df6..983e1919e 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -45,8 +45,6 @@ also find helpful information on how to participate in the Linux
 Community
 `here <https://www.kernel.org/doc/html/latest/process/index.html>`__.
 
-.. _gs-the-development-host:
-
 The Development Host
 ====================
 
@@ -134,8 +132,6 @@ methods exist for you to do work in the Yocto Project environment:
    Toaster and on how to use Toaster in general, see the
    :doc:`../toaster-manual/toaster-manual`.
 
-.. _yocto-project-repositories:
-
 Yocto Project Source Repositories
 =================================
 
@@ -214,8 +210,6 @@ development:
    ":ref:`dev-manual/dev-manual-start:using the downloads page`"
    section in the Yocto Project Development Tasks Manual.
 
-.. _gs-git-workflows-and-the-yocto-project:
-
 Git Workflows and the Yocto Project
 ===================================
 
diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/overview-manual-intro.rst
index 8885eb89f..f69824da9 100644
--- a/documentation/overview-manual/overview-manual-intro.rst
+++ b/documentation/overview-manual/overview-manual-intro.rst
@@ -4,8 +4,6 @@
 The Yocto Project Overview and Concepts Manual
 **********************************************
 
-.. _overview-manual-welcome:
-
 Welcome
 =======
 
@@ -57,8 +55,6 @@ This manual does not give you the following:
    Manager Git is better covered with Internet searches and official Git
    Documentation than through the Yocto Project documentation.
 
-.. _overview-manual-other-information:
-
 Other Information
 =================
 
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 9073582ac..83ed18a37 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -35,8 +35,6 @@ by Drew Moseley and in this short introductory
 The remainder of this section overviews advantages and challenges tied
 to the Yocto Project.
 
-.. _gs-features:
-
 Features
 --------
 
@@ -136,8 +134,6 @@ Project:
    for review by people who need to track the use of open source
    licenses (e.g. legal teams).
 
-.. _gs-challenges:
-
 Challenges
 ----------
 
@@ -296,8 +292,6 @@ components and tools are downloaded separately.
 This section provides brief overviews of the components and tools
 associated with the Yocto Project.
 
-.. _gs-development-tools:
-
 Development Tools
 -----------------
 
@@ -353,8 +347,6 @@ applications using the Yocto Project:
    view information about builds. For information on Toaster, see the
    :doc:`../toaster-manual/toaster-manual`.
 
-.. _gs-production-tools:
-
 Production Tools
 ----------------
 
@@ -450,8 +442,6 @@ activities using the Yocto Project:
    You can read more about Pseudo in the "`Fakeroot and
    Pseudo <#fakeroot-and-pseudo>`__" section.
 
-.. _gs-openembedded-build-system:
-
 Open-Embedded Build System Components
 -------------------------------------
 
@@ -496,8 +486,6 @@ The following list consists of components associated with the
    components such as BitBake, OE-Core, script "glue", and documentation
    for its build system.
 
-.. _gs-reference-distribution-poky:
-
 Reference Distribution (Poky)
 -----------------------------
 
@@ -520,8 +508,6 @@ To use the Yocto Project tools and components, you can download
 You can read more about Poky in the "`Reference Embedded Distribution
 (Poky) <#reference-embedded-distribution>`__" section.
 
-.. _gs-packages-for-finished-targets:
-
 Packages for Finished Targets
 -----------------------------
 
@@ -560,8 +546,6 @@ targets:
    You can find the opkg source in the Yocto Project
    :yocto_git:`Source Repositories <>`.
 
-.. _gs-archived-components:
-
 Archived Components
 -------------------
 
@@ -588,8 +572,6 @@ Linux.
    using the Yocto Project on a system not native to Linux is with
    `CROPS <#gs-crops-overview>`__.
 
-.. _gs-development-methods:
-
 Development Methods
 ===================
 
@@ -671,8 +653,6 @@ Project.
    For information about and how to use Toaster, see the 
    :doc:`../toaster-manual/toaster-manual`.
 
-.. _reference-embedded-distribution:
-
 Reference Embedded Distribution (Poky)
 ======================================
 
@@ -776,8 +756,6 @@ operators, see the
 ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`"
 section in the BitBake User's Manual.
 
-.. _openembedded-build-system-workflow:
-
 The OpenEmbedded Build System Workflow
 ======================================
 
-- 
2.29.2

