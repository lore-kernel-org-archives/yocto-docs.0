Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBE3C7EE21
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1293.1682133607534704790
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id DF05AE75AA;
	Fri, 21 Apr 2023 23:20:06 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 4153EE6452;
	Fri, 21 Apr 2023 23:20:06 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 05/17] ref-manual: add BB_CACHEDIR
Date: Sat, 22 Apr 2023 15:19:41 +1200
Message-Id: <f5b3d321436c39001f6404fe51a1c8560d95b86a.1682133339.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3856

New in 4.2 (pointer to BitBake manual, changes sent separately for
that).

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 2ed69c0b214..2efb3f8db7b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -354,6 +354,9 @@ system and gives an overview of their function and co=
ntents.
    :term:`BB_BASEHASH_IGNORE_VARS`
       See :term:`bitbake:BB_BASEHASH_IGNORE_VARS` in the BitBake manual.
=20
+   :term:`BB_CACHEDIR`
+      See :term:`bitbake:BB_CACHEDIR` in the BitBake manual.
+
    :term:`BB_CHECK_SSL_CERTS`
       See :term:`bitbake:BB_CHECK_SSL_CERTS` in the BitBake manual.
=20
--=20
2.34.1


