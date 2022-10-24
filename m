Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC68C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:19:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.19723.1666621180112140776
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 07:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Miu+59UB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F050C24000F;
	Mon, 24 Oct 2022 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666621178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gJZFIAeCzzYt7B6X18l9g31A/7bbs/fDTmMXaOVDys=;
	b=Miu+59UBRls5Q+86XOll6dxEE6SnkkNBqAdCATIkQBg3oeU+odIXZbqAzOdmK0a8BMMPoV
	12WUGJFR3S6qeuZKUIz+cdRdswCERks9idfy2XJXxOM4qYLBCAckhGO4uYU5QY04TBQoPI
	cgS51wvZpUi7X+O3FAnvutmMA6qOlx2EDHJPYFRgvdM/IXUUpjZfdl+WSp2/0X2q6DWfxd
	NQ7oaOVwguyVUhUK7mrVAI/pGpEsPQoR/j7m0WCIzy3wf5W8sqiw0iRmTmIdWwhqmNm5lk
	ehEYPbVosuv+8I607fziAx69DYQqYPR65sa4G1QqLio9YsxZjV4U7XWUw9Ttiw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] ref-manual: add wic command bootloader ptable option
Date: Mon, 24 Oct 2022 16:19:26 +0200
Message-Id: <20221024141926.1458472-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <49baff87-9628-1ab7-eb4d-4bfa7bd30624@theobroma-systems.com>
References: <49baff87-9628-1ab7-eb4d-4bfa7bd30624@theobroma-systems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Oct 2022 14:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3395

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Reordering the bootloader command options alphabetically

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index d82da0ee75..48bba58995 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -211,15 +211,10 @@ supports the following options:
 .. note::
 
    Bootloader functionality and boot partitions are implemented by the
-   various
-   --source
-   plugins that implement bootloader functionality. The bootloader
+   various source plugins that implement bootloader functionality. The bootloader
    command essentially provides a means of modifying bootloader
    configuration.
 
--  ``--timeout``: Specifies the number of seconds before the
-   bootloader times out and boots the default option.
-
 -  ``--append``: Specifies kernel parameters. These parameters will be
    added to the syslinux :term:`APPEND` or ``grub`` kernel command line.
 
@@ -227,3 +222,13 @@ supports the following options:
    the bootloader. You can provide a full pathname for the file or a
    file located in the ``canned-wks`` folder. This option overrides
    all other bootloader options.
+
+-  ``--ptable``: Specifies the partition table format. Valid values are:
+
+   -  ``msdos``
+
+   -  ``gpt``
+
+-  ``--timeout``: Specifies the number of seconds before the
+   bootloader times out and boots the default option.
+
-- 
2.34.1


