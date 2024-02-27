Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D3AC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:00:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9826.1709031608606608011
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 03:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tb7QtTjl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A1E4001B;
	Tue, 27 Feb 2024 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709031606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rWP/rwAFb+ePPpKBEcJ8FRPRO6KqRjFq8xMFN7k3H+Y=;
	b=Tb7QtTjll29/9CdtDVraYPCgPQBwQT6RMek2+RxTq4A2Z21yZRK65DVm8GH6Prwr0/0o81
	UGcygWdS4G+JgAbyU0zdyClKP22hhz1ypSFQa+Z+ZAgh49sEyeES1K4rFWcSTSArbBGXxA
	C7qQ19+TuJ5tIcHIZvRvbxnjWnR5kbwnu5PKaXwo46qrD2cZwL85tTYzQdi1Sol4AokGTn
	83tuAlcbS3b5J472Bw94+SXJnxj0nrVSnNL1t4izdMO+lDU6V9Hm5NcMzK8l1s90JURRcJ
	qoDL1WLGQPmrHtyZXqZBK/7chyUblxxZvPtqIUt03f8w2HaOYlMbs0SBIooWOQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/2] Discourage using do_cleansstate and do_cleanall
Date: Tue, 27 Feb 2024 11:59:51 +0100
Message-Id: <20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfA3WUC/x3MOwqAQAwA0atIagMS/F9FLKJGDcoqm0UE8e4ul
 q+YecDEqxi0yQNeLjU9XASlCYwru0VQp2igjPKMqMJxF3YY2DZDdwQxLMq6abjgYZpLiN3pZdb
 7f3b9+35mk+jTYwAAAA==
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 11:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4876

do_cleansstate and do_cleanall can generate build failures. Document this
and discourage using them.

Changed in v2:
 - improved the do_cleanall patch to show it applies also without a
   shared DL_DIR
 - add new patch for do_cleansstate

[v1] https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      ref-manual: tasks: do_cleanall: recommend using '-f fetch' instead
      ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a shared sstate

 documentation/ref-manual/tasks.rst | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)
---
base-commit: 6571eb02cbd5c2b96df0f279f25b63255ab7eac4
change-id: 20240227-clean-tasks-notes-56899a5abdf6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


