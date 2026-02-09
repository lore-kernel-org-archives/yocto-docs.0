Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FDE78D40
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 08:32:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43317.1770625973663500972
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 00:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dIfNO2/W;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 879734E424A0
	for <docs@lists.yoctoproject.org>; Mon,  9 Feb 2026 08:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46DFE6074B;
	Mon,  9 Feb 2026 08:32:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F3C3119D0091;
	Mon,  9 Feb 2026 09:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770625970; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lgleC6BS1jHAOO58MZDWitP6wTxQmppq4FcgpAYrmq4=;
	b=dIfNO2/W7JHM0wxatgZwzuil5latkvog/CwyJ35hY3gbufzSuHOiKgFslD2GOsiC+qMfAI
	n7VhtBSNxOjpvSJCC6Z3yrzAwBvSD/Uef5Bq92FqSNeVbqk0IM+04aIyjXS3HckeSsgBfC
	3DPLZ3JEIDJNEiRAlj7w8sVmX93ve+mjCFiEJGk+NoZdED3zQFtFQCC/1MbA4UQSgQxrdh
	KnBYVuxbmxz0DoCZrCekaSMkDd6KLYM6L/BQt5HXDrgSUSauknFKkgozh4aTvYT5T3nkmL
	ayq8N8v6MIgCwhIIvbkDh2Te/DBGeASMOnRdNBHN+1+w1HKDq7GkW8h/hU29AQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 09:32:49 +0100
Message-Id: <DGAAISXQEM8B.1JQP7X9NMQ5HA@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] migration-guides: add release notes for
 5.3.1
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20260206094146.61584-1-chee.yang.lee@intel.com>
In-Reply-To: <20260206094146.61584-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Feb 2026 08:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8876

Hi,

On Fri Feb 6, 2026 at 10:41 AM CET, Lee Chee Yang via lists.yoctoproject.or=
g wrote:
[...]
> +Fixes in Yocto-5.3.1
> +~~~~~~~~~~~~~~~~~~~~
> +
> +bitbake
> +^^^^^^^
> +-  bin: Hide os.fork() deprecation warning in all bitbake scripts
> +-  bitbake-layers: Also hide os.fork() deprecation warning
> +
> +meta-yocto
> +^^^^^^^^^^
> +-  poky.conf: bump version for 5.3.1
> +
> +oecore
> +^^^^^^

Nit for next time: replace "oecore" by "openembedded-core", so it uses the =
same
name as for the download list below.

I've applied that change when merging, no need to send a v2.

Thanks,
Antonin

