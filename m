Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562CDCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:14:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153868.1781615664765277178
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=24weIMMZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 218061A390A
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:14:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAA1C601A9;
	Tue, 16 Jun 2026 13:14:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F253106C9B04;
	Tue, 16 Jun 2026 15:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781615662; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BDoXDLlRBUciTFtgiLqVo5rXVGFxGryz0BjExy8gYK8=;
	b=24weIMMZNkGCrJvriLTKjNyr4U3tZ0F9iIXNe3Gufq+QY3Y+Yq05uRkdHFWROaySvyqm4P
	Id3GmP6mmJsH48H4buGGtW5cfYHiZU/jZmdoJfeMyBJqy9DW9oSjzH4S1HgJyweo5ifaH8
	9/rySlAPoeyU/3otJgOhkp8S5HNSSB1+CQSN6m98//ikXg51fPj4FbPv4ONP/QejmPcKSP
	dGPrYuqldO9vR9WesbnNEwA+mywq9pk1v+mV3lgi/k1C9S/eZd25JvW3AD6jhrh8gxJMQJ
	v1RqCKZKI0p6Yik6bmIo8t9F4xbI3ZWZKp9msgumdPT7GT+m28ZxuG2P0zS3dw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:14:22 +0200
Message-Id: <DJAI1K5XJBDD.3QTRALTBOKL1I@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] should the dev manual "libraries" sections explain
 "oe_libinstall"?
References: <3b08f39f-86c4-ce11-0761-8ef793c0fbdd@crashcourse.ca>
In-Reply-To: <3b08f39f-86c4-ce11-0761-8ef793c0fbdd@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:14:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9737

On Thu Jun 11, 2026 at 1:26 PM CEST, Robert P. J. Day wrote:
>
>   while the "Working with Pre-Built Libraries" section:
>
> https://docs.yoctoproject.org/dev-manual/prebuilt-libraries.html
>
> explains the "oe_soinstall" utility, i see nothing anywhere in the
> docs that explains the similar "oe_libinstall" utility, for which
> there are a few examples scattered around, such as mtd-utils:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/mtd/mtd-utils_2.3.1.bb
>
>   does this deserve a mention?

Yes please

Antonin

