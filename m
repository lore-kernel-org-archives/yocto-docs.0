Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982B6C9830C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:37:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9263.1768923444201859257
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PpihjgpG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CCEC1A2974;
	Tue, 20 Jan 2026 15:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20E75606AB;
	Tue, 20 Jan 2026 15:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52160102F25B3;
	Tue, 20 Jan 2026 16:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768923441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+VnvjDu1yYI80Te+EHsqb02jUFsghPYWzLGHXHcnYx4=;
	b=PpihjgpGEf/ZMtf3d6DnwwXRPqzwDTiZiUbpN8mT++PYGcUDxMFPwuxwamBbOgGEPcQp5e
	Vpt9X+YYOsKTZH2c/jSxTMa8t+D3IbyYm/aHk7xIyE9deIXiRr7Rl1sna9Xui51YXsrKaU
	BxvU+fynlL53hQuT/mQevau/nXdAenytMNx9D5IXbqBf0rPcw6N80lP0eAw+WjzQ1Y/462
	40AtEV0GYrX5eQsXyTDHy6hozZdGXh01ph/4XDQDe2/C8SizpLBsVSf/XUU2EuFUXeqaGL
	Vt+X7DUR8wmh15PrMAjOxpcAsuiDkUv4/OqUpE7CwjL+B5L3L0qmu9dji7VyAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 16:37:21 +0100
Message-Id: <DFTJ0YCI8UK2.PFT9J6BRS18Z@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 6/9] sdk-manual: appendix-obtain: replace
 directory structure PNG with a code-block
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
 <20260114-code-block-misc-20260114-v1-6-174a6e5dba69@cherry.de>
In-Reply-To: <20260114-code-block-misc-20260114-v1-6-174a6e5dba69@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8600

Hi,

On Wed Jan 14, 2026 at 1:56 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> This PNG is totally unnecessary and makes accessibility much worse, so
> let's simply replace the PNG with a text code-block showing the same
> directory layout.

Thanks, I agree completely. There are more across the documentation IIRC, t=
his
is easy to replace, I should get it to it when I have some time.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


