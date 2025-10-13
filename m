Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5943FCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:15:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.37116.1760339726400024819
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 00:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G/GzIBR3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E66D4E41056
	for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:15:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA893606C6;
	Mon, 13 Oct 2025 07:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B685C102F2249;
	Mon, 13 Oct 2025 09:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760339724; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dXx7HxiDZiUhDraTTtrDsWep2cZPQ8Kb1ZpMeBfKdlc=;
	b=G/GzIBR39dHp4yrG4WLAHru4TIMvS37UGosPa2r8fEbJO5rV1A4w4IuezuBm5IhWEoJ6nF
	r4GNYd01Y+vgW9Edv2QW2jrT17BdMJDIcXyPlMHtZMqYteXn4by8eAa3hKh/JgNcDMZw3Q
	e3PtZIiFYPbbDEiKcOJ8QNMiUo9gmaWxJppPLJAejFa10705Rf3kHYZn70AzNG4jto//Lz
	TTQ0jKZQMD9CswNXqaLLFCnrC/N//HBNAYug+zquVmgiP2ieGfLKEWiEhNZpBPF9nfO8+o
	+EA4q28dokZUh/vq9ym3dc9PwHBshqgprBxpOr3FPEbWsbDLY2fYceue/DKT/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 09:15:21 +0200
Message-Id: <DDH0CO4RNC8X.BPLI3JN7AMHW@bootlin.com>
Subject: Re: [docs] [PATCH] vulnerabilities: update nvdcve file name
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <peter.marko@siemens.com>, "Quentin Schulz" <quentin.schulz@cherry.de>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20250824145316.1098911-1-peter.marko@siemens.com>
 <44868213-2ff2-44bf-89a6-48e1dc6d3b80@cherry.de>
 <AS1PR10MB569701155DB1D9EDD00A2C2BFD14A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <DCU6DNL4T7FE.WWFG4H593ZJH@bootlin.com> <AS1PR10MB5697A8FD8430D87D4D7EB560FDECA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697A8FD8430D87D4D7EB560FDECA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 07:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7689

On Sat Oct 11, 2025 at 11:37 PM CEST, Peter Marko via lists.yoctoproject.or=
g wrote:
>
>
>> -----Original Message-----
>> From: Antonin Godard <antonin.godard@bootlin.com>
>> Sent: Tuesday, September 16, 2025 13:07
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Quentin
>> Schulz <quentin.schulz@cherry.de>; docs@lists.yoctoproject.org
>> Subject: Re: [docs] [PATCH] vulnerabilities: update nvdcve file name
>>=20
>> On Tue Sep 16, 2025 at 12:39 PM CEST, Peter Marko via lists.yoctoproject=
.org
>> wrote:
>> > Hello,
>> >
>> > I just wanted to say that I'm back from vacation and will try to submi=
t patches
>> for LTS branches still this week.
>>=20
>> I backported this patch to walnascar, as part of the pull request from F=
riday
>> last week.
>>=20
>> I think you could send a separate patch for the new fetcher on scarthgap=
 if you
>> have the time.
>
> I have now sent patches for scarthgap and kirkstone.
> Sorry for the delay.
>
> Peter

Thanks, I applied these on the -next branches.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


