Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E92CAC5A8
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:11:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.52978.1758550281110976549
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q3khdp0L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04CC74E40D01;
	Mon, 22 Sep 2025 14:11:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE7B660634;
	Mon, 22 Sep 2025 14:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81AF7102F1954;
	Mon, 22 Sep 2025 16:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758550278; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZnHDbHlQP+2Trv2qzKjDNIq6+2aLC4jmC3RSeydB/1U=;
	b=Q3khdp0LlRalgB4+AD8rmlHmBxltLrkQv9ixavUv+VIKVDQcYqcEyLHBuk7kZX4qikyVKe
	XuSuXiGPdzQkAO9td52aqb4E596u5w+0HG4CHgW9V/H0Pbo0Gt8Nn0etoZKgwVEaCFO1xY
	LV41OUctUZptQJGiWYK36WACOjLxm0qRDzke8NILe9FiY5fw04wx05XAchyUpomfLvB8CA
	/cMufx1rh/CRy0aYjrK5WW0W6haB9RJVkWCFPho48KcwpUH4Jiieop+G7BnDjSx5nmgGEF
	fgPT/TO3/BLgUIE5cBtW+kMXg4WJre1X0ZNrnUCm7hUyEMgDNwbve9mE69RUTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 16:11:08 +0200
Message-Id: <DCZE1KGZEHV7.37QOM8E99CAEB@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] docs: add util-linux-script package for Fedora
 42+
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250922065859.157251-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250922065859.157251-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7572

On Mon Sep 22, 2025 at 8:58 AM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Fedora 42 split the script utility from util-linux into a separate
> util-linux-script package. This change adds conditional installation
> of util-linux-script for Fedora 42 and later versions.
> https://src.fedoraproject.org/rpms/util-linux/c/5a2471d6e5b0055cb607b30dc=
2e9613b312ffb74?branch=3Drawhide
>

Hi Adrian,

I just realized that Fedora 42 is not (yet) part of the supported distribut=
ions,
see https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/poky=
.conf#n33.

So it does not really make sense to make this appear here for now. However =
I'll
keep this patch handy once we add support for it.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


