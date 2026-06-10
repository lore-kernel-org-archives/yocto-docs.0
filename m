Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C6BCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:54:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19784.1781096054498168953
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 05:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SrX0xjK+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39F83C49F58
	for <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 12:54:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 504E25FFC9;
	Wed, 10 Jun 2026 12:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3BAF106B90C5;
	Wed, 10 Jun 2026 14:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781096052; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t0ExjBHWf21hFryqCy6lPwlygtElY3Ea7ywWBTwR7eo=;
	b=SrX0xjK+rGOWysFR38Bzm9HzZlDi1YcEBXv7D5cZhWmODF1JVcwDheZSCkqFSHRdNHoA0A
	0tctGsN1K6LKuZUXRxfoVS6fAxvrxA79AQKa2kmL8E5Wdt0VPXiQ36Kq48RAK2wFeJlsKY
	/sbb72Tg4NJpvznSUsYutirDeZk5uFgYv5sAi5Ha/tfsvmq/JKLsOTJ1uM64v7bThmUg4u
	jNxHisXqavaWMWvyp/0aUwXy0MyIOjqLxTQZ0XQoE2QJprb3mzBOnUXm6oFfN3pbxFd3Az
	DIHSsiLU1+jtX0gERw9D39FAd/WQ/kHQz8xmZiZwtArMZRO78mvZGvupSZe59g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 14:54:11 +0200
Message-Id: <DJ5DUUBC0P89.TN9DME41TLHV@bootlin.com>
Subject: Re: [docs] would anyone object to my updating "Adding a New
 Machine"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <f9054c50-f201-80c3-3338-3003a5748d06@crashcourse.ca>
In-Reply-To: <f9054c50-f201-80c3-3338-3003a5748d06@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 12:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9680

Hi,

On Tue Jun 9, 2026 at 7:19 PM CEST, Robert P. J. Day wrote:
>
> this section:
>
> https://docs.yoctoproject.org/dev-manual/new-machine.html
>
> is pretty out of date, using the "crownbay" as an example. any
> interest in me updating it to refer to something current, perhaps
> something rockchip like the orangepi-5-plus, which would show how a
> top-level machine definition file recursively includes more and more
> low-level files to fully define a machine?

I don't see how it is out-of-date, the important variables to set are still
valid.

>   or is there some other modern machine definition that would be
> a better example? or is it not worth the trouble?

This document does not seem to make use of an existing machine at the momen=
t,
and points to meta-yocto to find examples. I think it's fine as it is, unle=
ss
you think of other variables that should be part of the important ones.

Antonin

