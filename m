Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.4140.1607031544295892946
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OAO7gTl4;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id p8so3372453wrx.5
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0eFYI5D5P89sML7AU1v6tqAkIBRTx85zGJrnmMxF7cs=;
        b=OAO7gTl4aie3+ZHOuD99MWlFRtJhpIEKZAXBhW1ziWe870tONKISoiOoVCWc4LD2xP
         7G244ekkGixZw05WJrN/WF52tRhZpYVPGsH6WeKAB08InK5iZNOS3tM/E8nzLbn81xue
         O0w35nXhRhFTUzTqNXVn5HIA+kDvrD9DZ7x3kxYS/UCjMg2uF0a1WugRdIe5Fq9kgpoe
         pFqY0KwplRAq9curbCyvBk/njGjp/3qd4O1b7tpW+jqPDju6KO+gl0eto5UjjcGD6Hkb
         U9NtWyVogfmSaCuMX7GqxCIsgkvwM0P1GyM6+szBWKQgCc7AtdEj9F/3i4mc79saFpv9
         b1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0eFYI5D5P89sML7AU1v6tqAkIBRTx85zGJrnmMxF7cs=;
        b=Va60iL43Tqo71Ff42aPioC9sjsCNsVu3PK+R5HuZn2/Wa3Uydjm2fFpfscBrfqC80+
         hGABxCC9SqF0i+PisMQIdny7mG3BRIRrNTTHKiSOWiLCgS1qZ6nBjyOWdo7u2hawSB1e
         JX82V7g8ZlhXC5Kx8y6wGzVvOaK/R6yXiVt+WMhLNjWO2L7R+wEKOg7Xdz4lfoMF+x9U
         +8ICPLJf8RsDbzuaPMw0RORh1r+fVk43WGphA/DYptLaPs4o/QtFXp8eymWhT11yLHs/
         H0yQ5oxwAuW09JzqA7oCGWuigdkRIBXcEKsgubtupJmebel0QW6V2VW/JKfJ4L9LM8ET
         ytFA==
X-Gm-Message-State: AOAM533RL42KTZyMZFMkWit3MWggFVqTgG/EcHdZXdflr8Avi8ucvb37
	vEMzx1IgnxCs2FJ+XheX/B4q3Rd044JeCBKC
X-Google-Smtp-Source: ABdhPJxfWwUdXdkDKC6eYsvniKLQNp/rjI+B2tECI/SoSczRO5P8KSH2yR2dC/PbLhc9hWBS/juwvg==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr1305753wro.363.1607031542288;
        Thu, 03 Dec 2020 13:39:02 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:39:01 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 07/10] profile-manual: remove 'profile-manual' from filenames
Date: Thu,  3 Dec 2020 22:38:40 +0100
Message-Id: <20201203213843.347671-8-nicolas.dechesne@linaro.org>
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
 .../{profile-manual-arch.rst => arch.rst}      |  0
 ...rofile-manual-examples.rst => examples.rst} |  0
 documentation/profile-manual/index.rst         |  8 ++++----
 .../{profile-manual-intro.rst => intro.rst}    |  0
 .../{profile-manual-usage.rst => usage.rst}    | 18 +++++++++---------
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename documentation/profile-manual/{profile-manual-arch.rst => arch.rst} (100%)
 rename documentation/profile-manual/{profile-manual-examples.rst => examples.rst} (100%)
 rename documentation/profile-manual/{profile-manual-intro.rst => intro.rst} (100%)
 rename documentation/profile-manual/{profile-manual-usage.rst => usage.rst} (99%)

diff --git a/documentation/profile-manual/profile-manual-arch.rst b/documentation/profile-manual/arch.rst
similarity index 100%
rename from documentation/profile-manual/profile-manual-arch.rst
rename to documentation/profile-manual/arch.rst
diff --git a/documentation/profile-manual/profile-manual-examples.rst b/documentation/profile-manual/examples.rst
similarity index 100%
rename from documentation/profile-manual/profile-manual-examples.rst
rename to documentation/profile-manual/examples.rst
diff --git a/documentation/profile-manual/index.rst b/documentation/profile-manual/index.rst
index 5ec5b9e75..6e54133e0 100644
--- a/documentation/profile-manual/index.rst
+++ b/documentation/profile-manual/index.rst
@@ -10,10 +10,10 @@ Yocto Project Profiling and Tracing Manual
    :caption: Table of Contents
    :numbered:
 
-   profile-manual-intro
-   profile-manual-arch
-   profile-manual-usage
-   profile-manual-examples
+   intro
+   arch
+   usage
+   examples
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/profile-manual/profile-manual-intro.rst b/documentation/profile-manual/intro.rst
similarity index 100%
rename from documentation/profile-manual/profile-manual-intro.rst
rename to documentation/profile-manual/intro.rst
diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/usage.rst
similarity index 99%
rename from documentation/profile-manual/profile-manual-usage.rst
rename to documentation/profile-manual/usage.rst
index cc403a554..418f4e993 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -45,7 +45,7 @@ Perf Setup
 ----------
 
 For this section, we'll assume you've already performed the basic setup
-outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section.
+outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 In particular, you'll get the most mileage out of perf if you profile an
 image built with the following in your ``local.conf`` file: ::
@@ -1183,7 +1183,7 @@ ftrace Setup
 ------------
 
 For this section, we'll assume you've already performed the basic setup
-outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section.
+outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 ftrace, trace-cmd, and kernelshark run on the target system, and are
 ready to go out-of-the-box - no additional setup is necessary. For the
@@ -1871,7 +1871,7 @@ having done a build: ::
 
 So essentially what you need to
 do is build an SDK image or image with 'tools-profile' as detailed in
-the ":ref:`profile-manual/profile-manual-intro:General Setup`" section of this
+the ":ref:`profile-manual/intro:General Setup`" section of this
 manual, and boot the resulting target image.
 
 .. note::
@@ -1954,7 +1954,7 @@ Sysprof Setup
 -------------
 
 For this section, we'll assume you've already performed the basic setup
-outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section.
+outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 
 Sysprof is a GUI-based application that runs on the target system. For
 the rest of this document we assume you've ssh'ed to the host and will
@@ -2025,7 +2025,7 @@ LTTng Setup
 -----------
 
 For this section, we'll assume you've already performed the basic setup
-outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section.
+outlined in the ":ref:`profile-manual/intro:General Setup`" section.
 LTTng is run on the target system by ssh'ing to it.
 
 Collecting and Viewing Traces
@@ -2033,7 +2033,7 @@ Collecting and Viewing Traces
 
 Once you've applied the above commits and built and booted your image
 (you need to build the core-image-sato-sdk image or use one of the other
-methods described in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section), you're ready to start
+methods described in the ":ref:`profile-manual/intro:General Setup`" section), you're ready to start
 tracing.
 
 Collecting and viewing a trace on the target (inside a shell)
@@ -2230,14 +2230,14 @@ blktrace Setup
 --------------
 
 For this section, we'll assume you've already performed the basic setup
-outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`"
+outlined in the ":ref:`profile-manual/intro:General Setup`"
 section.
 
 blktrace is an application that runs on the target system. You can run
 the entire blktrace and blkparse pipeline on the target, or you can run
 blktrace in 'listen' mode on the target and have blktrace and blkparse
 collect and analyze the data on the host (see the
-":ref:`profile-manual/profile-manual-usage:Using blktrace Remotely`" section
+":ref:`profile-manual/usage:Using blktrace Remotely`" section
 below). For the rest of this section we assume you've ssh'ed to the host and
 will be running blkrace on the target.
 
@@ -2512,7 +2512,7 @@ Tracing Block I/O via 'ftrace'
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 It's also possible to trace block I/O using only
-:ref:`profile-manual/profile-manual-usage:The 'trace events' Subsystem`, which
+:ref:`profile-manual/usage:The 'trace events' Subsystem`, which
 can be useful for casual tracing if you don't want to bother dealing with the
 userspace tools.
 
-- 
2.29.2

