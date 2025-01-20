Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A7DC0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:39:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.32900.1737362370238787597
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 00:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oeG0zMFr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22118C0007;
	Mon, 20 Jan 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737362368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G6GwY4XUh9v1+0KuU9VYoSWfA0RD7MOMfxn2Zug8uuc=;
	b=oeG0zMFrUrlixLdYHeCLR0Qt4B9a2BJ0mtqV8c9aBf9qGsRHjZO61QbeJ7NqPnCd1FGv9V
	X2GzL2IQfmc/VnNdj+SSljg2y8EzF/lNmivK2/dmu2Jwvi0Di4Aq6q9hhScChjxMYbJRyS
	qAHt8FjpK4hvqdZ9OSUGsHq/yP/dU26+XsV83kUtqMN2hWGCDy3QSFpoVtqk5cKc1HmYuN
	7JcB+xSp9ABqZKQeVyt0UVoPyyAtcm2UCNpsYkQpZB9qKYXlnV7g/iNf2TjErURmGkLPTZ
	avKdzMoEUttnor4Ot9Fz/9rCP7i4tjRSoB80yr5hh/+qyIal040EI8wd+Ocn7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 09:39:27 +0100
Message-Id: <D76RK54SW9CQ.1022ZW9P8LYZY@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 08:39:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6151

The following changes since commit 3128bf149f40928e6c2a3e264590a0c6c9778c6a=
:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:51:29 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to d574e625b2bb1b07a2e51cbf2e1f0a28ee596c7b:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:34=
:08 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      Update autobuilder URLs to valkyrie
      test-manual/reproducible-builds: fix reproducible links

 documentation/poky.yaml.in                           | 1 -
 documentation/ref-manual/release-process.rst         | 2 +-
 documentation/test-manual/reproducible-builds.rst    | 8 ++------
 documentation/test-manual/test-process.rst           | 2 +-
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 5 files changed, 5 insertions(+), 10 deletions(-)

