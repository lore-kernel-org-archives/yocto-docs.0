Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7419C54E58
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.12833.1709042501984933384
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Twx66CyC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DAB7C0006;
	Tue, 27 Feb 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEwLs4SaiFOh7tSb3t3AjHTeHvg26OB4lsjdr7G3LfE=;
	b=Twx66CyC7sm5XszJ315JJ5tHxM4QbUUkVE8rpRFoKqCbSxPrO5/S8wrx820haROZ3s2yvJ
	NEA9uv2Lzz40F66+bPGEDRiFkHKoZsIxmvFjT5WFu8DF2habWqEU9+mMctejLIj7TLPwcT
	UCtFLeaZGHtLFhuTc50szeHjFOiQCNaRQrE1cFdUuOy7JYkBvokk9h59utodjYu0ycNQ0S
	IC9KuJq1XJHmd1RkegVZDrnIMZgf5CBXjb6TdbRku6gYsm0ZqBXRT8y7dZ4MqRmFyXxYox
	bOdoP/2nBAkmmVUh3QukAK4VXG9dieSxmedwHQ3TP2IhArKGEqyjzaBNx91BFQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 10/16] ref-manual: system-requirements: modify anchor
Date: Tue, 27 Feb 2024 15:01:22 +0100
Message-Id: <20240227140128.481522-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4902

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To align with the "master" branch

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst               | 2 +-
 documentation/dev-manual/wic.rst                 | 2 +-
 documentation/ref-manual/system-requirements.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 834fb13088..7d3a25b1f9 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -289,7 +289,7 @@ Project Build Host:
    as these releases are frequently tested against the Yocto Project and
    officially supported. For a list of the distributions under
    validation and their status, see the ":ref:`Supported Linux
-   Distributions <detailed-supported-distros>`"
+   Distributions <system-requirements-supported-distros>`"
    section in the Yocto Project Reference Manual and the wiki page at
    :yocto_wiki:`Distribution Support </Distribution_Support>`.
 
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 25180c5cb5..f794693c50 100644
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
index 1a6f7647b6..159f16fb8d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -50,7 +50,7 @@ You will manage to build an image such as ``core-image-sato`` for the
 system with 4 CPU cores, but your builds will be much faster on a system with
 as much RAM and as many CPU cores as possible.
 
-.. _detailed-supported-distros:
+.. _system-requirements-supported-distros:
 
 Supported Linux Distributions
 =============================
-- 
2.34.1


