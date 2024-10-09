Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7322ECED62A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10719.1728459695731230315
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pRPLP+g9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41CF81BF207;
	Wed,  9 Oct 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMddSRbrZAcDM7KIajbTI4wcxtzFie+1itLofafpnaE=;
	b=pRPLP+g9nEXMrHKItxyCTXJG9P+Sgt9UVQLMo67Uh80+NsDDzZgh0q86ne+dz2UG8b79gU
	dqWWIzZKx7PYivBUVpgvUpigonRraMCaeVWFutM0X56QXQ/50hz7KcvSzMEZ8cTAKfgTjv
	mA6zKXc4B0oBwJnIJsBNFUE/Uy3l3glWTGcqZLfpSquluCnwunM07v5LCiNDU8Vm2ddeRQ
	OqN47vHOIHxMMQpjgAtU5ZttTgsK7xmsTiNBiJiti7N5F3S7YGCgOXVjaXjcC9SHbmmkYa
	u3eXZSRJOZG6IoyQgbx6SCqDkUUI2OfB0rMT0a3UQ2VfGMw8gBRqv8FsZCbmMg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 10/16] ref-manual: drop TCLIBCAPPEND variable
Date: Wed,  9 Oct 2024 09:41:08 +0200
Message-ID: <20241009074120.866786-11-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5417

From: Antonin Godard <antonin.godard@bootlin.com>

No longer required as TMPDIR can be shared for multiple lib providers
nowadays.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5744eeb9e..8907572e6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9031,19 +9031,6 @@ system and gives an overview of their function and contents.
 
       You can select "glibc", "musl", "newlib", or "baremetal".
 
-   :term:`TCLIBCAPPEND`
-      Specifies a suffix to be appended onto the :term:`TMPDIR` value. The
-      suffix identifies the ``libc`` variant for building. When you are
-      building for multiple variants with the same :term:`Build Directory`,
-      this mechanism ensures that output for different ``libc`` variants is
-      kept separate to avoid potential conflicts.
-
-      In the ``defaultsetup.conf`` file, the default value of
-      :term:`TCLIBCAPPEND` is "-${TCLIBC}". However, distros such as poky,
-      which normally only support one ``libc`` variant, set
-      :term:`TCLIBCAPPEND` to "" in their distro configuration file resulting
-      in no suffix being applied.
-
    :term:`TCMODE`
       Specifies the toolchain selector. :term:`TCMODE` controls the
       characteristics of the generated packages and images by telling the
-- 
2.46.0


