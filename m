Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF44E65D31
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 07:56:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.19580.1732262177101491938
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 23:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CAwXmemY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BA20FF803;
	Fri, 22 Nov 2024 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732262174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F0EhnTj78jQVYUZ0uZCJl1E1ZSZwumFJdDcWsz4ReIA=;
	b=CAwXmemYd8n2FIifutam3MDKj7vbgQ6XXrBnRzZp9KnYSXLVOXHpFM1z4JuoaTKjcEo8k2
	YEVZRknG1mTFwpFcrLdSu0WuURc8o9ONrV5AJBNpCcU3BOADmLz1DQD7UD88c+90kxms5E
	5vSB8U3gRvr0cp0Bp1WXfnfNqD/fpnwzrw9CPOvpwVa6U9f+stFJEadQl780aQ3G520D4j
	ouonEvhRgmcwcSwegNQJwSO7BhctBWAbdOErqPUnAcoHkB0G13l57b6ftHs2+b9kLa9oYk
	ZBE2zla1mNkjmfFLEF/HiyugcG2BUiM3cme12V6cLGDZamVGbhSxjYKWHIQrLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Nov 2024 08:56:14 +0100
Message-Id: <D5SJOWSIV6V5.1UG9ERX6FX9AE@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Nov 2024 07:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5792

Hi Richard,

The following changes since commit 8288c8cae7fe7303e89d8ed286de91fc26ce6cc3=
:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:14:39 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to ff33f7c374c6079af4dc2609e9fb63d705598bc7:

  ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_TASKS=
 (2024-11-22 08:45:24 +0100)

----------------------------------------------------------------
Alexander Kanavin (1):
      ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_T=
ASKS

Antonin Godard (1):
      standards.md: add a section on admonitions

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.4

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.4.rst       | 212 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  11 +-
 documentation/standards.md                         |  15 ++
 4 files changed, 233 insertions(+), 6 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.4.rst

