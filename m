Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D449C77B7C
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1294.1682133614523430896
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id E23ACE7548;
	Fri, 21 Apr 2023 23:20:13 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 19077E7645;
	Fri, 21 Apr 2023 23:20:12 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 11/17] ref-manual: add section link also to buildtools-extended entry
Date: Sat, 22 Apr 2023 15:19:47 +1200
Message-Id: <52acd9c6e0ab1627aa3ab260678cd36a43e9b096.1682133339.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3862

I realise it's already in the buildtools entry above, but for
completeness let's add it to the buildtools-extended entry as well.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/terms.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index 5a7363acad3..92cc723ff6a 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -123,6 +123,10 @@ universal, the list includes them just in case:
       tools, such as a required version of the GCC compiler to run the
       OpenEmbedded build system.
=20
+      See the ":ref:`system-requirements-buildtools`" paragraph in the
+      Reference Manual for details about downloading or building an arch=
ive
+      of such tools.
+
    :term:`buildtools-make`
       A variant of :term:`buildtools`, just providing the required
       version of ``make`` to run the OpenEmbedded build system.
--=20
2.34.1


