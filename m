Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8BAE7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150882.1734697027811072747
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=puRN8Dii;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D18D40013;
	Fri, 20 Dec 2024 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yk0g5fhrjBM/g9fiIMfL3tciLDr0gXxkpp00Sj6u2Pw=;
	b=puRN8DiiBqJpHiBOKbYAeTrhfwJfzi4UMaCOpcwP0P/ekHVQH8EqaxRQGd87mgYQQbkj4E
	jNeg7yTJurRI6bKefd8J9fzukW9omKEC0M8niozr4igjjZ1JGDoOE5GSN1hMKkZ2FehIdJ
	8rGLvsdwNZa0nosM+dPWAkQSG9cGhnTt8oS++7o9S/MbNodwu71Hd4wl/NJfZAY07MeFK2
	5Z5rlg9RrLuv8nLBNFYWN0MhlU2zxDCOtyCGKqs4wiNlIvfR0POd3H3TvP+kwbtdbcjqbV
	Hqr71Yv+6WPEAjtcyjAbyKdG4pHfJ9bVOJP7FQzhBVn7f/x/llixgN6lSqFadw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:38 +0100
Subject: [yocto-docs PATCH v2 11/14] ref-manual/classes: document the
 yocto-check-layer class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-11-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4c1MomSAIj46XEeJAyr+ZEyugkWEimD5LzcAZdV/4tw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA/EhYtL0MqWfdqCX91rnX74NyX4xNfFdkV2
 P0LgjukX5aJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPwAKCRDRgEFAKaOo
 Nk8yD/43j7WQmC52h2bnsYXLJAYqG5avC9fi4nM2YBWf/VsNsL5c8UmNQjjbZu61hTUH8kwodWR
 EZ4n6wnm3majd9U/FKgts2Lpifk8TKZgA9jeGMp372/gjUZPB0IU73l6gb+ndvYyGNPegRG5MI+
 vuvJz1e6XqcSmH7wp76wQJACzFO3Aq8MMOa3ZUSnzTwl8tDuW3vF8vOTU+Xfk2S0+BDs6/M6aIl
 QrF90R0w1DLtSV5S7GYF1ExonHUhDT0ekdU1S9rlFFfPWuhVo3OXATr14O6pXVYYMLmVb+/wKnU
 pUsK6C8M7lcLjL5Yj8dkhVH8F6YHCyiE08ou1a25YQaZ6jAikumi9SIVAGR14TkCFV+JfNLBwd8
 LUr3boiofRPy4j1jq+XjzjZzihupjI6EblTDrNJPc3vyb2TrU4Ow+9VkyzA4tNUc8M/LME52TPy
 mGBD1yKdremycxotZzrS7kv+5GlqK/db8IfWVkq5U+Z3V6270/fIZKHxY6S0RgYyfXy+LQuFvrk
 VrjWCdcwJ1qVT0iaT59xUUBIeKOOJgPZcB9mDebOzZldgs6m0fDgP18xD2JyaT1ROpmtKqB/JXz
 sInIabcV81MuCfsceusZH5rG6pMOJXTTSmonM8HKhaGL04OP4G0ej3ZZ67sW5FXd2NCeF5rlAaJ
 B59cQeQF3UysRSg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6009

This class is used by the yocto-check-layer script to check if a layer
complies to the Yocto Project Compatible status.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index af9aac928186f6a545d9899a24bd9e3dc80ef2e8..aee0d55c302a07decd0a223dfd1a7c68bcb0ef7e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3602,3 +3602,23 @@ the Waf build system. You can use the
 :term:`PACKAGECONFIG_CONFARGS` variables
 to specify additional configuration options to be passed on the Waf
 command line.
+
+.. _ref-classes-yocto-check-layer:
+
+``yocto-check-layer``
+=====================
+
+The :ref:`ref-classes-yocto-check-layer` class is used by the
+:oe_git:`yocto-check-layer </openembedded-core/tree/scripts/yocto-check-layer>`
+script to ensure that packages from Yocto Project Compatible layers don't skip
+required QA checks listed in :term:`CHECKLAYER_REQUIRED_TESTS` defined by the
+:ref:`ref-classes-insane` class.
+
+It adds an anonymous python function with extra processing to all recipes,
+and globally inheriting this class with :term:`INHERIT` is not advised. Instead
+the ``yocto-check-layer`` script should be used as it handles usage of this
+class.
+
+For more information on the Yocto Project
+Compatible layers, see the :ref:`dev-manual/layers:Making Sure Your Layer is
+Compatible With Yocto Project` section of the Yocto Project Development Manual.

-- 
2.47.1


