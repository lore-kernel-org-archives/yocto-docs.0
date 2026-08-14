Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961A4C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 07:25:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8018.1786692342790996587
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 00:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=amhH/2Mn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9492C1A162E
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 07:25:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C0986046D;
	Fri, 14 Aug 2026 07:25:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B669311C4E8E0;
	Fri, 14 Aug 2026 09:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786692335; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S4lKSUK1fiC9JkF4x4OV1Az6hgoQlKdz62W1QvEAdcI=;
	b=amhH/2Mn20fpRjtDFv4qHO+3Hc5xUUi03UH6cQ3NCrMSXV0bI4i+Eq2nyK8E1TKp04lOSc
	T5iP6ZLymqewc/Jr24ztVzMJFnbBPRKKNq0R7msiDo0KwWEXO+AYUH+DxDZEk6bDZRgcqF
	sRqp66SUYWYykGXtc57Jyxvz8kmiazoWPMjWadAzM9fBsNShw5xB5nZI5DyfLZDrSkcPFt
	xEGtX/efTMEFpytSF/WkxiWHNnD6BCX623d1vH8ZJ2k/n+HHHn0kcaQUzrOb1jopp0Iq+k
	bbsvwy8Mm6JZVfAV3ZJ3BAN1Mh1fKkAkkHYJ3XdFwSr/ji3OfzO81EzxMrrllw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 09:25:33 +0200
Message-Id: <DKOHKMP86CFM.3L5CH4COFDCTS@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Anis Bougrine" <anis.bougrine10@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH v2] ref-manual/tasks.rst: make do_clean
 description more explicit
References: <20260813185552.47183-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260813185552.47183-1-anis.bougrine10@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 07:25:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10290

Hi,

On Thu Aug 13, 2026 at 8:55 PM CEST, Anis Bougrine wrote:
> From: anis <anis.bougrine10@gmail.com>
>
> The current do_clean task description is generic and does not
> specify which files will be removed.
>
> This commit adds details about the files that are removed by
> explicitly listing the affected subdirectories.
>
> Signed-off-by: anis <anis.bougrine10@gmail.com>
> Cc: Antonin Godard <antonin.godard@bootlin.com>

Thanks, I've merged this to master-next with the do_clean description tweak=
ed to
match your recent contribution to OE-Core.

Antonin

