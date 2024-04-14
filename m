Return-Path: <vincent@coelebs.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0999C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:46:21 +0000 (UTC)
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.18])
 by mx.groups.io with SMTP id smtpd.web10.3973.1713120378776317585
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: coelebs.dev, ip: 185.233.34.18, mailfrom: vincent@coelebs.dev)
Received: from smtp.soverin.net (c04cst-smtp-sov01.int.sover.in [10.10.4.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4VHfQc1dpgz1T;
	Sun, 14 Apr 2024 18:46:16 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net (Postfix) with ESMTPSA id 4VHfQb6DGjz3L;
	Sun, 14 Apr 2024 18:46:15 +0000 (UTC)
From: vincent@coelebs.dev
To: docs@lists.yoctoproject.org
Cc: Vincent Kriek <vincent@coelebs.dev>
Subject: [PATCH] ref-manual: Add "devtool extract/sync" explanation
Date: Sun, 14 Apr 2024 20:48:05 +0200
Message-ID: <20240414184804.12111-2-vincent@coelebs.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:46:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5134

From: Vincent Kriek <vincent@coelebs.dev>

Documentation describing the devtool extract and devtool sync commands
were not present. This patch adds basic explanations how the commands
work and why you could use them.

Signed-off-by: Vincent Kriek <vincent@coelebs.dev>
---
 .../ref-manual/devtool-reference.rst          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentati=
on/ref-manual/devtool-reference.rst
index 9319addc3c..fbfd038e5c 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -618,3 +618,39 @@ a match.
=20
 When you use the ``devtool search`` command, you must supply a keyword.
 The command uses the keyword when searching for a match.
+
+.. _devtool-extract-source-of-recipe:
+
+Extract source of recipe
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Use the ``devtool extract`` command to extract the source of a recipe to=
 the
+directory specified. The extract command can extract the source of a rec=
ipe
+with patches applied to a directory on the system, not constrained to th=
e
+devtool workspace.
+
+To extract the source of a recipe use the this command::
+
+        $ devtool extract recipe /path/to/extract/location
+
+In contrary to the ``devtool modify`` command this extracted copy will h=
ave no
+impact on builds and can not be integrated back in to recipes by using d=
evtool.
+
+.. _devtool-sync-extracted-source-of-recipe:
+
+Sync extracted source of recipe
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+Use the ``devtool sync`` command to synchronize a previously extracted s=
ource
+tree of a recipe with the latest status of the recipe.
+
+To synchronize the extracted source tree of a recipe use this command::
+
+    $ devtool sync recipe /path/to/existing/extract/location
+
+.. note::
+
+   The synchronization of ``devtool sync`` could remove work you have in=
 your
+   checked out tree as it will set the new head of the devtool branch to=
 the
+   latest commit specified by the recipe. The previous devtool branch wi=
ll be
+   copied to the devtool.bak branch
--=20
2.44.0


