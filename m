Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731CAC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:07:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.9427.1666800458243554950
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 09:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aBKFf3eL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98BD020015;
	Wed, 26 Oct 2022 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666800456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0MguFUQFx5HdA4ANj+3bE8CeXWkQ27YHyL3Ydu/Yhw=;
	b=aBKFf3eLIXTYftGsiKoV/27qZOyTSnd+udRClndUmvyyvS8jBop9ZfwvSqm8wqyHIV+B02
	mCybO1hLsBIRup4AHvXbXQnUjBLs0hjeh87Tz8RoUO7oC/d3+BD3qpWpNb5G4muwUe0mZT
	mZHlxOwh4QVY4WBK/dmf64B4AACWzX02fIOFcCL4xK8T/9rb4fcbaoE/BX1x1E7aSRRVPb
	BiyxZ1nxeoS4O6dzcBCCyAvHwkZWiTfIBATHA6boiYMLUA2shDAtwod4s69KVZ8y7d8Tt9
	81dzGJdGx8Dtb75xvtkYuyPSrxCnwAv/TB6N5unDRyUKbKBttIGh9cUju4RS1Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: rybczynska@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 3/4] dev-manual: common-tasks.rst: add regular updates and CVE scans to security best practices
Date: Wed, 26 Oct 2022 18:07:12 +0200
Message-Id: <20221026160713.2068570-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 16:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3419

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Regular security scans and updates to fix issues and updates from
upstream maintainers are best practices.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 53e7686633..d435bc8a4c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6231,6 +6231,13 @@ more secure:
    vulnerabilities discovered in the future. This consideration
    especially applies when your device is network-enabled.
 
+-  Regularly scan and apply fixes for CVE security issues affecting
+   all software components in the product, see ":ref:`dev-manual/common-tasks:checking for vulnerabilities`".
+
+-  Regularly update your version of Poky and OE-Core from their upstream
+   developers, e.g. to apply updates and security fixes from stable
+   and LTS branches.
+
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
    ":ref:`dev-manual/common-tasks:considerations specific to the openembedded build system`"
-- 
2.34.1


