Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E0D7496B
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:21:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13417.1766136111930634256
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 01:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WuPbOljB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB0A11A22E8;
	Fri, 19 Dec 2025 09:21:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE6796071D;
	Fri, 19 Dec 2025 09:21:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05330102F0BAC;
	Fri, 19 Dec 2025 10:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766136109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cdbSCHu09E9Ba48vxjEFp2rIhrOAuYIagWXwgDqjXUQ=;
	b=WuPbOljBP7xhCy6nqUjRODv1qH8XTyS4St6+LKyZmJ7qmVqS57xS+Qbkn4FcRpJC8+vcJm
	6YVCWOytg5OsTZy0HnxQAicok2xU0lrbPybLDpRbY2TXEB/RsS7ar5+15e714IN5zOM8vw
	pEBMyyBz9y26rrbc2oHafZdyLnGF+Ozzi6cIBqgedB+xKvIZ91LxWbocX9/4Cfxz2NVGgu
	aoRvGkkfLijxR+EQEd2/ltcVUZtefbqd+FbexQM3i96i/vLzqF/e6ewk+fQ1/USa5OnvlS
	DxvvWkjqsqmQd7zsh++DHkCF37WO/rFW3Wws7sRprS09kcuCyW8BDM4DhuzTcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 10:21:46 +0100
Message-Id: <DF22ZYPKK9B8.2BYUCG58BOJXD@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] Add the sphinx-copybutton extension
References: <20251218-sphinx-copybutton-v1-1-752b7c4ff8f9@bootlin.com>
 <367af9f7-fac7-4120-ba9d-45f03ee73137@cherry.de>
In-Reply-To: <367af9f7-fac7-4120-ba9d-45f03ee73137@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8305

Hi,

On Thu Dec 18, 2025 at 4:50 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> Second, we may need to configure copybutton, e.g.=20
> https://sphinx-copybutton.readthedocs.io/en/latest/use.html#strip-and-con=
figure-input-prompts-for-code-cells=20
> at the very least I guess.

Good point, I'll add "$ " as the copybutton_prompt_text, so the dollar sign
isn't copied. That way code-blocks containing it will be stripped off when
copying, and others that do not contain it can still be copied as-is.

There's certainly improvements to be made to convert all existing shell cod=
e-blocks
but I think this is already an improvement as-is.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


