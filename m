Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0280AC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:22:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.15246.1712330539710709238
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pr7YLZC1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 351CFE0002;
	Fri,  5 Apr 2024 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712330538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yyR5uc5OcbT5pr5yoPQRmi1X14xrvinsUKQTm3/1aHc=;
	b=Pr7YLZC1CNuyzBTV12rOVw8vhCcGi+XBH2cWOP3M3+eDDhht9I1Zfk93WX6G/535ZZC3ta
	e0u+1GoVx7Kxpi1aOrZmvOekBe1kQLc7Gvv1fD7XtO+zg5mK0/6a7nqUzl65R/MXk05C8A
	MiOwICXeimjJ9aadCWkn1btC6rfoAM4vNBEra6ixk750tvnOtg0erVx47XYR4mn9+kMwyV
	os/HjhUj5ylu6fpUG/nNee/vwGEE8oMMSYMC+BEKZm3OssSMh3XQBQxG/5r9bSqI7LhIgM
	HlMTWR7F28HkQ3MUtNgJkKlNBhyei4GbKZuI4fZFIjd9fjg0o+q4F2TyUt4r6w==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/4] migration: add QEMU changes
Date: Fri,  5 Apr 2024 17:22:10 +0200
Message-ID: <20240405152211.2285650-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
References: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5085

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 10c5c16ed..b8e18aa7f 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -121,6 +121,10 @@ No classes have been removed in this release.
 QEMU changes
 ~~~~~~~~~~~~
 
+In ``tune-core2``, the cpu models ``n270`` and ``core2duo`` are no longer
+passed to QEMU, since its documentation recommends not using them with ``-cpu``
+option. Therefore, from now on, ``Nehalem`` model is used instead.
+
 .. _migration-5.0-misc-changes:
 
 Miscellaneous changes
-- 
2.43.0


