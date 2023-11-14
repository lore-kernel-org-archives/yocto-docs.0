Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DA9C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:32:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13906.1699972371405216026
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 06:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hanigUXZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2297140009;
	Tue, 14 Nov 2023 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699972369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mx8ntgm4q6l74ZLaf4P0lVNBVT5HadM7i13K69I/kPg=;
	b=hanigUXZ1twU/b+og6a84gJWXH5H/+/cTKl1TjjlvHm3l3RAp2mRZ0JYiIYxvXkeOYlHLz
	9YrewmYHX+a7SepiKhQ/GatVELADdBAr1Z1IiJsSqpXLX7PqS1KSkTeHl+oepfJDrrYU3N
	IVL3UoLihydEw7TzmUauo718SMakxefpmWZQ6s+wsdW35u8dhuI9sEej1VfT6ngn76YoNH
	zRS4OwYHUrohbkDsEPyKOiSH99+ae6AEJ7QqaQxRkpyRx+RYCPte8ih4d2W9mcVt1UTWzK
	v5uVr2gMLE0fCxrIcoUz4Zz9p43oxyxy4GRFmjI50gYBzJpCXXAgZsFY2QBNJQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [nanbield][PATCH 2/2] release-notes-4.3: add Repositories / Downloads section
Date: Tue, 14 Nov 2023 15:32:38 +0100
Message-Id: <20231114143238.116960-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114143238.116960-1-michael.opdenacker@bootlin.com>
References: <20231114143238.116960-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 14:32:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4619

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Add Repositories/Downloads Section for 4.3 release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-notes-4.3.rst    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 3221372f98..85180dfc3c 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -903,3 +903,63 @@ Thanks to the following people who contributed to this release:
 -  Yuta Hayama
 -  Zang Ruochen
 -  Zhixiong Chi
+
+
+Repositories / Downloads for Yocto-4.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`nanbield </poky/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3 </poky/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`15b576c4101231d248fda7ae0824e1780e1a8901 </poky/commit/?id=15b576c4101231d248fda7ae0824e1780e1a8901>`
+-  Release Artefact: poky-15b576c4101231d248fda7ae0824e1780e1a8901
+-  sha: 6b0ef7914d15db057f3efdf091b169a7361c74aac0abcfa717ef55d1a0adf74c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/poky-15b576c4101231d248fda7ae0824e1780e1a8901.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/poky-15b576c4101231d248fda7ae0824e1780e1a8901.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`nanbield </openembedded-core/log/?h=nanbield>`
+-  Tag:  :oe_git:`yocto-4.3 </openembedded-core/log/?h=yocto-4.3>`
+-  Git Revision: :oe_git:`4c261f8cbdf0c7196a74daad041d04eb093015f3 </openembedded-core/commit/?id=4c261f8cbdf0c7196a74daad041d04eb093015f3>`
+-  Release Artefact: oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3
+-  sha: c9e6ac75d7848ce8844cb29c98659dd8f83b3de13b916124dff76abe034e6a5c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/oecore-4c261f8cbdf0c7196a74daad041d04eb093015f3.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`nanbield </meta-mingw/log/?h=nanbield>`
+-  Tag:  :yocto_git:`yocto-4.3 </meta-mingw/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`65ef95a74f6ae815f63f636ed53e140a26a014ce </meta-mingw/commit/?id=65ef95a74f6ae815f63f636ed53e140a26a014ce>`
+-  Release Artefact: meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce
+-  sha: fb2bf806941a00a1be6349c074379b63a76490bcf0f3b740d96d1aeeefa12286
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/meta-mingw-65ef95a74f6ae815f63f636ed53e140a26a014ce.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.6 </bitbake/log/?h=2.6>`
+-  Tag:  :oe_git:`yocto-4.3 </bitbake/log/?h=yocto-4.3>`
+-  Git Revision: :oe_git:`5419a8473d6d4cd1d01537de68ad8d72cf5be0b2 </bitbake/commit/?id=5419a8473d6d4cd1d01537de68ad8d72cf5be0b2>`
+-  Release Artefact: bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2
+-  sha: e5dab4b3345d91307860803e2ad73b2fcffa9d17dd3fde0e013ca0ebea0d05ca
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3/bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.3/bitbake-5419a8473d6d4cd1d01537de68ad8d72cf5be0b2.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`nanbield </yocto-docs/log/?h=nanbield>`
+-  Tag: :yocto_git:`yocto-4.3 </yocto-docs/log/?h=yocto-4.3>`
+-  Git Revision: :yocto_git:`ceb1812e63b9fac062f886c2a1dde23137c0e1ed </yocto-docs/commit/?id=ceb1812e63b9fac062f886c2a1dde23137c0e1ed>`
+
-- 
2.34.1


