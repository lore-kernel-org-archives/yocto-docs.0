Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFCCC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:09 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50734.1699266608144144119
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 7723028905;
	Mon,  6 Nov 2023 05:30:07 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id D0E6D284FB;
	Mon,  6 Nov 2023 05:29:59 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 08/12] release-notes-4.3: move new classes to Rust section
Date: Mon,  6 Nov 2023 23:29:38 +1300
Message-Id: <7ecf441f78e65e32e2d9ab77ae9464daf263da0b.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4594

These are both Rust-related, let's move them the Rust section since they
are more notable there.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/release-notes-4.3.rst          | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index 6491504c9d2..dc689c30ada 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -95,13 +95,6 @@ New Features / Enhancements in 4.3
       through the ``init`` program. This enabled removing the
       ``SERIAL_CONSOLES_CHECK`` variable.
=20
--  New classes:
-
-   -  A ``ptest-cargo`` class was added to allow Cargo based recipes to =
easily add ptests
-
-   -  A :ref:`ref-classes-cargo_c` class was added to allow recipes to m=
ake Rust code
-      available to C and C++ programs.
-
 -  QEMU / ``runqemu`` enhancements:
=20
    -  QEMU has been upgraded to version 8.1
@@ -115,6 +108,12 @@ New Features / Enhancements in 4.3
=20
    -  Rust has been upgraded to version 1.70
=20
+   -  New ``ptest-cargo`` class was added to allow Cargo based recipes t=
o easily add ptests
+
+   -  New :ref:`ref-classes-cargo_c` class was added to allow recipes to=
 make Rust code
+      available to C and C++ programs. See
+      ``meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb`` =
for an example.
+
 -  Image-related enhancements:
=20
 -  wic Image Creator enhancements:
--=20
2.34.1


