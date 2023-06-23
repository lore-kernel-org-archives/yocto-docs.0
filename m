Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62F7EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 17:54:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5091.1687542863440180445
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jun 2023 10:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F/5EavEQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687542861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeBZa6DQN2seI+FdnmeBQqKtS9W/BB3H4KrML7L1WT0=;
	b=F/5EavEQvdL/5nF7pxY/yWJdRy4zPG0dXpesp+zdklGRA16cIsqbwdj1dkJ/FXZynQE7vl
	VAppT0ok+VhPCYl/7aZN3/GjDcSbBXRN15j41QO9XCF3l1u/CyudisACw1QONg9h/pNPhN
	vdN+UV0a1p/GWqELWylEWfQZn862eAN4s0YiA0j9NxJ2tBtRBFuIoqr2MP70/yvDkPwWgh
	pWV26TS6fN8zcT5wBlTpxTOd8qyIpVhah45GyUhP86AtfBYFCA1Yy0Sk/7J7Fkpbw4T0Kh
	Tw2lUIS0D4X0y4MDPgU1+SoXlLYQ7MytjlhFZz8YjNDPpsop0NliFLAdHQdN0w==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D003E0003;
	Fri, 23 Jun 2023 17:54:21 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v2] docs: sdk-manual: appendix-obtain: fix literal block content
Date: Fri, 23 Jun 2023 19:54:04 +0200
Message-Id: <20230623175404.1933627-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <176B16FDD157E15A.20970@lists.yoctoproject.org>
References: <176B16FDD157E15A.20970@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jun 2023 17:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4039

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Restore the error message as it is supposed to be issued.

The literal block renders its content verbatim so a term role (`:term:`)
would appear as :term: string in there and `---` as --- string instead
of the expected hyphen.

Fixes: e319b3bf4eb6 ("manuals: add missing references to SDKMACHINE and SDK_ARCH")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:
- Replace "---" by "-"
- Restore the variables names without any quotes as in the
  real error message.
- Add back "Unable to continue" which is also missing.
---
 documentation/sdk-manual/appendix-obtain.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index ba844507d3..f40ea6d4ab 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -140,9 +140,10 @@ build the SDK installer. Follow these steps:
       message similar to the following::
 
          The extensible SDK can currently only be built for the same
-         architecture as the machine being built on --- :term:`SDK_ARCH`
-         is set to ``i686`` (likely via setting :term:`SDKMACHINE`) which is
-         different from the architecture of the build machine (``x86_64``).
+         architecture as the machine being built on - SDK_ARCH
+         is set to i686 (likely via setting SDKMACHINE) which is
+         different from the architecture of the build machine (x86_64).
+         Unable to continue.
 
 
 #. *Build the SDK Installer:* To build the SDK installer for a standard
-- 
2.34.1


