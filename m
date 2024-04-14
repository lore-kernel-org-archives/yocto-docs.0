Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A8C41513
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.6115.1713127417876548060
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3A1B716AE9;
	Sun, 14 Apr 2024 16:43:37 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id DD37C16C48;
	Sun, 14 Apr 2024 16:43:36 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/9] classes: cve_check: add note about remote patches
Date: Sun, 14 Apr 2024 13:43:12 -0700
Message-Id: <362361c715e5f41b196c4b127af04d45c1d743ca.1713127068.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5138

Document the change in behaviour in 5.0.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 1f816e0457..916abf3abc 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -564,6 +564,13 @@ The ``Patched`` state of a CVE issue is detected fro=
m patch files with the forma
 ``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` =
and using
 CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patc=
h file.
=20
+.. note::
+
+   Commit message metadata (``CVE: CVE-ID`` in a patch header) will not =
be scanned
+   in any patches that are remote, i.e. that are anything other than loc=
al files
+   referenced via ``file://`` in SRC_URI. However, a ``CVE-ID`` in a rem=
ote patch
+   file name itself will be registered.
+
 If the recipe adds ``CVE-ID`` as flag of the :term:`CVE_STATUS` variable=
 with status
 mapped to ``Ignored``, then the CVE state is reported as ``Ignored``::
=20
--=20
2.25.1


