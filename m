Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.4191.1607031540714755120
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PqQApomB;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id e7so3365521wrv.6
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9qC56RDSBfr5y3Z8lq/bIGaxYm2DT5iifghVC6kIyK0=;
        b=PqQApomBUm0RfIVw+ldC+mi6vGrG8kDrCobetgXMyErplOgSPZU9LIepM8iK8KWI72
         eHdY1UownL/8dEzIcDuyZU9siNU7pnuAnoziE03ALkbW4IvLAoSJCqc+RxiRhBe0atqA
         6uSzhGhviwXQCcaiNlWUqZCuZzCJauvbPeRiU8CGVtRmPu/V5+jc/fkamEHFRzJgfA31
         w0FAzXEElWKWuf5MG5PdH3TOWVG/E8/2Qh4PA+qL3At70XX7dSNADK06KbUpohSR0M3A
         7JUS4Mzl9j8fXl4/f75wcXQrS+fMH4nw48OaXKmjb0UbHrJh6MnZ9p99vzgsDS8gJlsD
         hiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qC56RDSBfr5y3Z8lq/bIGaxYm2DT5iifghVC6kIyK0=;
        b=aQFZRlruXf8VXuDRg4verqek7peF2U8fTO5NQnzQnLXgJdtol7/NEznSeUTpBamfke
         kl6ElDgMJXVmZI5cX3NOSHqIuojo41TBOVEJrPoQldcj4S5afcGpH7b3t+cZX8fCToHN
         6BX6av9Ilst72ECF45WoWG0B42dv4bEmsfOfFWQFv1WdnT9SBCvcecuK75mCy42A1KqN
         t8fRqeRQNvmRk5OWoEq59JyRZUxsybMR37JCmHCaFlTsSinoP0Y18VOXZ+xkYnZMiiLl
         cJATOBlEFocGLibB9ZbN4vfIflu1tDe9yRsaIa7iOt+S6xYNLsqgEvep7gE5LTdGrRLX
         Ut+g==
X-Gm-Message-State: AOAM5303tkDsNHhSBkERakLSzJ/SlVKfPs9bJRzzWaVKo//2s6waENDS
	aJvVQ2V6ETavPI/7/mXNGqwPGz71f7ZmFCwe
X-Google-Smtp-Source: ABdhPJyJWNMeUOv4WgAaUey1b/LGaro21lLFuUbIqyfqs88c+LoRjVuI9SIgfuOqruJhRC+7qPilIA==
X-Received: by 2002:adf:f609:: with SMTP id t9mr1245136wrp.369.1607031538641;
        Thu, 03 Dec 2020 13:38:58 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:38:57 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 04/10] toaster-manual: remove 'toaster-manual' from filenames
Date: Thu,  3 Dec 2020 22:38:37 +0100
Message-Id: <20201203213843.347671-5-nicolas.dechesne@linaro.org>
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
 documentation/dev-manual/dev-manual-start.rst          |  6 +++---
 documentation/ref-manual/migration-2.1.rst             |  2 +-
 documentation/toaster-manual/index.rst                 |  8 ++++----
 .../{toaster-manual-intro.rst => intro.rst}            |  2 +-
 .../{toaster-manual-reference.rst => reference.rst}    |  8 ++++----
 ...ster-manual-setup-and-use.rst => setup-and-use.rst} | 10 +++++-----
 .../{toaster-manual-start.rst => start.rst}            |  0
 7 files changed, 18 insertions(+), 18 deletions(-)
 rename documentation/toaster-manual/{toaster-manual-intro.rst => intro.rst} (97%)
 rename documentation/toaster-manual/{toaster-manual-reference.rst => reference.rst} (98%)
 rename documentation/toaster-manual/{toaster-manual-setup-and-use.rst => setup-and-use.rst} (98%)
 rename documentation/toaster-manual/{toaster-manual-start.rst => start.rst} (100%)

diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index d4727a6f6..75b5d7b5f 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -345,7 +345,7 @@ section. If you are going
 to use the Extensible SDK, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/index`. If you are going to use
-Toaster, see the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
+Toaster, see the ":doc:`/toaster-manual/setup-and-use`"
 section in the Toaster User Manual.
 
 Setting Up to Use CROss PlatformS (CROPS)
@@ -445,7 +445,7 @@ section. If you are going to use the Extensible SDK container, see the
 ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
-the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
+the ":doc:`/toaster-manual/setup-and-use`"
 section in the Toaster User Manual.
 
 Setting Up to Use Windows Subsystem For Linux (WSLv2)
@@ -560,7 +560,7 @@ you were running on a native Linux machine. If you are going to use the
 Extensible SDK container, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
-the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
+the ":doc:`/toaster-manual/setup-and-use`"
 section in the Toaster User Manual.
 
 Locating Yocto Project Source Files
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 25ee21499..ada9d2986 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -217,7 +217,7 @@ The following changes have been made to the build system user interface:
 -  *Hob GTK+-based UI*: Removed because it is unmaintained and based on
    the outdated GTK+ 2 library. The Toaster web-based UI is much more
    capable and is actively maintained. See the
-   ":ref:`toaster-manual/toaster-manual-setup-and-use:using the toaster web interface`"
+   ":ref:`toaster-manual/setup-and-use:using the toaster web interface`"
    section in the Toaster User Manual for more information on this
    interface.
 
diff --git a/documentation/toaster-manual/index.rst b/documentation/toaster-manual/index.rst
index b003f1cea..f13ba7b8a 100644
--- a/documentation/toaster-manual/index.rst
+++ b/documentation/toaster-manual/index.rst
@@ -10,10 +10,10 @@ Toaster User Manual
    :caption: Table of Contents
    :numbered:
 
-   toaster-manual-intro
-   toaster-manual-start
-   toaster-manual-setup-and-use
-   toaster-manual-reference
+   intro
+   start
+   setup-and-use
+   reference
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/toaster-manual/toaster-manual-intro.rst b/documentation/toaster-manual/intro.rst
similarity index 97%
rename from documentation/toaster-manual/toaster-manual-intro.rst
rename to documentation/toaster-manual/intro.rst
index e34e7bac4..c78b3f53d 100644
--- a/documentation/toaster-manual/toaster-manual-intro.rst
+++ b/documentation/toaster-manual/intro.rst
@@ -25,7 +25,7 @@ extensive information about the build process.
    interface, you can:
 
    -  Browse layers listed in the various
-      :ref:`layer sources <toaster-manual/toaster-manual-reference:layer source>`
+      :ref:`layer sources <toaster-manual/reference:layer source>`
       that are available in your project (e.g. the OpenEmbedded Layer Index at
       http://layers.openembedded.org/layerindex/).
 
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/reference.rst
similarity index 98%
rename from documentation/toaster-manual/toaster-manual-reference.rst
rename to documentation/toaster-manual/reference.rst
index ed0bad11b..c3f0fef0a 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -476,7 +476,7 @@ get the status of a specific build, use the following call::
 
 Be sure to provide values for
 host, port, and ID. You can find the value for ID from the Builds
-Completed query. See the ":ref:`toaster-manual/toaster-manual-reference:checking status of builds completed`"
+Completed query. See the ":ref:`toaster-manual/reference:checking status of builds completed`"
 section for more information.
 
 The output is a JSON file that itemizes the specific build and includes
@@ -549,7 +549,7 @@ database.
 
 You need to run the ``buildslist`` command first to identify existing
 builds in the database before using the
-:ref:`toaster-manual/toaster-manual-reference:\`\`builddelete\`\`` command. Here is an
+:ref:`toaster-manual/reference:\`\`builddelete\`\`` command. Here is an
 example that assumes default repository and build directory names:
 
 .. code-block:: shell
@@ -558,7 +558,7 @@ example that assumes default repository and build directory names:
    $ python ../bitbake/lib/toaster/manage.py buildslist
 
 If your Toaster database had only one build, the above
-:ref:`toaster-manual/toaster-manual-reference:\`\`buildslist\`\``
+:ref:`toaster-manual/reference:\`\`buildslist\`\``
 command would return something like the following::
 
    1: qemux86 poky core-image-minimal
@@ -579,7 +579,7 @@ the database.
 
 Prior to running the ``builddelete`` command, you need to get the ID
 associated with builds by using the
-:ref:`toaster-manual/toaster-manual-reference:\`\`buildslist\`\`` command.
+:ref:`toaster-manual/reference:\`\`buildslist\`\`` command.
 
 ``perf``
 --------
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
similarity index 98%
rename from documentation/toaster-manual/toaster-manual-setup-and-use.rst
rename to documentation/toaster-manual/setup-and-use.rst
index 6e2ba0253..2cb7884eb 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -10,7 +10,7 @@ Starting Toaster for Local Development
 ======================================
 
 Once you have set up the Yocto Project and installed the Toaster system
-dependencies as described in the ":ref:`toaster-manual/toaster-manual-start:Preparing to Use
+dependencies as described in the ":ref:`toaster-manual/start:Preparing to Use
 Toaster`" chapter, you are ready to start
 Toaster.
 
@@ -30,7 +30,7 @@ Next, from the build directory (e.g.
 
 You can now run your builds from the command line, or with Toaster
 as explained in section
-":ref:`toaster-manual/toaster-manual-setup-and-use:using the toaster web interface`".
+":ref:`toaster-manual/setup-and-use:using the toaster web interface`".
 
 To access the Toaster web interface, open your favorite browser and
 enter the following::
@@ -200,7 +200,7 @@ Be sure you meet the following requirements:
 
    You must comply with all Apache, ``mod-wsgi``, and Mysql requirements.
 
--  Have all the build requirements as described in the ":ref:`toaster-manual/toaster-manual-start:Preparing to
+-  Have all the build requirements as described in the ":ref:`toaster-manual/start:Preparing to
    Use Toaster`" chapter.
 
 -  Have an Apache webserver.
@@ -314,7 +314,7 @@ Perform the following steps to install Toaster:
     ``TEMPLATECONF`` value reflects the contents of
     ``poky/.templateconf``, and by default, should include the string
     "poky". For more information on the Toaster configuration file, see
-    the ":ref:`toaster-manual/toaster-manual-reference:Configuring Toaster`" section.
+    the ":ref:`toaster-manual/reference:Configuring Toaster`" section.
 
     This line also runs the ``checksettings`` command, which configures
     the location of the Toaster :term:`Build Directory`.
@@ -544,7 +544,7 @@ Additional Information About the Local Yocto Project Release
 
 This section only applies if you have set up Toaster for local
 development, as explained in the
-":ref:`toaster-manual/toaster-manual-setup-and-use:starting toaster for local development`"
+":ref:`toaster-manual/setup-and-use:starting toaster for local development`"
 section.
 
 When you create a project in Toaster, you will be asked to provide a
diff --git a/documentation/toaster-manual/toaster-manual-start.rst b/documentation/toaster-manual/start.rst
similarity index 100%
rename from documentation/toaster-manual/toaster-manual-start.rst
rename to documentation/toaster-manual/start.rst
-- 
2.29.2

