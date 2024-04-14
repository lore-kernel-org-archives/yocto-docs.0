Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FACC05052
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.6116.1713127418340330413
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id B2FC416AEB;
	Sun, 14 Apr 2024 16:43:37 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 5D27B16A7B;
	Sun, 14 Apr 2024 16:43:37 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/9] variables: add TARGET_DBGSRC_DIR
Date: Sun, 14 Apr 2024 13:43:13 -0700
Message-Id: <ce941ec4a09ec422af2c26d0ac3fc0fe6cf19e3e.1713127068.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5139

New variable in 5.0.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 0dc881ed51..897bd44990 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8813,6 +8813,10 @@ system and gives an overview of their function and=
 contents.
       value so that executables built using the SDK also have the flags
       applied.
=20
+   :term:`TARGET_DBGSRC_DIR`
+      Specifies the target path to debug source files. The default is
+      ``/usr/src/debug/${PN}/${PV}``.
+
    :term:`TARGET_FPU`
       Specifies the method for handling FPU code. For FPU-less targets,
       which include most ARM CPUs, the variable must be set to "soft". I=
f
--=20
2.25.1


