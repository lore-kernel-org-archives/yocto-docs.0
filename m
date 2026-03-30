Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF35FC97F3
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:42:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46633.1774860130964324542
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 01:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lH24sChO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC435C40406;
	Mon, 30 Mar 2026 08:42:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB68E5FFA8;
	Mon, 30 Mar 2026 08:42:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3F82104509E8;
	Mon, 30 Mar 2026 10:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774860128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qN+qqoiB4QHkqOE0NWDqJgTPi2CxNrfdFU9mpJFj2Ig=;
	b=lH24sChO1izLcF+gLcje+pSOJnMeCoTJYbS4XioaF4B9Cm6dYJlVt8rHa+iPrmpoVE/9NY
	w9ub3KRg+99hpEz5gDCH4v0npmnkYqxe28D/s+OBkqsB4/yrW1ax/C1D7zpJOrPWsvYt8L
	5Je1VevHrZbtp1NGJ+cZr6D92R9bHaDwdoPR2DOidjsMZdADMBIl+98E0VKs7jzk1Q3b5U
	k3V8QelHvSmV20NyQQvhzK86kC+NzZwXLkoPIwDteLJ3NiQ/Ya7N5HG0zHRwLC5ibmcnMg
	s2lFJsA4BnsQY7Au1w4xo3QQ2v76Ib7e5v6GNZXWqZvhJkNH3KSaH+TUnsbgUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 10:42:05 +0200
Message-Id: <DHFZELGU7TJJ.3GI4D06RNM2O9@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Mar 2026 08:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9142

The following changes since commit 60b1c5e635065acc7a7cd2a22f252fc983da223f=
:

  migration-guides: add release notes for 5.0.16 (2026-03-18 11:22:05 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to aa7226705451e6c1ef964d49963bbed29b267c27:

  ref-manual/system-requirements.rst: add CentOS Stream 9 to supported dist=
ros (2026-03-26 15:02:34 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/system-requirements.rst: add CentOS Stream 9 to supported =
distros

 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

