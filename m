Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC041C05024
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.6117.1713127418828280586
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3BC53169FB;
	Sun, 14 Apr 2024 16:43:38 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id D7028169F9;
	Sun, 14 Apr 2024 16:43:37 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/9] dev-manual: update reference to sstate-cache-management script
Date: Sun, 14 Apr 2024 13:43:14 -0700
Message-Id: <53a89586234dee0f03b12e095321e8621cd17a26.1713127068.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5140

* Script is now .py
* In the example, we would most likely be within the build directory
  already, so the path would be just "sstate-cache" not
  "build/sstate-cache"

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/dev-manual/disk-space.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-=
manual/disk-space.rst
index 6d1638a302..efca82601d 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -49,7 +49,7 @@ requires a full build environment to be available and d=
oesn't work well
 covering multiple releases. It won't work either on limited environments
 such as BSD based NAS::
=20
-   sstate-cache-management.sh --remove-duplicated --cache-dir=3Dbuild/ss=
tate-cache
+   sstate-cache-management.py --remove-duplicated --cache-dir=3Dsstate-c=
ache
=20
 This command will ask you to confirm the deletions it identifies.
 Run ``sstate-cache-management.sh`` for more details about this script.
--=20
2.25.1


