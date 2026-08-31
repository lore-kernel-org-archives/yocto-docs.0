Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9A2C61DE4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 03:15:09 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21910.1788146106719929669
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 20:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JOzllzEJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e55b62640so168717185a.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 20:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788146106; x=1788750906; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebQaL9a88eicykQUu4bavK3BbR0R56lVc4N+DEsDiqU=;
        b=JOzllzEJRV69qU+f+mk6YiXFWwEYmQgc8I4SYvSLBJmcNFT/csVO9VC9C2RRy82d+W
         vkFVHte7LhfQIpa7igMoWlk1FxiB8tAyM2RAZv9mW5pIV6rsMg+HeHTsKIU+qN91SmJM
         SkVng5gpqv8PSH5ct3eIVUHqTwt+WkaSo6t9reBPc4qQcbNz3h+Yl7FTKD/4hJBGa2lP
         ooxwEWm9JrUDMfLfMWxdem9zpafKnGPxT4WFK8M86qkdshTmcKcwikFnsw5KQ3cG3YpP
         65tkgqatOj12Z2kaJ6Zti9mLWfHmQS1bN4WkGIgxay8i57qxAqZFheV39eTfI2fjqWEM
         3YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146106; x=1788750906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ebQaL9a88eicykQUu4bavK3BbR0R56lVc4N+DEsDiqU=;
        b=T9R+jmA/qjNqeb2w8wjqX0ZQ9oDrpi/WlhpyFY3SbQdM9F0XQ+c2LC1XroLCsk7KRJ
         06ApeiAubugQMfDybH2G0ze6Ach+PMY54mQTMs0OHgFdD5y4eVhwmEXet9iF62cYslBM
         Ll5miFOiOM2Djh+kI9PLxs5QQPgVAj819PtxHzP9shWExpj4f/eimyM31wHviEIik/hl
         71jnM5gIjuqt5caGrRofuqNOH5BkQl1on+o8cbOu0e/cpkccDH0PdkDmX/B3XQW7GquL
         NLz3my0MvCDQsACZjb28eDQ5hMWX2TIzTLvuDOy9D9VoAElhleECwxmoKdVAX8+7OYp4
         ZyDQ==
X-Gm-Message-State: AFuF++n0m4+biYS2/IjeJqHaz4SMrynM0Retr8F9AXqPBlJxSflWZc0O
	7/64ifY1P5eqVLkmKogKue6dXwAAU69ZK5XOmEUiju65Efv83KeM+/NMZfmpxzqF
X-Gm-Gg: AR+sD12c2bEmj0tP5ZXyCViVgxv2e2cQdFI6ftKVglkNcNZP7SBtQbTu7jaNNKe8zjD
	ncjiecYmIIq0a2vEKVc6JHPQ/sUQfgYRLr8sckmuN3F02o3JOn6A8FmyUEcPlyI71lmPi06+95S
	9KIggahgoZIMq7DBi8ur8Oi47HM+Ucrr8/6pfQ+qMG2/vbW91Yo7d32LxTITzfKmJ+cwNtkZWtF
	plMlTMQTlAvInZaJGeghCb4TwP2I6mqH0eSF3FQ2I/pXoNasK5Tufsjv8ItCdvAR9HmU83JU9tO
	eW2QB/99vXeeBbrKDirBtoxMhIpuUBBB8MjQEuJzn6VFNjS633By4nPvc2AXnOzLaR6YDiUEisR
	/iHNt1n5kkvJxDxs7xdZ+8Wf9bNRoJsuAQrAd3FAfRhy7ozaUBNCDTPjtPaxwrqCCyjjxVha0Pe
	EaD/f3LzMf5Sb3KIgjYb7gz/cu0PWzjGBc5hGR5xWNWi6nICU+TZ5bP/+KuYul75rz8b7zyblBQ
	KCIDc8fxt9vxN1uvxsjbuHd4cimJqpxn0jJhkGb
X-Received: by 2002:a05:620a:4156:b0:930:e48f:47c1 with SMTP id af79cd13be357-939138df434mr2535953485a.35.1788146105520;
        Sun, 30 Aug 2026 20:15:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939359fdf60sm228632685a.23.2026.08.30.20.15.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:15:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: document the conventions used in the manuals
Date: Sun, 30 Aug 2026 23:14:58 -0400
Message-ID: <20260831031458.4070250-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 03:15:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10412

The manuals use angle brackets for placeholders and a prompt to mark a
command, and say so nowhere. A reader can only infer both, and one
example reads as advice to paste a line that will not parse.

Include the new section from every manual, the way the boilerplate is
included, so each is self-contained.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst |  2 +
 documentation/bsp-manual/index.rst           |  2 +
 documentation/contributor-guide/index.rst    |  2 +
 documentation/conventions.rst                | 53 ++++++++++++++++++++
 documentation/dev-manual/index.rst           |  2 +
 documentation/kernel-dev/index.rst           |  2 +
 documentation/migration-guides/index.rst     |  2 +
 documentation/overview-manual/index.rst      |  2 +
 documentation/profile-manual/index.rst       |  2 +
 documentation/ref-manual/index.rst           |  2 +
 documentation/sdk-manual/index.rst           |  2 +
 documentation/security-manual/index.rst      |  2 +
 documentation/security-reference/index.rst   |  2 +
 documentation/test-manual/index.rst          |  2 +
 documentation/toaster-manual/index.rst       |  2 +
 15 files changed, 81 insertions(+)
 create mode 100644 documentation/conventions.rst

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 4adec9714f2f..6c0e56d9660c 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -502,4 +502,6 @@ information including the website, wiki pages, and user manuals:
    section in the Yocto Project Reference Manual provides a
    comprehensive list of all related links and other user documentation.
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/bsp-manual/index.rst b/documentation/bsp-manual/index.rst
index 37469184e269..4229730080da 100644
--- a/documentation/bsp-manual/index.rst
+++ b/documentation/bsp-manual/index.rst
@@ -12,4 +12,6 @@ Yocto Project Board Support Package (BSP) Manual
 
    bsp
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
index b374cc1c43ec..39104259785b 100644
--- a/documentation/contributor-guide/index.rst
+++ b/documentation/contributor-guide/index.rst
@@ -23,4 +23,6 @@ this.
    recipe-style-guide
    submit-changes
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/conventions.rst b/documentation/conventions.rst
new file mode 100644
index 000000000000..ab020113d046
--- /dev/null
+++ b/documentation/conventions.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=================================
+Conventions used in this document
+=================================
+
+Placeholders
+============
+
+Text enclosed in angle brackets is a placeholder. Replace it, including the
+brackets, with a value of your own:
+
+.. code-block:: none
+
+   SRCREV:pn-<recipe> = "${AUTOREV}"
+
+Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
+never text to be copied as it stands, and an example containing one will
+not work until every placeholder in it has been replaced.
+
+Commands and prompts
+====================
+
+Commands are shown with the prompt that runs them, and the prompt is not
+part of the command. Do not type it.
+
+A ``$`` introduces a command you run as your normal user:
+
+.. code-block:: console
+
+   $ bitbake core-image-minimal
+
+Where a command needs administrative privileges on your build host, it is
+shown with ``sudo`` rather than with a root prompt:
+
+.. code-block:: console
+
+   $ sudo apt install gawk
+
+A full prompt ending in ``#`` introduces a command run as ``root``, usually
+on a target machine rather than on your build host:
+
+.. code-block:: console
+
+   root@qemux86-64:~# gdb /bin/cat
+
+Within an example, a line beginning with ``#`` is a comment rather than a
+command:
+
+.. code-block:: console
+
+   # This is a comment, not a command to run as root.
+   $ bitbake core-image-minimal
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 0e1aa89586d6..2a405b418f0c 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -52,4 +52,6 @@ Yocto Project Development Tasks Manual
    sstate-mirrors-setup
    hashequivserver
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/kernel-dev/index.rst b/documentation/kernel-dev/index.rst
index bd20e371e0c2..8a0e104dc4f9 100644
--- a/documentation/kernel-dev/index.rst
+++ b/documentation/kernel-dev/index.rst
@@ -17,4 +17,6 @@ Yocto Project Linux Kernel Development Manual
    maint-appx
    faq
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index e53215c73b6e..1a7058949b03 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -42,4 +42,6 @@ to move to one release of the Yocto Project from the previous one.
    migration-1.4
    migration-1.3
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/overview-manual/index.rst b/documentation/overview-manual/index.rst
index 0061d1a1807d..3b8aa28f0353 100644
--- a/documentation/overview-manual/index.rst
+++ b/documentation/overview-manual/index.rst
@@ -70,4 +70,6 @@ For a comprehensive list of links and other documentation, see the
 Documentation <resources-links-and-related-documentation>`"
 section in the Yocto Project Reference Manual.
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/profile-manual/index.rst b/documentation/profile-manual/index.rst
index 0270932ca0b1..53a87d7bf0bd 100644
--- a/documentation/profile-manual/index.rst
+++ b/documentation/profile-manual/index.rst
@@ -15,4 +15,6 @@ Yocto Project Profiling and Tracing Manual
    usage
    examples
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index aa1a63e0500b..6b44bb461a80 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -28,4 +28,6 @@ Yocto Project Reference Manual
    faq
    resources
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index a5c35cabaed1..d893ec8ed402 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -18,4 +18,6 @@ Yocto Project Application Development and Software Development Kits (SDK/eSDK) M
    appendix-customizing
    appendix-customizing-standard
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
index ab1ef445c86c..39ad0ee7a8c1 100644
--- a/documentation/security-manual/index.rst
+++ b/documentation/security-manual/index.rst
@@ -17,5 +17,7 @@ Yocto Project Security Manual
    read-only-rootfs
    sstate-signing
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
 
diff --git a/documentation/security-reference/index.rst b/documentation/security-reference/index.rst
index c20a54d1a931..f9b0f0d73777 100644
--- a/documentation/security-reference/index.rst
+++ b/documentation/security-reference/index.rst
@@ -11,4 +11,6 @@ Yocto Project Security Reference
    security-team
    reporting-vulnerabilities
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index d365d337ea5b..8f7f9e49a2cc 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -18,4 +18,6 @@ Yocto Project Test Environment Manual
    reproducible-builds
    yocto-project-compatible
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
diff --git a/documentation/toaster-manual/index.rst b/documentation/toaster-manual/index.rst
index 3ff4c6913aa4..ca2c38834bbc 100644
--- a/documentation/toaster-manual/index.rst
+++ b/documentation/toaster-manual/index.rst
@@ -15,4 +15,6 @@ Toaster User Manual
    setup-and-use
    reference
 
+.. include:: /conventions.rst
+
 .. include:: /boilerplate.rst
-- 
2.50.0.173.g8b6f19ccfc3a


