Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10617C77B60
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:40:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.131952.1680705655446224440
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 07:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aDKydo1m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F015340009;
	Wed,  5 Apr 2023 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680705653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b3itV/iRowBG86AQyBWa0DCmuWTLFu1cD+55Gsu9/Rw=;
	b=aDKydo1moSZh6MoXK+psMXUWiuonbYHjvw8z2p+xad8lZ8uRu6kMNKr1Ykae2DaFB4gtzj
	/d2ygh5LdTzVH+Mb+RX34WZ8ELDW/xrPDJddkD9Ms7mQWDKuNOzq9dOy9ytp1xXsVy/7eA
	QKBGrECdqZ3Ko1bQuIhRWPNudjw70fQMXUojuGwbI8SypS2kU9danu/GyQVyQlj+1i3Jdm
	yEsPxY8BpxSfPdyGhMbD+0qE75pUukwYl/zige7a0ONnaRoPC0kmIsMHNmA+RdGt2Ui5J8
	5EL3wZTqqAINuCEgBK9G0OlheZPnCDAI36xP553ceLdHdcQ3BXy9ZtxBEIHRbA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [mickledore] manuals: improve and fix target for supported distros
Date: Wed,  5 Apr 2023 16:40:49 +0200
Message-Id: <20230405144049.213630-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Apr 2023 14:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3826

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Fix the location of the target for supported distributions
- Improve the name of this target

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst               | 2 +-
 documentation/dev-manual/wic.rst                 | 2 +-
 documentation/ref-manual/system-requirements.rst | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 498734a04d..27fc0fcd01 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -302,7 +302,7 @@ Project Build Host:
    as these releases are frequently tested against the Yocto Project and
    officially supported. For a list of the distributions under
    validation and their status, see the ":ref:`Supported Linux
-   Distributions <detailed-supported-distros>`"
+   Distributions <system-requirements-supported-distros>`"
    section in the Yocto Project Reference Manual and the wiki page at
    :yocto_wiki:`Distribution Support </Distribution_Support>`.
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index a8d2f46955..2a4408cdb0 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -72,7 +72,7 @@ In order to use the Wic utility with the OpenEmbedded Build system, your
 system needs to meet the following requirements:
 
 -  The Linux distribution on your development host must support the
-   Yocto Project. See the ":ref:`detailed-supported-distros`"
+   Yocto Project. See the ":ref:`system-requirements-supported-distros`"
    section in the Yocto Project Reference Manual for the list of
    distributions that support the Yocto Project.
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 4fe0cb841b..fd4a8afb5d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -29,8 +29,6 @@ and conceptual information in the :doc:`/overview-manual/index`.
    For more information about the Yocto Project Documentation set, see
    the :ref:`ref-manual/resources:links and related documentation` section.
 
-.. _detailed-supported-distros:
-
 Minimum Free Disk Space
 =======================
 
@@ -50,6 +48,8 @@ You will manage to build an image such as ``core-image-sato`` for the
 system with 4 CPU cores, but your builds will be much faster on a system with
 as much RAM and as many CPU cores as possible.
 
+.. _system-requirements-supported-distros:
+
 Supported Linux Distributions
 =============================
 
-- 
2.34.1


