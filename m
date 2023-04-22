Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B403C77B61
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1295.1682133615697812034
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 13E53E772A;
	Fri, 21 Apr 2023 23:20:15 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 43288E6A58;
	Fri, 21 Apr 2023 23:20:14 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 12/17] ref-manual: add SDK_ARCHIVE_TYPE
Date: Sat, 22 Apr 2023 15:19:48 +1200
Message-Id: <e1448222523ac465c898a20e595d1068c85b82a3.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3863

This appears to have been introduced back in 2019, but we missed
documenting it.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index f69cbbb14d8..86ffd8912dc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7053,6 +7053,14 @@ system and gives an overview of their function and=
 contents.
       The target architecture for the SDK. Typically, you do not directl=
y
       set this variable. Instead, use :term:`SDKMACHINE`.
=20
+   :term:`SDK_ARCHIVE_TYPE`
+      Specifies the type of archive to create for the SDK. Valid values:
+
+      - ``tar.xz`` (default)
+      - ``zip``
+
+      Only one archive type can be specified.
+
    :term:`SDK_BUILDINFO_FILE`
       When using the :ref:`ref-classes-image-buildinfo` class,
       specifies the file in the SDK to write the build information into.=
 The
--=20
2.34.1


