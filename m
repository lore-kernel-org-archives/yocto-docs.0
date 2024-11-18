Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DDED43FF0
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:46:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.36792.1731919573774822206
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 00:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZkUWsEDn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C311CC0009;
	Mon, 18 Nov 2024 08:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731919572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qB0gyOviC5EtV79ACTuZnSUbeCGTsHRYAfJ1/s0+Was=;
	b=ZkUWsEDnfle0CPHcnklS54QgVWplgENrafUxE9uQEr/dQimL/cYflEPuqptcfa1zXv/65M
	URRHAX4+uM5C6fe+Iwz7K9JQ1Whc03w3cHr4MZLyoqD4CGZk1JOQgifT4gjb1Z9Sov7R+g
	tJlAGDNumMzh++cbjH1L3oQft61FfShDkvUP237eLNpX+uMtMpCR2vYsypr2mBb90T5yIf
	kvrjt/CmuGiaiph3xOQqp4c1Jt8Z3DfORELIofCAMrtXQA+2QSto8IzjShnMFhRzuF555Y
	VVGb3lvdCNldnFAskvJ+auBxkOnUxW8bQuoMbDZJGiRSsKUVUF009m7y0eJkYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 18 Nov 2024 09:46:05 +0100
Subject: [yocto-docs PATCH] ref-manual: classes: bin_package: fix SRC_URI
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMz+OmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0NT3bTMCt2kzDzdgsTk7ESgdGpqirmZsXFaUmpyihJQV0FRKlAJ2MT
 o2NpaAPLbxcBhAAAA
X-Change-ID: 20241115-fix-bin-package-eed7633fbecd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kM+KUemvuR/iUq0++tNisqzcd+KWutmzaKP11dMS4nM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnOv7THhYFF5zz46mYz4rEerf8E7saypqWO+tC+
 y+NXJqNr+SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzr+0wAKCRDRgEFAKaOo
 NuExD/92TcoDQmHWmq1jfAgNBttnNbAZQHkb/AxyJHb3JY1icex7eVXokNIVYXGs2w13M7idMkG
 Mx2BsoRtXfGF/uLpG8cw3Uyt/12ThwMvjxHF9eYUQ9NnCAQuA3CKnNP6qca2S/GJjxrjYmhtnsq
 ja/KDYT0uvjLZ8isxHV95RzbLRr6EBwkGMi3w03fVjQ6BHXpHYhHU6HoqijnQTk74iY7Dex0VXI
 GsZ4MuyRvPtx4/MEufcRmmvZNBrjzStsSpvHIBtHH+rhX/msG9vE0fvZb3J3NhltyMaMwXvqvj6
 Dods1zUbT6i9b0UVNlYOBsNdZu6za3mbCaPgFHu3jp1DI9yAgNo6BZgTIssMRVWllbzfnJDr87G
 uFXz4/PoZE5c49zWYCjvm4do57Nyi8JSxHTCQDzFLgtqhHAAoElelGOK2o7trfl4djcjkk2rqbm
 JNW1BtqISti+kdA9AUSxBek+Y5FyBPhFdFnbT8Ie3M3Y85VkPhufanc0xmF7vKwR5kCPzHyeiBK
 E9ASoBA85b1GLWQ+0ILEI9BMq3WQKejljnEhDiC35uear6JzI+M2UDw7Gone0yuDjRj7toh0O0G
 vsS64sdHB0uS15tq/G0NB2sdL6jVcAvLYas9Tu/ykfZItX83bsqbWkE11flzvk/zK2HuDo6uUhG
 SiSkIs4GxFn4JGQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 08:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5753

`subdir` is the correct attribute to use for extracting the package in
the correct directory.

From the bitbake doc:

  subdir: Places the file (or extracts its contents) into the specified
    subdirectory. This option is useful for unusual tarballs or other
    archives that do not have their files already in a subdirectory within
    the archive.
  subpath: Limits the checkout to a specific subpath of the tree when
    using the Git fetcher is used.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..2ac94630d80386cf613222b70f7bd6323b9948f2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -176,7 +176,7 @@ example use for this class.
    are extracted into the subdirectory expected by the default value of
    :term:`S`::
 
-      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
+      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subdir=${BP}"
 
    See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
    more information on supported BitBake Fetchers.

---
base-commit: 7d5eb0cee5b2b7096969819d7d7ce569a3c92f27
change-id: 20241115-fix-bin-package-eed7633fbecd

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


