Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F592C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:40:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.183.1664815243258017335
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bTMTqBdw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EA5C0E0005;
	Mon,  3 Oct 2022 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664815241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mo9HenD4BU84KploaFO9XCkrNgTn+1pp0KuxrDGBWa8=;
	b=bTMTqBdww7myuGapFm7TmIxzeL0ATsENntTaL4iunMeVAQ2N7alruM1YjAxoPSuSMJwWbx
	LtR9sEPFssOBBgOXNWFuI6lA0qnr50Y3cdn51zxlCl8jtnZAzP/BJY+w1LtAvPHITolwFn
	fUWurcL3jkvS7IM7r0zinqV0Std44VVsUtJvoKDd4D069HVBUWSLglu5WjuSQcNTdGks61
	9Yod6Q5Q4O0H4PTcC5ASZDF8Bu7t7hyc8JOGDtWjqS1d0+RbZJ2A5iUHnTvi1OnGyhT54u
	OiuaeXyI0hP2On49Sf9km4PCkB/vWNCJ0NYjIjOwIl5eb6+z5NvbMw2JNuORUw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] [kirkstone] poky.yaml.in: update version requirements
Date: Mon,  3 Oct 2022 18:40:31 +0200
Message-Id: <20221003164031.263464-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3263

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to meta/classes/sanity.bbclass in Poky

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 1 +
 documentation/poky.yaml.in                   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index a982eae207..cef91c6476 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -64,6 +64,7 @@ following requirements:
    -  tar &MIN_TAR_VERSION; or greater
    -  Python &MIN_PYTHON_VERSION; or greater.
    -  gcc &MIN_GCC_VERSION; or greater.
+   -  GNU make &MIN_MAKE_VERSION; or greater
 
 If your build host does not meet any of these three listed version
 requirements, you can take steps to prepare the system so that you
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 1e1d6c83ed..6b942f0959 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -44,4 +44,5 @@ PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.6.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
-MIN_GCC_VERSION : "5.0"
+MIN_GCC_VERSION : "7.5"
+MIN_MAKE_VERSION : "4.0"
-- 
2.34.1


