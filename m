Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16F1C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13750.1712327714966491368
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Th+UbR/x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71A0FC0019;
	Fri,  5 Apr 2024 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ckC/CzenIjA1Jd+Vh9/Ow59aPyoRsFMgQ0eoEEVulg=;
	b=Th+UbR/x6ZLW9u8BvEQIfEpPADTQSl71D78Ty/QoKcz0KmihIU3d8RpKV5j0yO8EccNBOX
	Hkg68iWvSy0FeyhmKa+Qt5lDEUOssQwtXqxE63uGMK0Wm/Odpjd7NnyESP3s6V51C+tT/6
	ksmrtfnRB5QT6NzO5YwLoOJPs0XNwtjsElPa9hhx/vn2NyT9YzZH9/xGAr4ZhthzBrbNbi
	ARI6QfOp4vAlvkF1NYrrs2tMqM5ipqMq6+essIVQOLPulQx8ibO6ZMa9qBW6fDi7Bn3U8W
	p19F9TCgbJ9UOEsqyjVWJ1M2OWsk/c4XFd+EVSjXTulx4TcZvw99AtlDlh0xog==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 6/6] migration: replace dashes by colons
Date: Fri,  5 Apr 2024 16:34:53 +0200
Message-ID: <20240405143453.2281900-7-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5081

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 301b7a3d2..888a1c60d 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -90,11 +90,11 @@ Removed variables
 The following variables have been removed:
 
 -  ``DEPLOY_DIR_TAR``.
--  ``PYTHON_PN`` - Python 2 has been removed, leaving Python 3 as the sole
+-  ``PYTHON_PN``: Python 2 has been removed, leaving Python 3 as the sole
    major version. Therefore, an abstraction to differentiate both versions is
    no longer needed.
 -  ``oldincludedir``.
--  ``USE_L10N`` - previously deprecated, and now removed.
+-  ``USE_L10N``: previously deprecated, and now removed.
 -  ``CVE_SOCKET_TIMEOUT``.
 
 .. _migration-5.0-removed-recipes:
-- 
2.43.0


