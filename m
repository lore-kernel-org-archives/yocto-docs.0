Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3200DC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:32:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4769.1790062363296586569
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 00:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Dwo7s/vE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F093C1A0FBF;
	Tue, 22 Sep 2026 07:32:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAFED606CA;
	Tue, 22 Sep 2026 07:32:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1747B10329213;
	Tue, 22 Sep 2026 09:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790062360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jkf8ccgKNMRpapYiu4oGpOuAyxJkfGodDICchzrdeDU=;
	b=Dwo7s/vEwYmDeBEEO9YIMZsKdrZ50rUP+Bp93eJfVCPnftFSit/t5YGYp5pZHRa2sV4tzq
	WkKB6HWLjXWfnhvep5/9L/cUC3FS6qGoZv6bz0+YWOy+XyPIWT3toUn5lmi1EwH6fXUQBN
	Qyznk0ExR2jqMnqrNe70VRMohOunk/D+Gu5U7rik2joT52/fKX2PLfgxItzAf2XjGNrKK5
	5f40Tde87f++5SoAqgzZ44B9DbuZAyN5RvSaCU/pNK1ALC8mrODFW1N7HoVdvIeOk/K2LB
	AYghM4jXAvL8sXJUNPwAVj6WYutFaWOJ8lFw184fu7DoA/Rq0GocL+/O4PpocQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 09:32:38 +0200
Message-Id: <DLLO5AQ7R6L7.1068CI3MBB0FC@bootlin.com>
Subject: Re: [docs] [PATCH] docs: document the conventions used in the
 manuals
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
 <aq4o7Zu-ILYDZnGw@localhost.localdomain>
 <DLL2HTQFFELI.15X26RE9UVCZF@bootlin.com>
 <arHbV_euXtr9_t0x@localhost.localdomain>
In-Reply-To: <arHbV_euXtr9_t0x@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 07:32:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10570

On Tue Sep 22, 2026 at 3:35 AM CEST, Trevor Woerner wrote:
> On Mon 2026-09-21 @ 04:34:35 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Sat Sep 19, 2026 at 8:17 AM CEST, Trevor Woerner wrote:
>> > On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
>> [...]
>> > having a
>> > prompt clearly shows what are commands to type and what is output. For
>> > the sake of uniformity I would rather not have code-block examples tha=
t
>> > have and others that don't have prompts.
>>=20
>> I agree.
>>=20
>> >
>> > As for the "what to copy" issue. Every code-block has a "copy" symbol
>> > that appears in the code-block when you hover over the code-block. If
>> > the code-block contains things to type with prompts and you click on t=
he
>> > copy icon of a code-block, the commands are copied and the prompts are
>> > not. However, if the user highlights what to copy by clicking and
>> > dragging with the mouse, they will get both the commands as well as th=
e
>> > prompts. However, that is configurable! It is possible to configure an=
y
>> > code-block identified as console to not copy the prompts, even when
>> > clicked-and-dragged with the mouse.
>>=20
>> Do you have a working solution for this?
>
> Yes (to follow).

Actually it seems to be already working for me. After building the docs, I
cannot select either "$" or "root@qemux86-64:~#" so things seem to be worki=
ng as
expected?

Antonin

