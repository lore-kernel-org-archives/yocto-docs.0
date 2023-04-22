Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B039C77B7C
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:06 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1289.1682133603625021069
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 603DAE6A43;
	Fri, 21 Apr 2023 23:20:02 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 8D83CE73BA;
	Fri, 21 Apr 2023 23:20:01 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 01/17] ref-manual: add new SDK_ZIP_OPTIONS variable
Date: Sat, 22 Apr 2023 15:19:37 +1200
Message-Id: <f023eedcfcf7afb8fa0a404e534f9f860fd2d5da.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3852

Newly added for 4.2.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 62f28bd278c..c5cbda8aa81 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7318,6 +7318,11 @@ system and gives an overview of their function and=
 contents.
       :term:`DISTRO_VERSION` and
       :term:`METADATA_REVISION` variables.
=20
+   :term:`SDK_ZIP_OPTIONS`
+      Specifies extra options to pass to the ``zip`` command when zippin=
g the SDK
+      (i.e. when :term:`SDK_ARCHIVE_TYPE` is set to "zip"). The default =
value is
+      "-y".
+
    :term:`SDKEXTPATH`
       The default installation directory for the Extensible SDK. By
       default, this directory is based on the :term:`DISTRO`
--=20
2.34.1


