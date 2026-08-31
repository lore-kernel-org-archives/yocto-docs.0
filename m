Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29EBC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:20:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25160.1788164427129350775
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 01:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ee+kTfCG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 681254E41464;
	Mon, 31 Aug 2026 08:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CC88601E1;
	Mon, 31 Aug 2026 08:20:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D8AC11C783B9;
	Mon, 31 Aug 2026 10:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788164424; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZwkccIjpbJosjihrKuASxsh3M+Q8WPrEw/UJWDLmQYk=;
	b=Ee+kTfCGZTdZ4MjnpTTqthwLA0SqIDM3iQdBb/OWVf6w68UnWevHyarc0K0GC5Nlf13M1E
	QwjPWocAGMlBeHAJc8L5q+mqc9unC6T83Qi7+vNCw7sx4lo0RjGkoRocS/Y4WHzfeijwNF
	FWuN4hfJUGVN2jYEfZZz5e9hEamzGcBwvxkFgvNVSdS0L1qVNhjn+B+DIckryHKqgy9jet
	Pe1nNs/eiP1lbKl/iFwAC/YXkCiv/eN8WT7kyEa2/xB7VBIxtGEV+8mb6ITOjNMS7GLCAR
	QdGCWqOB7ohTAXjzM4Dv93XibRV5zx0OU/e/9Cp1LwPWI5CkRXJpduEE/amPAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:20:24 +0200
Message-Id: <DL2ZDVVFILT9.195AJS5FZO23O@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs: document the conventions used in the
 manuals
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
In-Reply-To: <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 08:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10415

On Mon Aug 31, 2026 at 10:18 AM CEST, Antonin Godard wrote:
> Hi,
>
> On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoprojec=
t.org wrote:
>> The manuals use angle brackets for placeholders and a prompt to mark a
>> command, and say so nowhere. A reader can only infer both, and one
>> example reads as advice to paste a line that will not parse.
>>
>> Include the new section from every manual, the way the boilerplate is
>> included, so each is self-contained.
>
> We already have a standard.md document that explains these kind of things=
.

Sorry, s/standard.md/standards.md/.

Antonin

