Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFF0CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:32:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20469.1792153962745618335
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 05:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GmTFT+gV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A8F14E41262
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C29876075D;
	Fri, 16 Oct 2026 12:32:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ADA8103281F4;
	Fri, 16 Oct 2026 14:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792153960; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a4fc71+571Y1ZhlK6iA2xEi7/rdkhDr4GgimGT33tOA=;
	b=GmTFT+gVR3PfCvv7COGYyTn0h2o+9mUO7cCC0+2dn0cMBRbcA0kHHxGuf+P1nJxazDmBZz
	XQ2u9Oat+TubJReIv8rfV0XGNfLG3xfnSjRx5+uuL/Hn5XLnufTbhrj0gNKZo6sMlWQW8G
	BwnDUxwMq9vHH6p71y0wrbNu0D6NMVlbqmlyhLiWiZ71SlCqVZMdvHOaR0CaKetqyt+nqG
	yMdP+SFweh0VK8ksxLtbv585RS7nkStuC8eQBxSR04qJYVDLD6PcqekZbzSr7yIYCfKM3X
	Xx3RxV0ibrUDoAWSoYcd/oTCmqRylSh/qz/NrqkpDHluYFjhXbpeBIg6DnbJww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 14:32:39 +0200
Message-Id: <DM69K3AOTBE3.2F8QLMXMKK75Q@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 4/4] dev-manual/devtool: convert
 add/modify/upgrade flow diagrams to Mermaid
References: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
 <20261015200726.2391599-5-adrian.freihofer@siemens.com>
In-Reply-To: <20261015200726.2391599-5-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10694

On Thu Oct 15, 2026 at 10:06 PM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Replace the devtool-add-flow.png, devtool-modify-flow.png and
> devtool-upgrade-flow.png diagrams with Mermaid (.mmd) flowcharts and
> their pre-rendered SVGs, in the same style as the ide-sdk diagrams
> added in the previous commit. The PNGs are removed since they are no
> longer referenced.
>
> The add and modify diagrams also gain a "devtool ide-sdk" branch,
> showing it as an alternative to the manual build/deploy-target loop.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/dev-manual/devtool.rst          |  12 +-
>  .../dev-manual/figures/devtool-add-flow.mmd   | 104 +++++++++++++++++

I don't think it is necessary to keep the mmd files (see why patch 3/4).

>  .../dev-manual/figures/devtool-add-flow.png   | Bin 181699 -> 0 bytes
>  .../dev-manual/figures/devtool-add-flow.svg   |   1 +
>  .../figures/devtool-modify-flow.mmd           | 108 ++++++++++++++++++
>  .../figures/devtool-modify-flow.png           | Bin 171676 -> 0 bytes
>  .../figures/devtool-modify-flow.svg           |   1 +

For this one and the devtool add one, wouldn't it be more correct to have t=
he
"devtool ide-sdk recipe image" before "Edit source code"?

Thanks,
Antonin

