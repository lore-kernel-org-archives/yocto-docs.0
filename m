Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A674CD4F48
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 08:08:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3796.1779091684620326735
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 01:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1eomQDTx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BE324E429D9;
	Mon, 18 May 2026 08:08:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42349602B8;
	Mon, 18 May 2026 08:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 012BD11AF8F79;
	Mon, 18 May 2026 10:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779091681; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aj9CbKNJeNfm7eC7Vpt85WrAZO71nguvMB9Qxhtpgwk=;
	b=1eomQDTxoRdiItgmqG2VUoHti4hdYykJnABX/QPzlEIV3fzbl4dKypCf/NkzZ+nvZFwlfz
	6osJid4Nx2d/dM/zhevoHSeZaj3zZ9En7ULeJMKcig80ZmNQ8rTtOvEfX1TL6CmVE2a4ZA
	lwfxw9NhTiqijUh2xLf6aVgmppLuDYrT0S93Ar5D7uREfBZHzNxjqXxI95Lt2nQU+2++OS
	HJIVN7cOLZamxQLNYrrwwt3r7g1hWJkZ41ECA5j4VksqHkV+BEqm+tjA8KUkgJca1bsNse
	whHv9chWeA94Jt8sZVj/t6tIClLWYrcbz7nmV6hOaKaWR1uJ1ZPoCJCNra+Jnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 10:08:00 +0200
Message-Id: <DILND6ZEZIYI.2MEZO3WT04QIU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] What I Wish I'd KNown: Various pedantic cleanups
References: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
In-Reply-To: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 May 2026 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9476

Hi,

Is this a v2 of
https://lore.kernel.org/r/78481dfe-2916-0f38-7994-dd50fd4ee21c@crashcourse.=
ca?

If so, next time, can you explicitly say it so it's easier to follow and ap=
ply
patches?

Thanks,
Antonin

