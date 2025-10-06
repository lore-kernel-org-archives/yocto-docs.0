Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08787CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.28511.1759738109957943129
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0BNxW5pT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A785F1A1158;
	Mon,  6 Oct 2025 08:08:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA0F606B7;
	Mon,  6 Oct 2025 08:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96B39102F1D4E;
	Mon,  6 Oct 2025 10:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R8k5x8cpV5ElTSJbyLqaWsCgGk1mqOsAWQ54l8uKeQE=;
	b=0BNxW5pTDBE6wJl0cnjgDL7XNhHkcc4m95Y9l19ygfG5MHkHwQR4t3g7Oro0jbdjMZGy5C
	tdcI484/ou4oYrAX+01k3ZBNmcNsUME3lmkn+WPC7uQI/N8NYAlROj/xqQs8XnxcULRxvz
	QTAAaQ/zJWzIFsXIi7BqMAb5hENsfNp5IxXSbEHN9tAAq3pxB5oLHg7hnOY8os60aJo4o1
	3SpGkfNMN7CAzqYbXU09mgfVLwjATHqTyP7BusEt78BJnJPYEQ0XT/wylGASQDFNExVsVI
	xTyRMuuNMKkjXUMUPWl7MA8Nnwmh0DAVlXrf/+qFckFdcgEo6hWLFFivtbbFrQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] tools: build-docs-container: remove comment for unsupported distros
Date: Mon,  6 Oct 2025 10:07:23 +0200
Message-ID: <175973778848.1174293.2038199275847829611.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918-dev-supported-distros-v1-1-aa1dc6b54c30@cherry.de>
References: <20250918-dev-supported-distros-v1-1-aa1dc6b54c30@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7653


On Thu, 18 Sep 2025 10:56:34 +0200, Quentin Schulz wrote:
> Ubuntu 18.04 and 20.04 are not supported distros, so let's remove the
> comment listing the reason we don't support them.
>=20
>=20

Applied, thanks!

[1/2] tools: build-docs-container: remove comment for unsupported distros
      commit: 9ff31ed417bc7cd80f8bde39372091e40e36b678

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

