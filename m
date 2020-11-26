Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.2999.1606384124779609909
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZbmOOhhJ;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id g14so1397320wrm.13
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z68JxsmvUnkkKead5FZvUh8pzKXyHKjOKfl1vzoZRYk=;
        b=ZbmOOhhJFN/iv57Z/yKmtVCC3LzghMgfTP0Kq/WCyIShHKfU5Y1wBDq8blRIhl/4MU
         dCG2TXu/hL6keQ4kU3zuz+itnizdDfIl3BLlKRSac/6gjH1eJtKlf7+6rgKMfso5s95y
         tjcH9H8j8CiGRa04/MgXFxfS3CoavgNiUDAXh/x6rv7h4SvGQVweOh4M3rZBCORJagFq
         KrUmKi1I07TO+5x5PqJQFF0PcrvoR0yrtGIolss6jHlLh+9+cvb4EATDC04WBUSCBldm
         uGl3R7p+Q/dsPykGSMRX7N5CJTuS2hexCHR6hi2SVppNcCc3TUA9W+OqSsPGNVSEo0Z5
         WXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z68JxsmvUnkkKead5FZvUh8pzKXyHKjOKfl1vzoZRYk=;
        b=MixTct8glnzBBbTb0mBDl7pMO7WeaeOs0KIAFvJrMtCtmJnHoArd9pJsngywSEnLZN
         hiNwuk6y/6u2q8049KhMl0xN565BksSbya4R9TN98nUrGrU4iG4g0Z+d/1F/el95lv2B
         SGeixOLsrsN4o8RfGggFEFMphZ0UiZctsg9OJsOVwUgVen122rDvIZWQxA5L0Tblgobv
         P0qWNWp1j/iIZgfvnVmo8qRWYWnhiCteY9RgZk4GVNeTVtqef7vyLrCD7Pty9pxot/fO
         0EXnC3dEWP8+DVnvLvUdHWl4iiJ1E+SsExUg01lDla9JSu76A1amCkdIt4+/cRpoSF1T
         6sxQ==
X-Gm-Message-State: AOAM530YgRK+g9BrhO8FIkad9zmDbdLM8XIJQdkqNnH5FWBo28TonkR6
	amLmsF8/MngxDXw3+FTpG/1tjKrecsfHWQYk
X-Google-Smtp-Source: ABdhPJzB03MaYup6D7seSVc7mBm8/ev2bJ8oFaUZPfJ0KDVGxipPbDA56723+jFGZ4JjIqf272oJ9w==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr2726575wrp.91.1606384122949;
        Thu, 26 Nov 2020 01:48:42 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:42 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 3/7] dev-manual: replace labels with references to section title
Date: Thu, 26 Nov 2020 10:48:23 +0100
Message-Id: <20201126094827.95641-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../dev-manual/dev-manual-common-tasks.rst    | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 1640a884d..23c2be4f4 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -1364,7 +1364,7 @@ files. Fetching is controlled mainly through the
 :term:`SRC_URI` variable. Your recipe
 must have a ``SRC_URI`` variable that points to where the source is
 located. For a graphical representation of source locations, see the
-":ref:`sources-dev-environment`" section in
+":ref:`overview-manual/overview-manual-concepts:sources`" section in
 the Yocto Project Overview and Concepts Manual.
 
 The :ref:`ref-tasks-fetch` task uses
@@ -3759,7 +3759,7 @@ build host running Linux.
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under
 ``tmp/deploy/images``. For detailed information on the build process
-using BitBake, see the ":ref:`images-dev-environment`" section in the
+using BitBake, see the ":ref:`overview-manual/overview-manual-concepts:images`" section in the
 Yocto Project Overview and Concepts Manual.
 
 The following figure and list overviews the build process:
@@ -6663,7 +6663,7 @@ revision, respectively). The values are highly dependent on the policies
 and procedures of a given distribution and package feed.
 
 Because the OpenEmbedded build system uses
-":ref:`signatures <overview-checksums>`", which are
+":ref:`signatures <overview-manual/overview-manual-concepts:checksums (signatures)>`", which are
 unique to a given build, the build system knows when to rebuild
 packages. All the inputs into a given task are represented by a
 signature, which can trigger a rebuild when different. Thus, the build
@@ -6906,7 +6906,7 @@ multiple times if you have more than one set of modules to package.
 
 For more examples that show how to use ``do_split_packages``, see the
 ``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
-directory of the ``poky`` :ref:`source repository <yocto-project-repositories>`. You can
+directory of the ``poky`` :ref:`source repository <overview-manual/overview-manual-development-environment:yocto project source repositories>`. You can
 also find examples in ``meta/classes/kernel.bbclass``.
 
 Following is a reference that shows ``do_split_packages`` mandatory and
@@ -9661,7 +9661,7 @@ Invalidating Shared State to Force a Task to Run
 ------------------------------------------------
 
 The OpenEmbedded build system uses
-:ref:`checksums <overview-checksums>` and
+:ref:`checksums <overview-manual/overview-manual-concepts:checksums (signatures)>` and
 :ref:`overview-manual/overview-manual-concepts:shared state` cache to avoid unnecessarily
 rebuilding tasks. Collectively, this scheme is known as "shared state
 code".
@@ -10662,7 +10662,8 @@ Yocto general mailing list or on the openembedded-devel mailing list.
 
 You can also push a change upstream and request a maintainer to pull the
 change into the component's upstream repository. You do this by pushing
-to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-and-the-yocto-project`"
+to a contribution repository that is upstream. See the
+":ref:`overview-manual/overview-manual-development-environment:git workflows and the yocto project`"
 section in the Yocto Project Overview and Concepts Manual for additional
 concepts on working in the Yocto Project development environment.
 
@@ -10789,7 +10790,7 @@ Yocto Project Reference Manual.
 
 Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
-:ref:`preparing-changes-for-submissions` have been followed:
+:ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` have been followed:
 
 1. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
@@ -10880,7 +10881,7 @@ and ``send-pull-request`` scripts from openembedded-core to create and send a
 patch series with a link to the branch for review.
 
 Follow this procedure to push a change to an upstream "contrib" Git
-repository once the steps in :ref:`preparing-changes-for-submissions` have
+repository once the steps in :ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` have
 been followed:
 
 .. note::
@@ -11055,8 +11056,8 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in :ref:`preparing-changes-for-submissions` and
-      :ref:`submitting-a-patch` but modify the subject header of your patch
+      steps in :ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` and
+      :ref:`dev-manual/dev-manual-common-tasks:using email to submit a patch` but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
       ``git format-patch``, for example to submit a patch to the dunfell
-- 
2.29.2

