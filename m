Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEEEC88E6E
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 08:33:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15677.1789374780857279707
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 01:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iZAOsEcg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 075591A0614;
	Mon, 14 Sep 2026 08:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C85E060323;
	Mon, 14 Sep 2026 08:32:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E300F11C7AFD9;
	Mon, 14 Sep 2026 10:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789374778; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vLd2xiPElfgwIe+0BvEl68biafT60eDMOwEN1yoyEE4=;
	b=iZAOsEcgXsaIyl1ZrZhFqaEWQ4TwRRr/8D+Pcna9FBV7zYh3Wk1l5VB3V9YjjlTw+02AwQ
	wqCY6QD2gy9rxVwrS/hJqnFbXNRtcKgG9+pUTxEkW5hidodrWqHueoA6lHPEDogqBEFhfr
	mCFMXgZyQa5KhY4aoFtCwnoLaQguJRqP5OmZkCI64XEYp1MUxEI7uj9pPtwAqhB//mvlgA
	nm4AwluGIYD1LgiurbOtwYuG94nNibpHXwY5xp1BbbaTdrhl8wcuNUKiYt6RY78ee/MhWn
	vaLlci13mFsIYvyMsu10yipk78mrmspBlxsU9SvQ2NPPCi/fiJX5S8aDWZdyeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:32:57 +0200
Message-Id: <DLEWF4KS4DG8.2DOPYCRWTQ3U3@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Distribution Support" wiki page is wildly out of date
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <d5376209-e434-a25a-a2af-2e35a63d905c@crashcourse.ca>
In-Reply-To: <d5376209-e434-a25a-a2af-2e35a63d905c@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:33:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10484

On Fri Sep 11, 2026 at 8:22 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/dev/dev-manual/start.html#setting-up-a-nati=
ve-linux-host
>
> point 1 refers the reader to the very old:
>
> https://wiki.yoctoproject.org/wiki/Distribution_Support
>
> should that wiki page be updated, or should the link be quietly
> dropped? more generally, should the official docs refer to YP wiki
> pages if those wiki pages are not actively maintained?

We should drop the link to the wiki. Our system requirements is well-mainta=
ined
and up-to-date, we don't an additional link. Patch welcome.

Thanks!
Antonin

