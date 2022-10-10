Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2B1C38A2C
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4267.1665393876825426983
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=OOF1XACG;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7F52920EC997; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7F52920EC997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=kU170k7f6fZoao0AzLsQlRUTIRueJ30Cq9XjsK56jR0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OOF1XACGiO5fdvYUFCdQl137UylifO1egCiip9AOPoFh+II1t6LjukKXzIsIm9Gg9
	 V0NjJ7ChbL4oVNVD1qisrOhEgTE7Xd5GmtsBspLlSbg9g3JRREIw4/qM7zVoPooAiW
	 plwKewdbndDcEkcIg2ippUbRbXkN9Pr610vMQ1O0=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 15/34] ref-manual: update pypi documentation for CVE_PRODUCT
 default in 4.1
Date: Mon, 10 Oct 2022 02:24:01 -0700
Message-Id: 
 <8a31713cfad225d022f1219f5a1a769387918405.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3318

From: Paul Eggleton <paul.eggleton@microsoft.com>

In 4.1 the pypi class has been updated to set a default CVE_PRODUCT
value.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   | 3 ++-
 documentation/ref-manual/variables.rst | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f6bbee5..3b5b4f2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2017,7 +2017,8 @@ By default it determines the PyPI package name based upon BPN (stripping the
 need to set it manually in the recipe by setting :term:`PYPI_PACKAGE`.
 
 Variables set by the ``pypi`` class include :term:`SRC_URI`, :term:`SECTION`,
-:term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, and :term:`UPSTREAM_CHECK_REGEX`.
+:term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`
+and :term:`CVE_PRODUCT`.
 
 .. _ref-classes-python_flit_core:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ceb6b0e..885641a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1516,7 +1516,9 @@ system and gives an overview of their function and contents.
       In a recipe, defines the name used to match the recipe name
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
-      The default is ${:term:`BPN`}. If it does not match the name in the NIST CVE
+      The default is ${:term:`BPN`} (except for recipes that inherit the
+      :ref:`pypi <ref-classes-pypi>` class where it is set based upon
+      :term:`PYPI_PACKAGE`). If it does not match the name in the NIST CVE
       database or matches with multiple entries in the database, the default
       value needs to be changed.
 
-- 
1.8.3.1


