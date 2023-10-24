Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33E4C25B6C
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.147735.1698154054381321148
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fSMXSjRK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1B3DFF812;
	Tue, 24 Oct 2023 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IjikDEUdLnAkmn11VDNMtUByTs/ybw6u+q4ADJYXfs=;
	b=fSMXSjRKrLSA+5qTjeWz+jqPTcKIsN/ZjyowS7eFREqyY+fvxyZ+CkvryVeceYFFd3Q1wD
	l9b2jxT0QTmpyfU/60CIjOe/rMrPGx5GHGSkgf7PqodekM9Rpi79u8EyFfUl5+XfqTjTGx
	n++Qx9/Co0Xamikwwn2jMJmYzBJWiKio5SLWYsNxtmXhSXAOZ06HLvHEVij6hBayLWUabj
	L+t3vzXdCZXsCZDqVgBeSVkYBDi32olUqhekBm8Uyh2hLguzOz0vAZ9pZJ6LVwZJ2Mo7gd
	2QpTIws0hcQcs2RNhz8oWwFipCE8uXVntLfKSv780ptSf6Sx15ENDyPDnXXSGg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [kirkstone][PATCH 15/16] ref-manual: variables: add TOOLCHAIN_OPTIONS variable
Date: Tue, 24 Oct 2023 15:27:11 +0200
Message-Id: <20231024132712.90600-16-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4490

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 517c35d032..87081d94b9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8508,6 +8508,16 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_OPTIONS`
+      This variable holds extra options passed to the compiler and the linker
+      for non ``-native`` recipes as they have to point to their custom
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      Native recipes don't need this variable to be set, as they are
+      built for the host machine with the native compiler.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.34.1


