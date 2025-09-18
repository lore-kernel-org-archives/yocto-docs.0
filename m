Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936E4CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:00:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.13622.1758200408489233625
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O8K/1HME;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D8A51A0EB9;
	Thu, 18 Sep 2025 13:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DAD06062C;
	Thu, 18 Sep 2025 13:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0859F102F1D05;
	Thu, 18 Sep 2025 15:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758200405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oveNqzH1EwnhT0qKMwYZ843Y4ItJIJonpTLbbLsAs4s=;
	b=O8K/1HMEo4SrNDEvkn4SF25Jo7r5mNjmQTFBxT8LJuEE0QPb55Wp4z9Oom6Lzdi0Msu1yj
	CDpY9NH+d/I+CC4wHyNGT0AzmwYjWuMT8c0H0s2jlQyx1o6aGPyJ31pSSp92gAPfR4XE3l
	UcysLE9k9jYWluEfSInxgHVTIIxaMSL724OM9kNwqIanRNcl3zPUU3ODfTPzvOoRE1QyYM
	9FlQbPzCq/tSoCxDTxDx+pxNE3KdbD26ePm+ors6zNJEzX8AOha+ZE/8wtJ2JZArsqth0o
	McGWd3tckt0zKi6mMXedL3ROtlQOrG0s3Z3l5s6ohxIA14AS7CmUVqQXgcYCVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 15:00:02 +0200
Message-Id: <DCVY0YDNJJQ3.1VWKDMHUP2S3F@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss+yocto@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/2] drop Debian 11 from supported distros
Cc: "Ross Burton" <ross.burton@arm.com>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
 <9e6da26e-f697-4838-b204-7cae85c8d336@cherry.de>
In-Reply-To: <9e6da26e-f697-4838-b204-7cae85c8d336@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:00:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7552

On Thu Sep 18, 2025 at 12:03 PM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
> Reading a bit more the docs, I'm wondering if we shouldn't add Debian 11=
=20
> to the list of "distros we supported but we don't anymore" for older=20
> releases in the docs, e.g. kirkstone, scarthgap and walnascar if we=20
> really are dropping Debian 11 from the builders?

Yes, basically if the Autobuilder workers for debian-11 are turned off
completely (not even run for stable branch), we can move it below the=20

  Finally, here are the distribution versions which were previously
  tested on former revisions of "&DISTRO_NAME;", but no longer are:

sentence in system-requirements.rst.

However if we still run workers for stable branches, we can move it under t=
he
second sentence:

  The following distribution versions are still tested, even though the
  organizations publishing them no longer make updates publicly available:

Let's wait until the patch from Ross gets merged on Poky and see what is do=
ne
with the workers.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


