Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4335C38A06
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4431.1665393877361250824
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Ya1vF7u3;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EBE5420ECCB6; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EBE5420ECCB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=F/p+ZB83hUS+KZ8yZQlu6TuIIS+GAwdr3aFzSYE4b1k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ya1vF7u3qnXgNR39ARnMd2FIb3722JHumNLYoFdqgQdA9WogmrhDbDDhMTun6Su1u
	 DZHWv60wZToKu4pIoWOl8gAwJWDZetbGyH34au30R4HUZS7rzAxFxJpxu/r1Nv4Jwp
	 HqGs81/vQSVrx/uGpfGSt4KtkXMUcOuIrp/wUBfA=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 24/34] ref-manual: complementary package installation
 recommends
Date: Mon, 10 Oct 2022 02:24:10 -0700
Message-Id: 
 <a24ea0995f7becbd823ab28d3b18388816d2c418.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3325

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a note to the COMPLEMENTARY_GLOB variable glossary entry mentioning
that recommends aren't installed (since this seems to be the only place
that complementary package installation is really discussed). Also turn
the paragraph about globbing into a regular paragraph as I don't think
it should be called out in a note block.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c2e75d0..ade7c03 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1213,12 +1213,10 @@ system and gives an overview of their function and contents.
       packages for all the packages explicitly (or implicitly) installed in
       an image.
 
-      .. note::
-
-         The :term:`COMPLEMENTARY_GLOB` variable uses Unix filename pattern matching
-         (`fnmatch <https://docs.python.org/3/library/fnmatch.html#module-fnmatch>`__),
-         which is similar to the Unix style pathname pattern expansion
-         (`glob <https://docs.python.org/3/library/glob.html>`__).
+      The :term:`COMPLEMENTARY_GLOB` variable uses Unix filename pattern matching
+      (`fnmatch <https://docs.python.org/3/library/fnmatch.html#module-fnmatch>`__),
+      which is similar to the Unix style pathname pattern expansion
+      (`glob <https://docs.python.org/3/library/glob.html>`__).
 
       The resulting list of complementary packages is associated with an
       item that can be added to
@@ -1233,6 +1231,11 @@ system and gives an overview of their function and contents.
 
          COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
 
+      .. note::
+
+         When installing complementary packages, recommends relationships
+         (set via :term:`RRECOMMENDS`) are always ignored.
+
    :term:`COMPONENTS_DIR`
       Stores sysroot components for each recipe. The OpenEmbedded build
       system uses :term:`COMPONENTS_DIR` when constructing recipe-specific
-- 
1.8.3.1


