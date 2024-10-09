Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C44BCEDDBF
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19648.1728487496289467731
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mvRD5OAi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AE4324000F;
	Wed,  9 Oct 2024 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzZDcBbOc8uA1+ctPQYJV3DkwYrB76NvKOZvONqmZNY=;
	b=mvRD5OAikP+eS+kWjkEWIs8gkVqOlBgj42ArMqfud7aZ8aI39JMnkklvaUTtve8fJQ00Cd
	RDguDeN/0j0clVz4t2Qxilq/sM3r4qrr0JvMtnEj9y6uHwpITG5tQYGW5nITx32qd7qLXB
	+UoOLcuUNWbyuwjJXkhwlPIvsnDK4rMDVGWfKzuV+IHqan4b5q9F9lPaPJDcIBS0ytZdws
	gyGa5cpNmPkp93hr0ETSwi1SR9mRjr/ENfQ7nmXal/Q8qzWkQFifio71U7qsQRbegpoBZO
	s9chL+NDfI0IJoBVRkj7/nEy5tq5xUX0s4l7KvmXcC7dhmMi2JzMEVAYugPB8g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:13 +0200
Subject: [PATCH v2 05/16] ref-manual: add new RECIPE_UPGRADE_EXTRA_TASKS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-5-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=onH/v+hsIVCKnUBd0xTfi/wsD/CBWtL8Rm+M9vCtZ6U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBD29ZHj5Q72IbaPOaA7P8rDfm3cXHGCZgfm
 JCAqcUbijCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 Nl/pD/9w1kBOd80AM2LSUkcuRj3P4Kvj6qnPPEX9iCvOBorQC50qPy0gu6/iNauNpn9bCl2soPc
 F+9B1ZWBLJxVmMkWW71FmAicDs6IXZ3zu2j/J6CeYLR0aZIlwwnsct5TlO6XWmyZZL8P+Yuvdkg
 tvDrSfX7yW4hnIzgypJpZ+WlK9xDt256j6uK7gq0vrp/5KCBhHdId3fB9e/gohaUwFrBcPZjGo3
 eaG9zUQ1o0FjaJ6PiMUmpDjydsCdbA0YcDG5LcBFOfXl2NMb7wiE2x3tXkurJp1nALIs60ouixr
 HBUHB13yr4x7MMQQXTdZNlO7LZTmUTVje5qhXq4INH5JMk2m1k2IxTPVlNWHjkzePXePckn49H5
 cGnspf1P1gRP53I3gPYgfodTTI0bla8GX5L5/o+1kOBGXQH7SLPtvgGF+6TncXJWX9Xjmd7wuYA
 e4QX6OBRDrROIO3cI3Z12i5fHTrB16RYkIJJYTl6P+zqQZrvd0965ECt4xAYDk5fEaF7DrlKHAt
 qLBuMwSUABrilABeg9zXo7bajSSLnZGHib5H7pA1OBID6DYosTzLjvuJ91MLwVa4Zmqtk2mO70i
 BePQjljU+VtGuN6GCXp50P+pCYmOGq7cSvsfb1u8/89Pl7iTWf2oG3HpuvqdMOn8wDmHsa3qF3C
 OF0hIOZVkzQ6Ilg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5434

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1e37132ed..6af05c810 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7076,6 +7076,11 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
+      When upgrading a recipe with ``devtool upgrade``, the variable
+      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
+      tasks to run after the new sources have been unpacked.
+
    :term:`RECIPE_SYSROOT`
       This variable points to the directory that holds all files populated from
       recipes specified in :term:`DEPENDS`. As the name indicates,

-- 
2.46.0


