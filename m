Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D360C0018A
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50726.1699266592696320950
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 015452845C;
	Mon,  6 Nov 2023 05:29:52 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 2583A284D3;
	Mon,  6 Nov 2023 05:29:50 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 01/12] Remove references to apm in MACHINE_FEATURES
Date: Mon,  6 Nov 2023 23:29:31 +1300
Message-Id: <431a20c709c7575dcdb3bb1a56bb24097040a6b7.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4587

apm is no longer supported in nanbield.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/dev-manual/new-machine.rst | 2 +-
 documentation/ref-manual/features.rst    | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev=
-manual/new-machine.rst
index 930dd7eac7a..6b41d24db46 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -38,7 +38,7 @@ file or include from a lower-level configuration file a=
re as follows:
=20
 -  ``PREFERRED_PROVIDER_virtual/kernel``
=20
--  :term:`MACHINE_FEATURES` (e.g. "apm screen wifi")
+-  :term:`MACHINE_FEATURES` (e.g. "screen wifi")
=20
 You might also need these variables:
=20
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
index eb210bb7b20..dd14339bc21 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -52,8 +52,6 @@ Project metadata:
=20
 -  *alsa:* Hardware has ALSA audio drivers
=20
--  *apm:* Hardware uses APM (or APM emulation)
-
 -  *bluetooth:* Hardware has integrated BT
=20
 -  *efi:* Support for booting through EFI
--=20
2.34.1


