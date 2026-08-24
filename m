Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7E3C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 07:21:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11363.1787556077780901825
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 00:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hkd73DEI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72A664E412E1
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 07:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4614060378;
	Mon, 24 Aug 2026 07:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D6E11C789AC;
	Mon, 24 Aug 2026 09:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787556070; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vv9amDBsuOYfjCgmyU7NG2ED9wsQatoZeriJsQ6Kp7s=;
	b=hkd73DEIZNeRpo+SJmyz9GMZS8uVFmm6eBAfPEKDeE6wLPGx66NGVA7wnwZdQMHnce/NPY
	q/xjLu5sxHs500//RNwCrHQFNCOlY209MX/zXx6iMrpqdvgwvp+J9N7VxPy6f4MDtbHTUa
	YLH5a9IPPle/zCTDDNf9QH7imn7FP2ziZpRKDdwYg2GDpDfH0vvXycQdslyDPlSO7lh79F
	XVa6v3A10HUilq7/JjfSiFsP/bRlTD1PKPsvgD2FElTzMWMgQoeBd2b2EAa/WYWws11p9W
	XLKYF+B4LMDG1YQ5yLByLqg4OQrOdpypzfLXkiwXk/ljd2ohXTZHggQ0a5wNug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:21:08 +0200
Message-Id: <DKWZQPEFQRND.1H2YHYEQAJT55@bootlin.com>
Subject: Re: [docs] "pipenv check" fails with latest build instructions
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <92d39d57-bd4a-96f1-5304-e309f8378f30@crashcourse.ca>
In-Reply-To: <92d39d57-bd4a-96f1-5304-e309f8378f30@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 07:21:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10323

Hi,

On Fri Aug 21, 2026 at 5:36 PM CEST, Robert P. J. Day wrote:
>
>   playing with quentin's latest pipenv instructions, and noticed:
>
> $ pipenv check
> Checking PEP 508 requirements...
> Specifier python_version does not match 3 (3.13).
> Failed!
> $
>
> since, as i read it, "python_version" in Pipfile cannot just be "3",
> but needs to be at least a major release like "3.13". other than that,
> sphinx-lint and stylecheck seem to work fine, so do we even care?

I think this might get fixed with the next version of pipenv:
https://github.com/pypa/pipenv/pull/6688/changes/31548e6972f518ab4ccb5b8606=
cf1bb73f284abe

Antonin

