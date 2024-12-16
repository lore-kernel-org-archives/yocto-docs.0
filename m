Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463F3E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:25:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.52343.1734337500831702332
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 00:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AQdKVhhN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C56C1E0004;
	Mon, 16 Dec 2024 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734337499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cJL+n/dTBKt5cXtBbxfmFcImEgZuqi9QOPjzRYrnICs=;
	b=AQdKVhhNAeaGa3nUJkwxV57oCgHmPvDNWPZ1GDj1pCNya8pZEoGyysXYZTAz5TJ89DU3Bn
	1ltyLzjuhN2ERKih3ygiNfyTI8tPdE9BU1X+MNpzxDKiUqcR/BvijCSvaxhIdJcveOHtWc
	GQh50lyaCw18UBmieicB5XeB+98QxOniHP2LXsJmkiXoIYWMeyyv2XYnbaft6SBnWjSRmG
	qY8wUApzjR1G8qZN4wQwp4oIfzaOH28LNrzI8c6xoGgpztiytAmZwyQixSGvyutn2t0IpC
	mswlfK2yq4+rwjYnmupyUnDV3+MdQh3FrdHRUjpwqbbO3JWD5EKQbOvRR9Xfqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 09:24:57 +0100
Message-Id: <D6CZBZDBTE6S.1AE65R923QRUQ@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Dec 2024 08:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5932

The following changes since commit 5b6e502c7640724471b791c521b7e976c03ad8e2=
:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 802677ea3ef7b6c1ed43c71f7f33489288c0735a:

  system-requirements: update list of supported distros (2024-12-16 09:18:5=
1 +0100)

----------------------------------------------------------------
Antonin Godard (3):
      Gather dependencies in poky.yaml.in
      poky.yaml.in: add missing locales dependency
      system-requirements: update list of supported distros

Gu=C3=A9na=C3=ABl Muller (1):
      ref-manual: use standardized method accross both ubuntu and debian fo=
r locale install

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 218 +++++++++++++++++++=
+---
 documentation/ref-manual/system-requirements.rst |  59 +++---
 3 files changed, 229 insertions(+), 50 deletions(-)

