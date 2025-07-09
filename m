Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1016FC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:58:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10264.1752047874923848304
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 00:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ABbz8GCC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65DA2443B8;
	Wed,  9 Jul 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752047872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Szvfby31uzeIjeqdqTU9nDjYxQBAWSFMFJf2RGG6NKg=;
	b=ABbz8GCCiAOYQR1QwCbj8/1O2UIs+BRwYarcKCViHeGCib5MdX5RtAYxBsvmqsDP+8y9so
	9DjO6uccMKVOsfjdNsoBHTc6klu4XGv3YNAMVJzJ1JSdAFzOKfB3UqWMyz/C3hpOGn8Upd
	xmL7E0VK9WLkFhmXP4xUg3Fz1hKbvL6ObbnYKNWCjJ5jz2zx/vnxdLGFrHuDLITn+xY0Du
	+Q+1agKV7S5mbcpmLlwq/6mdOkgcDtWVWO2oHgklUQSn85K7an69qJeMrOJmURXAg7NA4n
	Iu4AtcvWMtcERG2gHjCiubSxsMCn2COv7VBmxiJVH+RYq8ch0x1Q2RX5LATXZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 09:57:28 +0200
Subject: [PATCH 2/4] ref-manual/structure.rst: update with info on
 PERSISTENT_DIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-update-sstate-dir-docs-v1-2-9114688f33d1@bootlin.com>
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VTMlTEcJnnAvjFQWKStencHI8x7ng2X4rZSEVaGHCw4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobiD+cK/cRz0TQvCwXfQOgxCx3s6dhiqFV38IO
 g7I3KvFLAmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG4g/gAKCRDRgEFAKaOo
 NtudD/98IvHjQik6ikzmBOxFwxOQ+N+Bj0uqWvUgj/9hdiNHj1MGV17wEqAgTunj8yM0zJy3jan
 5XiTsTxmCWSvfnYDSejmni6UCOnNetzxaSsLj9+UkNO3wQVwGo9Hp41X7rB46beY09FnbyWMXXo
 Q7l/90i/fIbWS9Pkos9UCFh5BFy7yEl5lKzsZQ+TckFOU2B65gNBqdIdknYT2X33AQ7VBBHY0iL
 C3cqNUyF/r1SyvqjgHEYCwebjI+7JW4eHwhUKJ0trJqJSYCkxjuLLDj3Sqedd96yC2QMGXhLeS5
 EJIusO3+YszlbFNIcPkh3n977qQt1wsPSGNQFRE7Dh/TH6gOlTqW6qODLJE2LWqDz/MsJMdXhjj
 3oxWpyLnWK1yOXP5YBOgEv6aqxaFGr6JLy6+QC3m1JcQ04jGcTxsWnUVYLZCOZbqahaL7qB4Sxf
 JbYtmWIdkcKQRMjEPGb3ouOin4pDStPe0N4qnrV3JD3S9zsVrQ7qo6sI6rwjDgDbx253QdQZHKd
 O/Fci02DaY9iDA66Sf2o+NWmWskeckjHOc7zAG5LULo66gy5O6Kqf1A12CTj6QxrATCy90w/CVl
 DPmORBnbuXQOFotC2eOQX3EOyi7XT/XEQwXAwwBAvfIhj0kixmW6flhBiQjl53t+HaTw3Ogvqva
 p9R5gCQN9FIhAAA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 07:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7288

Since we mention that SSTATE_DIR can be shared for multiple builds, also
mention that PERSISTENT_DIR should be shared alongside SSTATE_DIR.

[YOCTO #15921]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index d6dbb2940..e4e800def 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -246,7 +246,8 @@ section in the Yocto Project Development Tasks Manual.
 ----------------
 
 This directory contains several internal files used by the OpenEmbedded
-build system.
+build system. The path to this directory is defined by the
+:term:`PERSISTENT_DIR` variable.
 
 It also contains ``sanity_info``, a text file keeping track of important
 build information such as the values of :term:`TMPDIR`, :term:`SSTATE_DIR`,
@@ -364,6 +365,13 @@ directory for multiple builds or move the directory to another location.
 You can control the location of this directory through the
 :term:`SSTATE_DIR` variable.
 
+.. note::
+
+   If you are sharing the :term:`SSTATE_DIR` directory for multiple builds and
+   you are using a :doc:`/overview-manual/concepts:Hash Equivalence` server with
+   :term:`BB_HASHSERVE` you should also share the :term:`PERSISTENT_DIR`
+   directory. See :ref:`structure-build-cache` below.
+
 .. _structure-build-tmp:
 
 ``build/tmp/``
@@ -403,6 +411,10 @@ modification time (mtime) changes and hashing of file contents. If no
 changes to the file are detected, then the parsed result stored in the
 cache is reused. If the file has changed, it is reparsed.
 
+This directory and the :term:`SSTATE_DIR` directory can be shared for multiple
+builds when using a :doc:`/overview-manual/concepts:Hash Equivalence` server
+with :term:`BB_HASHSERVE`.
+
 .. _structure-build-tmp-deploy:
 
 ``build/tmp/deploy/``

-- 
2.50.0


