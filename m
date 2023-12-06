Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E5C10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:54:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.35290.1701878072509787740
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L5mknUIj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD6FFE000B;
	Wed,  6 Dec 2023 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701878069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pJZAzb0s9wMG/quGb4GkY63JuEfnv9yNCJ98R9vd460=;
	b=L5mknUIjkRqeUWclWUedDepvTXMyTZrdqr2XoXP3RGD9zV5JLrPonOs8zBnJGXGoqiOO74
	3rDgZCAwkdcSisuhoW79TQ0FgBnGFUf0GN9ObyJGlzyyyW+ym6HktrEBzXG1gC1lPU86nn
	An4CsdTKjI4au9nTcD8jFQIGbMwpRGiSRSIffmVH4x6ERNNli0QpTR7PneRSGWGO0ZdKA+
	ypY4atZwlezon/a7y67IglcOVt2/gK5q8rCBejM1fmR8Qvvd6Q7psvn4j9/nOUgoyhOflB
	uGMcTTHZzAsKE/C0pEtDIYGLjhErLrRVJ+WZ78hNFFPqfTyKAC9//jERW0ZyFA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/6] test-manual: misc updates and improvements
Date: Wed,  6 Dec 2023 16:54:21 +0100
Message-Id: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4656

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This series proposes a number of updates to the
Test Environment Manual, after reading it for
the needs of the "Binary Distribution" project.

Michael Opdenacker (6):
  test-manual: text and formatting fixes
  test-manual: resource updates
  test-manual: use working example
  test-manual: add links to python unittest
  test-manual: explicit or fix file paths
  test-manual: add or improve hyperlinks

 documentation/test-manual/intro.rst           | 112 +++++++++---------
 documentation/test-manual/test-process.rst    |  44 ++++---
 .../test-manual/understand-autobuilder.rst    |  62 +++++-----
 3 files changed, 109 insertions(+), 109 deletions(-)

-- 
2.34.1


