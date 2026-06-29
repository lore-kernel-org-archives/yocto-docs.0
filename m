Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CB0C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:39:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34127.1782725983151268578
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 02:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YLBea3jT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE6B51A0CAD
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 09:39:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B441B5FF96;
	Mon, 29 Jun 2026 09:39:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B550106F0D64;
	Mon, 29 Jun 2026 11:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782725980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dw+SnJXvZpooTF2vGwzPORb136BQkXeokPR3kN3dnH0=;
	b=YLBea3jT+XbGXUfVZ19S6LGJJyYf0OUatTMRTdMD8CXUWcntZFHVzw3nVi0XnPU0HPZsyU
	g4narhAs1a9t/Poqhaaxlg99mWlVKAMiy/PINGbR2xA8T8Pv+t7jyym+piHz+5iQJ1EUxz
	p/A3WwR+j0y+VbkJfJTZRlT90CQGYK2TDTew+lmalAKKEoohcPt13iL9gdNdLGZm6BkbOF
	cQH/qz3nuhoauORuMZwqupDnB6xDqVFOMnSvJhYIlbQEoIdA/48Kp18SyTjzCWoGoJRq2c
	x/STXTaFRAewQ56ZfbUl+XY0azL56kqnt1gXNG1LxY1cGgJ7qD4ir5ainFSbmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:39:38 +0200
Message-Id: <DJLFM8MMDKNM.YEBARH11AGN@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] ref-manual: add intro content to Ref Manual
 "Tasks" section
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca>
 <DJLDC44CFJYL.1C6ACT3B4ATW6@bootlin.com>
 <592e8b31-4742-2935-5d4d-e5173b5efe14@crashcourse.ca>
In-Reply-To: <592e8b31-4742-2935-5d4d-e5173b5efe14@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 09:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9967

Hi,

On Mon Jun 29, 2026 at 10:42 AM CEST, Robert P. J. Day wrote:
[...]
>> > +   do_compile                            Compiles the source in the c=
ompilation directory
>> > +   .. etc etc ...
>>
>> Nitpick, but I think "..." is enough.
>
>   ok, i'll do that next time. or would you prefer that tweak?

There's another comment I made regarding run and log files. So you can twea=
k
this in the v2?

Antonin

