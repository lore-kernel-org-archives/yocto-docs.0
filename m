Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD71DC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 18:08:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2601.1711822119502354597
 for <docs@lists.yoctoproject.org>;
 Sat, 30 Mar 2024 11:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MBLRippe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6BD6240002;
	Sat, 30 Mar 2024 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711822117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPzF12NBXTOFw16dD6V080JYuhpK0QvwSx4d8pLV65A=;
	b=MBLRippevPJ5EEfJXzhiYFj5pmxr5WXCENHDNqvtXGcLLhep+5MqtbAIN3sknWEdFaVxLe
	wpR8QUYK6+C98zgamQMO8AIo1Ep0VUBX4iTstqAVVt1al9QmyYQjOkaAp7gxZOEwVEuWym
	ZYnp5vvRbGJqugLiMP19wCkDqA07n5/v/bOnQ5eYkQuqpvJ5O1djmXGAPkSkXMR8NrEHaA
	33QNaRIeGpDt9dTHJnBOJ+TNiJX/pdn3S6Cb91OYxK1rC+FlnET+0pIM+lM4X+M0z3hvIX
	LdKMc5PqsTxZIviO9z0s9sbxLBZdWzRShu3WSPWjMeAU+XQ1TccniKaqX28hLA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/4] manuals: fix incorrect double backticks
Date: Sat, 30 Mar 2024 19:08:28 +0100
Message-Id: <20240330180829.1749526-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
References: <20240330180829.1749526-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 30 Mar 2024 18:08:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5037

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported by "make sphinx-lint"

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/layers.rst    | 2 +-
 documentation/profile-manual/usage.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 6e4f137e6b..91889bd0ae 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -732,7 +732,7 @@ The following list describes the available commands:
 
 -  ``save-build-conf``: Saves the currently active build configuration
    (``conf/local.conf``, ``conf/bblayers.conf``) as a template into a layer.
-   This template can later be used for setting up builds via :term:``TEMPLATECONF``.
+   This template can later be used for setting up builds via :term:`TEMPLATECONF`.
    For information about saving and using configuration templates, see
    ":ref:`dev-manual/custom-template-configuration-directory:creating a custom template configuration directory`".
 
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index d313f04ebb..17be149580 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1872,7 +1872,7 @@ Practically speaking, that means you need to do the following:
 
 -  Or build a non-SDK image but include the profiling tools
    (edit ``local.conf`` and add ``tools-profile`` to the end of
-   :term:``EXTRA_IMAGE_FEATURES`` variable)::
+   :term:`EXTRA_IMAGE_FEATURES` variable)::
 
       $ bitbake core-image-sato
 
-- 
2.34.1


