Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092E7C02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:30:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.32905.1737361837854110242
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 00:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I4kaHb+Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9253060004;
	Mon, 20 Jan 2025 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737361836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paw9fG1P3JyoNbbq76iDarq7yudIWLi7+wWXRXcxnbU=;
	b=I4kaHb+Qd5yrW//HBUolfoPAUaenGVb9RYXGAM/+MEw2KFMF9/UPbvEDMBu49Hf7sO/4nH
	lQp3u4voU2muwfl6MxwFvPtKoTCQv6gI0c0SVk/VDSJD4RAbfEaAR6sx2wa4yeRR605G/1
	fSxDROXSA2V101CIBjVdZOcbsIEgNAxMVvtde5C5NJldSXjz1qcfwG8gGkIHu0g3NG/y1t
	9Akx6mPpln9yya2mUluUggvPreeQwQVoIpKuivLI+pswB3aBS32DBOQtF12TIkR7M9THYW
	RDo0CAVDV7VRa8WkQ6RxO47FCsllJi1vaxgbAKUDg5Sqr443XdyAuj08PstJfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 09:30:35 +0100
Message-Id: <D76RDCSD5GRB.27GJNWE79OPLB@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v3] sdk-manual: extensible.rst: devtool ide-sdk improve
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250120071619.2005696-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250120071619.2005696-1-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 08:30:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6147

Hi Adrian,

On Mon Jan 20, 2025 at 8:16 AM CET, Adrian Freihofer wrote:
> The devtool ide-sdk section is reformulated to be independent of the
> eSDK installer. In fact, ide-sdk does not even support the execution
> of an installer-based setup.
> This reformulation is also a preparation for moving the devtool
> documentation to a dedicated devtool section which is independent from
> the eSDK documentation.
> It should be clarified that devtool ide-sdk starts the SDK directly
> from the bitbake environment. It is therefore an alternative to
> bitbake -c populate_sdk_ext and installing an SDK installer.
>
> A warning is added that explains some workarounds for some nasty
> behavior of VSCode when running it in a bitbake environment.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> Cc: Antonin Godard <antonin.godard@bootlin.com>
> ---
> v3: findings from https://lists.yoctoproject.org/g/docs/message/6144
> ---

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks for the patches. I will rebase my devtool patches on yours, and rese=
nd
this week.

Cheers
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

