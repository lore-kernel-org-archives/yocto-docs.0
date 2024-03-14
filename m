Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122F2C54E6A
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.8390.1710407718763777668
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XS+6mFGs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EB1F1BF203;
	Thu, 14 Mar 2024 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DpFaRjoM5AOfjt5OjvqhsZqIZplvx+Xx/r4uP6We9E=;
	b=XS+6mFGsR/nEDx0Q5m5uyyDp7/vXe0xAnQU8HFCi6MlWsTffUr96q4N4r1tT7pVNne21x+
	SycLrth+uL7XFe+i04r7cuJRNeLM0X/pvv3vye/D7xljQZCLTV6frxmb18PlgpXWwsGxNW
	JgggzLfp63nXufrt8Qz5t7/RB+tprPQvNyvnVzF9wm9Q9B/dsBDnH3FuMmcZcyIWKVIeLP
	CUpnQsx6BL6dvACLoXRH5t70xV8w6AlMh56dtQxCOMK9trQlsEwld7x2JZPn6ZdapOpTcQ
	P//s8VnEbPwMm5DpfBSg/jFNUfnXI2ZiUpHVjx6OOXU4AxGEGVQ0Ii4xzI5vOA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [nanbield][PATCH 4/7] ref-manual: variables: adding multiple groups in GROUPADD_PARAM
Date: Thu, 14 Mar 2024 10:15:05 +0100
Message-Id: <20240314091508.84166-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4972

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add missing documentation on how to add multiple groups with a single
GROUPADD_PARAM:${PN}

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 448bea9938..ec879f9f86 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3234,6 +3234,14 @@ system and gives an overview of their function and contents.
 
          GROUPADD_PARAM:${PN} = "-r netdev"
 
+      More than one group can be added by separating each set of different
+      groups' parameters with a semicolon.
+
+      Here is an example adding multiple groups from the ``useradd-example.bb``
+      file in the ``meta-skeleton`` layer::
+
+         GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
+
       For information on the standard Linux shell command
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
-- 
2.34.1


