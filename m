Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E53C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 07:37:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63935.1782977848189670450
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 00:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gwVOw3py;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53FBEC4FED1
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 07:37:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D5825FF03;
	Thu,  2 Jul 2026 07:37:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB811104C960E;
	Thu,  2 Jul 2026 09:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782977844; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=clWpYwtPUiBQGUYtVe9FY0Pgs/HWaMXmM0zB60byb68=;
	b=gwVOw3py7W5WP612u2RMLDJHb55rkH/CsMnsPHmgcCrPtw0IA7GBnYech2pSOe+FrFREqw
	gEjfAwMVJcV8gsRoO6KMce1JBzDB6u9yrJbqipkpoZRu3Qmvvl+Amk59BYohEYzdl8MJCF
	iVU9zO6aB74O7GMqQem0xQ6+v2d7lURJFzpXsTK82OLwyyE0DGj5+vZsYxn2EFL2LAlOX5
	hPMx3qPdQeNpdh4532nhwq++8pm5WV3o7AOKvr0q7D1DHN++uCGiipsTP1JZZifSugmvOQ
	lAu4VjtyGC6t+SD7ISYzEJZSHbQm9pCKUWeqHhipyoyUShQsLUlzSNrzLG2Rkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 09:37:21 +0200
Message-Id: <DJNWW8OYSBHM.O3F4TCBX4XW1@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
 <DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com>
In-Reply-To: <DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 07:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9995

Hi,


On Thu Jun 25, 2026 at 10:23 AM CEST, Antonin Godard wrote:
> Hi,
>
> On Tue Jun 23, 2026 at 7:43 PM CEST, Robert P. J. Day wrote:
>>
>> Add two new entries for the meta/conf/{fragments,templates}
>> directories to the structure of OE-Core metadata.

Will you follow-up on this patch?

Antonin

