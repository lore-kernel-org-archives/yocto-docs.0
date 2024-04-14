Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8065C04FF9
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.6163.1713127416887502204
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 40D3E16AE6;
	Sun, 14 Apr 2024 16:43:36 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id E238C16C38;
	Sun, 14 Apr 2024 16:43:35 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/9] ref-manual: Add virtual-slash QA check
Date: Sun, 14 Apr 2024 13:43:10 -0700
Message-Id: <3671c8f7bd572b795bb5075bcdcdc4d808b85021.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5136

Add the new virtual-slash QA check to the insane class section and the
QA checks section.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   | 6 ++++++
 documentation/ref-manual/qa-checks.rst | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 1d01456ece..296347edb7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1582,6 +1582,12 @@ The tests you can list with the :term:`WARN_QA` an=
d
       This is only relevant when you are using runtime package managemen=
t
       on your target system.
=20
+-  ``virtual-slash:`` Checks to see if ``virtual/`` is being used in
+   :term:`RDEPENDS` or :term:`RPROVIDES`, which is not good practice -
+   ``virtual/`` is a convention intended for use in the build context
+   (i.e. :term:`PROVIDES` and :term:`DEPENDS`) rather than the runtime
+   context.
+
 -  ``xorg-driver-abi:`` Checks that all packages containing Xorg
    drivers have ABI dependencies. The ``xserver-xorg`` recipe provides
    driver ABI names. All drivers should depend on the ABI versions that
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-m=
anual/qa-checks.rst
index 58526a0e57..53b1836e74 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -799,6 +799,14 @@ Errors and Warnings
     section in the Yocto Project Development Tasks Manual. See also the
     ":ref:`ref-classes-ptest`" section.
=20
+.. _qa-check-virtual-slash:
+
+- ``<variable> is set to <value> but the substring 'virtual/' holds no m=
eaning in this context. It only works for build time dependencies, not ru=
ntime ones. It is suggested to use 'VIRTUAL-RUNTIME_' variables instead.`=
`
+
+    ``virtual/`` is a convention intended for use in the build context
+    (i.e. :term:`PROVIDES` and :term:`DEPENDS`) rather than the runtime
+    context (i.e. :term:`RPROVIDES` and :term:`RDEPENDS`). Use
+    :term:`VIRTUAL-RUNTIME` variables instead for the latter.
=20
=20
 Configuring and Disabling QA Checks
--=20
2.25.1


