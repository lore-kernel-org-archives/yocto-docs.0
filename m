Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F37C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:29:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.12299.1719505744198100555
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 09:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IKnSxv/D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2208EC0007;
	Thu, 27 Jun 2024 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719505742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ORgyEuANdCufyb5dSwbelU3Hhz6V3KldQa+L2MdbR2g=;
	b=IKnSxv/DjJY/Yoi0tIkSoL+PnLZ9OKKg0FFGpaVBPMHpYEx4ML6kXzGa8uQmA4z1H6v2nX
	AO3J1junwcvRde0o3rzCqFuBRNzJ52Vu9kDw2Dsn/rJ5ot1zLBoo9ClintOtXyIuNh0mC0
	yReipP1k0CuHpR+dRxINC2UjTo9im958uwK9zjVMQ9hluFVECDra4HeFGe0OaGRR2Jf07T
	FIZC/H0Hsq0AHYBTz2oNAnQquGAsE1XImMFVlgVK3KVEsCe8W59OnLHfikUb9LsIyHlg+k
	AKWT4h8YQpR4ByryECVj4TZkiR35Z9bawceOY56IUb7o5gW9rK1D2KCgN/WGVA==
Date: Thu, 27 Jun 2024 18:29:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <20240627162901d99c205c@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Jun 2024 16:29:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5309

Hello Richard,

The following changes since commit 875dfe69e93bf8fee3b8c07818a6ac059f228a13:

  docs: brief-yoctoprojectqs: explicit version dependency on websockets python module (2024-05-09 11:57:01 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/scarthgap-next

for you to fetch changes up to 09e321d7cbd5bd7071a0c138e6d0c424fb086269:

  migration-guides: add release notes for 5.0.2 (2024-06-27 18:22:27 +0200)

----------------------------------------------------------------
Lee Chee Yang (3):
      migration-notes: add release notes for 5.0.1
      migration-guides: add release notes for 4.0.19
      migration-guides: add release notes for 5.0.2

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   2 +
 .../migration-guides/release-notes-4.0.19.rst      | 159 +++++++++++++
 .../migration-guides/release-notes-5.0.1.rst       | 134 +++++++++++
 .../migration-guides/release-notes-5.0.2.rst       | 245 +++++++++++++++++++++
 5 files changed, 541 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.19.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.1.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.2.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

