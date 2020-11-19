Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.7189.1605779942793508000
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zXPMLM6m;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id c198so4666318wmd.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4r8VkMaxW+4aWpIvA/8FyVKpSA9EvoCGAYnpIbWD2g8=;
        b=zXPMLM6mnVXnX/n3F7XxFZ7GiZNP/hxpVpmJVK/VvYhHVycItaK3TMbZ4M5CWjRVt9
         8KPkwMp5CV+C7C1Tugbe2i3+FFBnPvfHhaxVOWR4PIN15x5R+qQLigVihyVyBvNAt0O0
         /RrilPeyGhF/wIIWirw4ifEZjrzHJbGAonE4oO8nbHNhriNLOfDDGM6lPbE9IsTVEc4l
         NCcnnqYPZZB1EAxuOmbuGlp9We92d8U5ZzXhrZfO+orywaFe+3CVON1yqMIOTs+MxXyt
         9pljV+ewcK1VWef0V9btfGlhBJ0KUtZcsIwb7rw/doFXc98FZukxHR4YyjAQzwYp1ZN2
         qXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4r8VkMaxW+4aWpIvA/8FyVKpSA9EvoCGAYnpIbWD2g8=;
        b=coXA8l9uMeeH1ZKmcTEdmS1ciAvfEjNfJQ0HF1Mqy6NMIlzPE8ZdsWchJJg+rdZV7I
         AHUmOgMqCy1QDFU5TyAJL5IUOp8kXj8bD8VUDYEo1QDEVIfmZebAdg4n1z3vTSv3Tnqg
         vZZYCyLvuKyNPjPoQ5Vu+agjSzOd+fh2mywxByWKCXQPLfH2EpYp+CXlv3ASD2JS0MJc
         VhLdcHxgedVWF6b8GDeoLdqEBGjv3A2wKydOpeJaz/w8Gxb5Wwz/GYBM7d2lR63OisE0
         vic587ndZqdk/tgkEIfbSaKd4FkGpYVtdZMyywnzFII3nJ7DpqcyJD0/V0mRf8Wrp2FD
         bWCQ==
X-Gm-Message-State: AOAM531Hdi8r+aIJjfolt6jlgBxlE9xdvb4GBYCSk2x9fLr+K2gRKQy3
	yvj077kzoT2U7YDKCHKpxCeL7n5PBohoVap+
X-Google-Smtp-Source: ABdhPJxo6hpXM2DYSlcBAWakgvwa0c/i6VHe+02enWa8kI14fvYDE89pZHxM1HF3JzQDYjgUP5TtbQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3586909wmb.175.1605779940717;
        Thu, 19 Nov 2020 01:59:00 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:59:00 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 11/11] toaster-manual: remove unused labels
Date: Thu, 19 Nov 2020 10:58:34 +0100
Message-Id: <20201119095834.284864-12-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../toaster-manual/toaster-manual-intro.rst   |  4 ----
 .../toaster-manual-reference.rst              | 22 -------------------
 .../toaster-manual-setup-and-use.rst          | 16 --------------
 .../toaster-manual/toaster-manual-start.rst   |  6 -----
 4 files changed, 48 deletions(-)

diff --git a/documentation/toaster-manual/toaster-manual-intro.rst b/documentation/toaster-manual/toaster-manual-intro.rst
index 408c6fa3c..e34e7bac4 100644
--- a/documentation/toaster-manual/toaster-manual-intro.rst
+++ b/documentation/toaster-manual/toaster-manual-intro.rst
@@ -10,8 +10,6 @@ enables you to configure and run your builds. Information about builds
 is collected and stored in a database. You can use Toaster to configure
 and start builds on multiple remote build servers.
 
-.. _intro-features:
-
 Toaster Features
 ================
 
@@ -82,8 +80,6 @@ For an overview of Toaster shipped with the Yocto Project &DISTRO;
 Release, see the "`Toaster - Yocto Project
 2.2 <https://youtu.be/BlXdOYLgPxA>`__" video.
 
-.. _toaster-installation-options:
-
 Installation Options
 ====================
 
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/toaster-manual-reference.rst
index e5e3531e8..2202d599f 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/toaster-manual-reference.rst
@@ -47,8 +47,6 @@ Metadata Index.
    You do not have to use a layer source to use Toaster. Tying into a
    layer source is optional.
 
-.. _layer-source-using-with-toaster:
-
 Setting Up and Using a Layer Source
 -----------------------------------
 
@@ -73,8 +71,6 @@ section in the Yocto Project Overview and Concepts Manual. For information on ho
 to create layers, see the ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
-.. _configuring-toaster-to-hook-into-your-layer-source:
-
 Configuring Toaster to Hook Into Your Layer Index
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -143,8 +139,6 @@ Toaster database by running the following command:
 If Toaster can reach the API URL, you should see a message telling you that
 Toaster is updating the layer source information.
 
-.. _toaster-releases:
-
 Releases
 ========
 
@@ -157,8 +151,6 @@ However, you can modify, delete, and create new releases according to
 your needs. This section provides some background information on
 releases.
 
-.. _toaster-releases-supported:
-
 Pre-Configured Releases
 -----------------------
 
@@ -295,8 +287,6 @@ release selection:
       <field type="CharField" name="dirpath">bitbake</field>
    </object>
 
-.. _defining-releases:
-
 Defining Release
 ~~~~~~~~~~~~~~~~
 
@@ -518,8 +508,6 @@ build:
 The JSON data for this query is returned in a single line. In the
 previous example the line has been artificially split for readability.
 
-.. _toaster-useful-commands:
-
 Useful Commands
 ===============
 
@@ -548,8 +536,6 @@ tasks. You can locate these commands in the
       Build Directory. To do so, the ``toastermain/settings.py`` file
       must be configured to point to the correct database backend.
 
-.. _toaster-command-buildslist:
-
 ``buildslist``
 --------------
 
@@ -580,8 +566,6 @@ command would return something like the following::
 
    1: qemux86 poky core-image-minimal
 
-.. _toaster-command-builddelete:
-
 ``builddelete``
 ---------------
 
@@ -600,8 +584,6 @@ Prior to running the ``builddelete`` command, you need to get the ID
 associated with builds by using the
 :ref:`toaster-manual/toaster-manual-reference:\`\`buildslist\`\`` command.
 
-.. _toaster-command-perf:
-
 ``perf``
 --------
 
@@ -615,8 +597,6 @@ follows:
 The command is a sanity check that returns page loading times in order to
 identify performance problems.
 
-.. _toaster-command-checksettings:
-
 ``checksettings``
 -----------------
 
@@ -644,8 +624,6 @@ ready, you can run the following:
 
 After running these commands, you can run the ``checksettings`` command.
 
-.. _toaster-command-runbuilds:
-
 ``runbuilds``
 -------------
 
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
index 97c5af6a0..b73caac37 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
@@ -121,8 +121,6 @@ can set the ``TOASTER_DIR`` environment variable, which takes precedence
 over your current working directory. Setting this environment variable
 causes Toaster to create and use ``$TOASTER_DIR./_toaster_clones``.
 
-.. _toaster-the-build-directory:
-
 The Build Directory
 ===================
 
@@ -135,8 +133,6 @@ directories to be in a particular location, you can set the
 current working directory. Setting this environment variable causes
 Toaster to use ``$TOASTER_DIR/build`` as the build directory.
 
-.. _toaster-creating-a-django-super-user:
-
 Creating a Django Superuser
 ===========================
 
@@ -186,8 +182,6 @@ You can use the Django administration interface to set Toaster configuration
 parameters such as the build directory, layer sources, default variable
 values, and BitBake versions.
 
-.. _toaster-setting-up-a-production-instance-of-toaster:
-
 Setting Up a Production Instance of Toaster
 ===========================================
 
@@ -197,8 +191,6 @@ instance is also the setup that can handle heavier loads on the web
 service. Use the instructions in the following sections to set up
 Toaster to run builds through the Toaster web interface.
 
-.. _toaster-production-instance-requirements:
-
 Requirements
 ------------
 
@@ -230,8 +222,6 @@ Be sure you meet the following requirements:
 
       $ sudo zypper install apache2 apache2-mod_wsgi-python3 python3-pip mariadb mariadb-client python3-devel
 
-.. _toaster-installation-steps:
-
 Installation
 ------------
 
@@ -504,8 +494,6 @@ The Toaster web interface allows you to do the following:
 -  See performance information such as build time, task time, CPU usage,
    and disk I/O.
 
-.. _web-interface-videos:
-
 Toaster Web Interface Videos
 ----------------------------
 
@@ -551,8 +539,6 @@ Following are several videos that show how to use the Toaster GUI:
    `video <https://www.youtube.com/watch?v=qWGMrJoqusQ>`__ shows the
    build performance data provided by Toaster.
 
-.. _a-note-on-the-local-yocto-project-release:
-
 Additional Information About the Local Yocto Project Release
 ------------------------------------------------------------
 
@@ -604,8 +590,6 @@ them into your Toaster project, using the "Import layer" page.
    :align: center
    :scale: 75%
 
-.. _toaster-web-interface-preferred-version:
-
 Building a Specific Recipe Given Multiple Versions
 --------------------------------------------------
 
diff --git a/documentation/toaster-manual/toaster-manual-start.rst b/documentation/toaster-manual/toaster-manual-start.rst
index 267f9f4cd..888337416 100644
--- a/documentation/toaster-manual/toaster-manual-start.rst
+++ b/documentation/toaster-manual/toaster-manual-start.rst
@@ -9,8 +9,6 @@ Preparing to Use Toaster
 This chapter describes how you need to prepare your system in order to
 use Toaster.
 
-.. _toaster-setting-up-the-basic-system-requirements:
-
 Setting Up the Basic System Requirements
 ========================================
 
@@ -22,8 +20,6 @@ also need to do an additional install of pip3. ::
 
    $ sudo apt-get install python3-pip
 
-.. _toaster-establishing-toaster-system-dependencies:
-
 Establishing Toaster System Dependencies
 ========================================
 
@@ -35,8 +31,6 @@ directory, which is located in the root directory of the
 ``poky/bitbake/toaster-requirements.txt``). The dependencies appear in a
 ``pip``, install-compatible format.
 
-.. _toaster-load-packages:
-
 Install Toaster Packages
 ------------------------
 
-- 
2.29.2

