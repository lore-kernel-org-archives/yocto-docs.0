Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCFFC6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 08:58:00 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.4204.1678784273851047127
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 01:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TJLRhXj0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C4FBE240002;
	Tue, 14 Mar 2023 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678784271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ChbE9JtqLzCQBs+B7gOpEIfSa9z2Qz4zA29fY6L4xXg=;
	b=TJLRhXj0eqOq82b09HYM/U0LFgvGgDdeMTK5Gk6l29ZiBAL/E0De00aHqKndUp63wLTwTL
	Wkn3ghQCWrSLh3uv7B27K+sVkIJozmt2Jk9Nrb5xlTbo8EO45mD1akXB5Q0fCFJg5dTXEN
	xHu9KwU8Fa45M1jGzbCoCJ3UNZitj98iNP3hBP0Xa3DG7ul7G5TyO/IyUsxoXMK/N8wVWV
	0Qam/7fUbJgbhm/c/O9lociYxWWPmgP4h0cnIpk2Ky9FUVgoYPv8vPoz8X2GJdhc12q3qC
	1yZfRt6pKZ/I5BTf+epit5IRr9WKKPWmQAD99NXmUrj2idHQfp5nkb/a7Wh51g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Documentation/README: add pygments package
Date: Tue, 14 Mar 2023 09:57:46 +0100
Message-Id: <20230314085746.75151-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Mar 2023 08:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3790

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To the packages required to build docs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/README b/documentation/README
index e8aed86eb4..117f4be409 100644
--- a/documentation/README
+++ b/documentation/README
@@ -118,12 +118,12 @@ and of its required dependencies is to use the Python Package Index (pip).
 
 To install all required packages run:
 
- $ pip3 install sphinx sphinx_rtd_theme pyyaml
+ $ pip3 install sphinx sphinx_rtd_theme pyyaml pygments
 
 To make sure you always have the latest versions of such packages, you
 should regularly run the same command with an added "--upgrade" option:
 
- $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
+ $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml pygments
 
 Also install the "inkscape" package from your distribution.
 Inkscape is need to convert SVG graphics to PNG (for EPUB
-- 
2.34.1


