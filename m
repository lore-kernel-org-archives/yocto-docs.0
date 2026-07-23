Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A577C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:39:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26551.1784821187884040146
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 08:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rdv9ghDu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 778A51A11A9
	for <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 15:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CDE0602B8;
	Thu, 23 Jul 2026 15:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE7F411C1111D;
	Thu, 23 Jul 2026 17:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784821184; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ALzhcHCGwBwqEJeaKs0luwQZ+RmueNxnIITyqVBaNpA=;
	b=rdv9ghDuFIV74FdFuz58I18NJAMHws3YsPnNoW6G4VhNx6Fhujib6UKFmD6BwyXv7zwg6J
	87UUNBNBgl7UJV3IhAATTexPQnQf1b6eTYavEnHE3D6AaaVkyvrJID+bM8jqhWfQJYBORW
	S68Hz0ATgQxoBZLrK/11cYLTytWNHPWqzx0lprvKUPf3WhfCgNMBFDe+JbaWGTcCuUNKhD
	4E0p1El/6YH1/FdEFJExrKzwPd6JzvLSI9VZlHSBtVc1weSmNTwqWxdN/0KEfKqLMfKUdk
	+jzpLz1IASojbD2vRH/UnA9yM+72KrJs5DHTEV+Uqsn1iwcTvyjzmyV3T4QRRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 17:39:42 +0200
Message-Id: <DK62B00M67AT.1Y33XB1KQQ7MA@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] migration-guide: add release notes for 6.0.2
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20260723094505.628062-1-chee.yang.lee@intel.com>
 <20260723094505.628062-2-chee.yang.lee@intel.com>
In-Reply-To: <20260723094505.628062-2-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 15:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10123

Hi,

On Thu Jul 23, 2026 at 11:45 AM CEST, Lee Chee Yang via lists.yoctoproject.=
org wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-6.0.rst          |   1 +
>  .../migration-guides/release-notes-6.0.2.rst  | 273 ++++++++++++++++++
>  2 files changed, 274 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-6.0.2.rs=
t
>
> diff --git a/documentation/migration-guides/release-6.0.rst b/documentati=
on/migration-guides/release-6.0.rst
> index 6cfe3297f4..5f5ed5e2e4 100644
> --- a/documentation/migration-guides/release-6.0.rst
> +++ b/documentation/migration-guides/release-6.0.rst
> @@ -9,3 +9,4 @@ Release 6.0 (wrynose)
>     release-notes-6.0
>     migration-6.0
>     release-notes-6.0.1
> +   release-notes-6.0.2
> diff --git a/documentation/migration-guides/release-notes-6.0.2.rst b/doc=
umentation/migration-guides/release-notes-6.0.2.rst
> new file mode 100644
> index 0000000000..689c8e9bac
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-6.0.2.rst
> @@ -0,0 +1,273 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-6.0.2 (Whinlatter)

Wrynose, not Whinlatter. :) I'll fix it locally but I'm notifying you in ca=
se
this is a mistake in your scripts.

Thanks,
Antonin

