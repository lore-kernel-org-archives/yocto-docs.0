Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7763C3527E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3388.1650591648758743263
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=Kae9DUTy;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DDABC20E6587; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DDABC20E6587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=lJgGnNr8ilcAAg0uBU5Nv8rg3rzmZFp9nkQxvHnSCDI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kae9DUTy13BlFzQPKr4mRNfBdQP1+kmwcRiaTrRgWzUrrTzATo9HjvH5LQWM05cx5
	 VRvCXXSRl9fI3CdVwuf5WubppiyMt0w8N6/i0XQd1pu173GvaiLkoVin8vxhPcZiZg
	 FYMvry4322y4Al+ckJQL/5/P2FUvYjFTjM8s6ZhY=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 7/9] ref-manual: add empty-dirs QA check and QA_EMPTY_DIRS*
Date: Thu, 21 Apr 2022 18:40:40 -0700
Message-Id: 
 <0fb99813b129f7239e08240d22397a50c53ed883.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2829

From: Paul Eggleton <paul.eggleton@microsoft.com>

This check is new in kirkstone.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   |  5 +++++
 documentation/ref-manual/qa-checks.rst | 10 +++++++++-
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 13cc2bb..a084ace 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1039,6 +1039,11 @@ Here are the tests you can list with the :term:`WA=
RN_QA` and
    cases, such as dynamically loaded modules, these symlinks
    are needed instead in the main package.
=20
+-  ``empty-dirs:`` Checks that packages are not installing files to
+   directories that are normally expected to be empty (such as ``/tmp``)
+   The list of directories that are checked is specified by the
+   :term:`QA_EMPTY_DIRS` variable.
+
 -  ``file-rdeps:`` Checks that file-level dependencies identified by
    the OpenEmbedded build system at packaging time are satisfied. For
    example, a shell script might start with the line ``#!/bin/bash``.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-m=
anual/qa-checks.rst
index 3364311..e881697 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -154,7 +154,15 @@ Errors and Warnings
    ``FILES:${PN}-dbg``. See :term:`FILES` for additional
    information on :term:`FILES`.
=20
-   =C2=A0
+.. _qa-check-empty-dirs:
+
+-  ``<packagename> installs files in <path>, but it is expected to be em=
pty [empty-dirs]``
+
+   The specified package is installing files into a directory that is
+   normally expected to be empty (such as ``/tmp``). These files may
+   be more appropriately installed to a different location, or
+   perhaps alternatively not installed at all.
+
 .. _qa-check-arch:
=20
 -  ``Architecture did not match (<file_arch>, expected <machine_arch>) i=
n <file> [arch]``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 4803578..47c8a8f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6084,6 +6084,21 @@ system and gives an overview of their function and=
 contents.
       In the previous example,
       the version of the dependency is :term:`PYTHON_PN`.
=20
+   :term:`QA_EMPTY_DIRS`
+      Specifies a list of directories that are expected to be empty when
+      packaging; if ``empty-dirs`` appears in :term:`ERROR_QA` or
+      :term:`WARN_QA` these will be checked and an error or warning
+      (respectively) will be produced.
+
+      The default :term:`QA_EMPTY_DIRS` value is set in
+      :ref:`classes/insane.bbclass <ref-classes-insane>`.
+
+   :term:`QA_EMPTY_DIRS_RECOMMENDATION`
+      Specifies a recommendation for a directory why it must be empty,
+      which will be included in the error message if a specific director=
y
+      is found to contain files. Must be overridden with the directory
+      path to match on.
+
    :term:`RANLIB`
       The minimal command and arguments to run ``ranlib``.
=20
--=20
1.8.3.1


