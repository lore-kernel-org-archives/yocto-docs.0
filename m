Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74DDCED639
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10716.1728459693600984488
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X1gjiKNr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22A871BF204;
	Wed,  9 Oct 2024 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkwjmV1JSPY/ND9/W+D4SKsyxqHIRMAA3qj19W7zZkA=;
	b=X1gjiKNrGM2lwQxe7y+NR5tQujAMz+Z+6wqobXWe5GbRzQg7DfXE+u7Lv2ZQrkUkjdb0qV
	tA/bApnCK2M2w0+qzEXqmDIXHbDAUC5H5wz1FxjH96uOGQS+4Q1VAc+06sHJMGWYaH78GY
	sEP6lUGQ8rl+Qo4HiuYvBVgGt5+ZOSIt45EDsf2xPLlEzPVK7o+dDRIyBH32PRQdDowrKx
	pCvXXPdnVutlln9wqJIpgBlee2RpAsr0sOXRjg/PoJVusb42m58QkR7l90FBYBGh4bUup3
	2JJsxbX0u+LnVbidtLb/tzfRDfu/1ZbArxKGeyGS5ya8SDsysBbs9XiZkZdmng==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 02/16] ref-manual: add new vex class
Date: Wed,  9 Oct 2024 09:41:00 +0200
Message-ID: <20241009074120.866786-3-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5409

From: Antonin Godard <antonin.godard@bootlin.com>

Add a brief description on the new vex.bbclass that is used to generate
metadata needed by external tools to check for vulnerabilities.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9520d0bf7..46d77d0e5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3489,6 +3489,31 @@ This class is enabled by default because it is inherited by the
 The :ref:`ref-classes-vala` class supports recipes that need to build software written
 using the Vala programming language.
 
+.. _ref-classes-vex:
+
+``vex``
+========
+
+The :ref:`ref-classes-vex` class is used to generate metadata needed by external
+tools to check for vulnerabilities, for example CVEs. It can be used as a
+replacement for :ref:`ref-classes-cve-check`.
+
+In order to use this class, inherit the class in the ``local.conf`` file and it
+will add the ``generate_vex`` task for every recipe::
+
+   INHERIT += "vex"
+
+If an image is built it will generate a report in :term:`DEPLOY_DIR_IMAGE` for
+all the packages used, it will also generate a file for all recipes used in the
+build.
+
+Variables use the ``CVE_CHECK`` prefix to keep compatibility with the
+:ref:`ref-classes-cve-check` class.
+
+Example usage::
+
+   bitbake -c generate_vex openssl
+
 .. _ref-classes-waf:
 
 ``waf``
-- 
2.46.0


