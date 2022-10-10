Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16404C47086
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4252.1665393876771167138
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=a/RwInGn;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 374E920EC32F; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 374E920EC32F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=ChZ2PHj/+ZXGMl/vJ/QToE5AjhAlIoPCRy9cmWYFa1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a/RwInGnntyfq29ROHWuBAp6TqMyw4ZuJuOU6tzP3rnTLNIgqx1G6tc2U5n4Hp636
	 9qO6YvpLl9WvmaaXvw1EwHqYfPZf7kCw5CoW/oRpddKwFgl2UHMcFPML4HyBJZFCmH
	 XTCuqNzA1iJ82LBexM88hU/Lsfh6I3yH0FHp3LoU=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 09/34] ref-manual: update buildpaths QA check documentation
Date: Mon, 10 Oct 2022 02:23:55 -0700
Message-Id: 
 <e4822c18c8d79a319a6b96571e1d9a6f150900bf.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3309

From: Paul Eggleton <paul.eggleton@microsoft.com>

The buildpaths QA check is now practically usable and enabled by
default, so update the comment and add a section with the warning
message since users may start seeing it in their builds.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   |  4 ++--
 documentation/ref-manual/qa-checks.rst | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6c60d41..d94db03 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1008,8 +1008,8 @@ Here are the tests you can list with the :term:`WARN_QA` and
    software, like bootloaders, might need to bypass this check.
 
 -  ``buildpaths:`` Checks for paths to locations on the build host
-   inside the output files. Currently, this test triggers too many false
-   positives and thus is not normally enabled.
+   inside the output files. Not only can these leak information about
+   the build environment, they also hinder binary reproducibility.
 
 -  ``build-deps:`` Determines if a build-time dependency that is
    specified through :term:`DEPENDS`, explicit
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 9455bec..fb31dc1 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -748,6 +748,22 @@ Errors and Warnings
     other things in the patches, those can be discarded.
 
 
+.. _qa-check-buildpaths:
+
+- ``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
+
+    This check ensures that build system paths (including :term:`TMPDIR`) do not
+    appear in output files, which not only leaks build system configuration into
+    the target, but also hinders binary reproducibility as the output will change
+    if the build system configuration changes.
+
+    Typically these paths will enter the output through some mechanism in the
+    configuration or compilation of the software being built by the recipe. To
+    resolve this issue you will need to determine how the detected path is
+    entering the output. Sometimes it may require adjusting scripts or code to
+    use a relative path rather than an absolute one, or to pick up the path from
+    runtime configuration or environment variables.
+
 
 Configuring and Disabling QA Checks
 ===================================
-- 
1.8.3.1


