Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42810CD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:14:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7963.1780568082333172028
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 03:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bJ78FR1f;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A09E11A05EF;
	Thu,  4 Jun 2026 10:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 746A55FEF7;
	Thu,  4 Jun 2026 10:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72FE1106A1838;
	Thu,  4 Jun 2026 12:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780568080; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LHLxrOoDvL1Mi6yCNXCbHn/tJU6anYtSqhFqoiXttJ4=;
	b=bJ78FR1fMapJAIYbamONr52kBEGdYHNtfRI0FCgo7wMOXZ//DuyzjghPdiB2g09BEORLUF
	hf1YMKtfmV47NH7IEI3GzGGbDPMineF/GbPrPx0GX7mLzdxa9warLgIsyt6N8QW9jbFpqX
	ucfjhAbMh421cZcXcQnZjLpdyKDdg/MoDTFT56a0JTK8Ebd3XFZ2oa4RxoRs7+jQu0PjKD
	PfLL9QAgjpINocT5NY4GfOssUvXDVzR57kxeoX1HXwOdbded3Oryf1xM0vGwhGdJCgOUfE
	Itgteh2zXkS2OjLEnJ6LbN+t2bUZQwszp3xXYxW2cnwlgxjc0LVBqrpHnhuSjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 12:14:38 +0200
Message-Id: <DJ06PF26JYAU.KBPZ0QZ4R8XC@bootlin.com>
Subject: Re: [docs] [PATCH] recipe-style-guide: Clarify when License-Update
 tag is needed
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
References: <20260604-license-update-v1-1-16dad5e9b0a2@pbarker.dev>
In-Reply-To: <20260604-license-update-v1-1-16dad5e9b0a2@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 10:14:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9580

On Thu Jun 4, 2026 at 12:09 PM CEST, Paul Barker wrote:
> As discussed in a patch review call, we don't need License-Update tags
> in commits where the upstream license has not changed, and we are
> instead changing the LICENSE variable to fix incorrect data.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  documentation/contributor-guide/recipe-style-guide.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/doc=
umentation/contributor-guide/recipe-style-guide.rst
> index 79bf7c79b67b..d05a535784d9 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -268,14 +268,17 @@ License Updates
>  ~~~~~~~~~~~~~~~
> =20
>  When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the r=
ecipe
> -you need to briefly explain the reason for the change via a ``License-Up=
date:``
> -tag.  Often it's quite trivial, such as::
> +due to an upstream license change, you need to briefly explain the reaso=
n for
> +the change via a ``License-Update:`` tag. Often it's quite trivial, such=
 as::
> =20
>      License-Update: copyright years refreshed
> =20
>  Less often, the actual licensing terms themselves will have changed.  If=
 so, do
>  try to link to upstream making/justifying that decision.
> =20
> +The ``License-Update:`` tag is not needed for commits which fix incorrec=
t
> +license data in our metadata.

By reading this alone I fail to see a use-case, could you provide an exampl=
e?
Perhaps a link to such a commit? (you can use :oecore_rev:`<commit sha>` to
create the link).

Thanks,
Antonin

