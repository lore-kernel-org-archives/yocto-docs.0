Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1386C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:55:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7644.1714632934989954042
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h5jWmkBu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 855D21BF20A;
	Thu,  2 May 2024 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714632933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dasZOx+G0VdEil6rWtpexjELQYVTAQkBT9HnZo+NhRk=;
	b=h5jWmkBujdjXCVmnUKNjk8HEJi1uX5kvdSfnAV9ATPes24Ctvcx3o4j94t2JhcxY+AiJOg
	i/aVN5mD1qw/v9cKMusMzT7aNY/1RvfKNQUZQiYKmbeNrQVoZLfTvtZk3/5ihX1hiECaMu
	lrJ7QkXxxi2HgUgOg2YT3Myq2nQdz94eMxgo54mplkySM1Oz+KQAapoQMTITxB28m0o8Bd
	p8UfxNVInNF4bzevUrdg/wU4s56LTmgNjbt4rS/9Fybyzk/N29Lfj60o9hrkUkwaap6kGm
	Xek1o1mOdK5xvAOf9AwoAE2iL/GV8qWze1KUCmB5wTuWKAHhwUZa06gA2rBD9A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [scarthgap][PATCH 4/5] release-notes-5.0: update Repositories / Downloads section
Date: Thu,  2 May 2024 08:55:27 +0200
Message-Id: <20240502065528.22559-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
References: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5190

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.0.rst    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 4bd9125d17..a47d181453 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -904,3 +904,58 @@ Thanks to the following people who contributed to this release:
 Repositories / Downloads for Yocto-5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0 </poky/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`fb91a49387cfb0c8d48303bb3354325ba2a05587 </poky/commit/?id=fb91a49387cfb0c8d48303bb3354325ba2a05587>`
+-  Release Artefact: poky-fb91a49387cfb0c8d48303bb3354325ba2a05587
+-  sha: 8a0dff4b677b9414ab814ed35d1880196123732ea16ab2fafa388bcc509b32ab
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/poky-fb91a49387cfb0c8d48303bb3354325ba2a05587.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/poky-fb91a49387cfb0c8d48303bb3354325ba2a05587.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0 </openembedded-core/log/?h=yocto-5.0>`
+-  Git Revision: :oe_git:`b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277 </openembedded-core/commit/?id=b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277>`
+-  Release Artefact: oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277
+-  sha: c7fd05d1a00c70acba2540e60dce01a1bdc4701ebff9a808784960240c69261d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0 </meta-mingw/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`acbba477893ef87388effc4679b7f40ee49fc852 </meta-mingw/commit/?id=acbba477893ef87388effc4679b7f40ee49fc852>`
+-  Release Artefact: meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852
+-  sha: 3b7c2f475dad5130bace652b150367f587d44b391218b1364a8bbc430b48c54c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0 </bitbake/log/?h=yocto-5.0>`
+-  Git Revision: :oe_git:`c86466d51e8ff14e57a734c1eec5bb651fdc73ef </bitbake/commit/?id=c86466d51e8ff14e57a734c1eec5bb651fdc73ef>`
+-  Release Artefact: bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef
+-  sha: 45c91294c1fa5a0044f1bb72a9bb69456bb458747114115af85c7664bf672d48
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0 </yocto-docs/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5 </yocto-docs/commit/?id=0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5>`
+
-- 
2.34.1


