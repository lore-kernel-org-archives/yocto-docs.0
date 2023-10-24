Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FDEC25B6F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.147725.1698154050227511892
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DKcPX7E6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 798546001B;
	Tue, 24 Oct 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww2LqsIc/dq5vWIF6hL+6iayTDF3zPvod7rPtCKUuNU=;
	b=DKcPX7E6vfbx8Js8VWeE1OGnk/W4ew4prF3LQOyVr2jGPClkaAs8Z/bwLaYabUHlb2Sa8s
	5ZHe/bN/wKU8Fp4u8tMkv0g2pykAEBpOAONQMsuDFt0mgkHlAoynK5Oihli9weTmjdlIxi
	OgYm2LOU5yTmPr8Kq6ki0Z15oUsvc/hnaoX/xIOn1WAzzeIbKJ2BDoGhiA+5StYnDVHoe+
	5LMz3ebump331ijCZYTuagYjKgyXqN7LNaU27HtnuJZViHUJBluoxXi5fhQwviWuDW+E5z
	wr3TeC2EVpt1rEIX1EkvyAaZjik/uLCclC790i6TrP/Nb9Q3/eT8K2GdPlsbVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <bluelightning@bluelightning.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 07/16] dev/ref-manual: Document INIT_MANAGER
Date: Tue, 24 Oct 2023 15:27:03 +0200
Message-Id: <20231024132712.90600-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4482

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Eggleton <bluelightning@bluelightning.org>

The INIT_MANAGER variable was added in 3.0 but it seems we didn't get
around to documenting it yet. I have added a variable glossary entry and
made the basic adjustment of the "Using systemd Exclusively" section in
the dev manual, however I think the latter section still needs work.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7d537bf878..0c573194e9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3701,6 +3701,21 @@ system and gives an overview of their function and contents.
          even if the toolchain's binaries are strippable, there are other files
          needed for the build that are not strippable.
 
+   :term:`INIT_MANAGER`
+      Specifies the system init manager to use. Available options are:
+
+      -  ``sysvinit`` - System V init (default for poky)
+      -  ``systemd`` - systemd
+      -  ``mdev-busybox`` - mdev provided by busybox
+      -  ``none`` - no init manager
+
+      More concretely, this is used to include
+      ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the global
+      configuration. You can have a look at the ``conf/distro/include/init-manager-*.inc``
+      files for more information, and also the
+      ":ref:`dev-manual/init-manager:selecting an initialization manager`"
+      section in the Yocto Project Development Tasks Manual.
+
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
       Indicates the deploy directory used by ``do_bundle_initramfs`` where the
       :term:`INITRAMFS_IMAGE` will be fetched from.
-- 
2.34.1


