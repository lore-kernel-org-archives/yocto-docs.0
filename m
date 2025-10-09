Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD5BCCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:01:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8418.1760004111652492242
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fwvUUqko;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A35DA1A123B
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 10:01:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71CE26062C;
	Thu,  9 Oct 2025 10:01:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B84AD102F2171;
	Thu,  9 Oct 2025 12:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760004108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WVn35XRrGzaR9lmYoBnCuFlko/f+RMa6S7RcL42SRfA=;
	b=fwvUUqkoMoigZtYtHLOfY1EEGRJrb0Gl6VbbhhBZjOqYBTJcpHSjPW3LGZDNztkgk+tPjt
	ldPhmeo6XBpPOCZQ6IRV/zdoww7Rt21m5yb117q6Jd6tcZ8PQs1nSQuKw5BEHyMeLeoEe4
	9wVA/tNINM+IzyXlAV+cECzuiRRZ8Nw7Rc4cznsiRma1Z/3+bGv504Z9ZvjVjFKDfuHtYf
	3GrZiBsv8Didvkhl7UaU7wYTbihcaKzXeVl8yJOd9NK7IWrPAO3+/4Y9fJ4G0Xu4cvvEFR
	y77g0tx46PeJe8R8yDMK2Dy0EGGsdlNXHZY6Vrl5LkrgZdp9pqZe79JR0r1QTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:01:46 +0200
Message-Id: <DDDPDWQEDH3V.1L0AMHY2FAHEZ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] tools/build-docs-container: make concurrent-safe
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
References: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
In-Reply-To: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7672

On Thu Oct 9, 2025 at 10:59 AM CEST, Quentin Schulz wrote:
[...]
> The only downside is that we cannot infer from the image sha the
> underlying distro we're testing.

Maybe we could retag the image after it is built and include the image name=
 +
the sha in the tag? With `$OCI tag source dest`, then `$OCI rmi source`?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


