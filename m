Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8434.1793608283616777074
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 00:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0Dx08Nf3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4ED5A1A1402
	for <docs@lists.yoctoproject.org>; Mon,  2 Nov 2026 08:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21E4960750;
	Mon,  2 Nov 2026 08:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3096F103290E8;
	Mon,  2 Nov 2026 09:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793608280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VARN8dp6nUsyfhDBIPyNWTL+Hl9NbGXxAF80lX88LRI=;
	b=0Dx08Nf3+yt1mOC52HgGTdhrveGArWQT+MDwkxOAAkbxUejT+96o5mVFaea9YfLSzeLPZW
	OjbOWZTEYmVeBkgszkQ4Mde+z3BqxBx3FqvRQjzn8vRS0c63vlMlFy6JfwTvQkLg1UMYRE
	tnYZisbjoLpxZoZPUF45IIaz3g6e9+qO7Q3tUpTEoG5u6XWjIMWbDDwlCfTpZS+R4GsB+O
	wkFOyUrbEN+t+Tl/y/8mA7WynvbfRDsG4emGUIu/DPEyneULeI1nrmRWtgq7vrcG+9dTnM
	YopedqpnjPJhWF6egvjF8DJpZhCzUHoJbyVU4z26l0SB1SVBQ62gKmybSYVbrw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 09:31:18 +0100
Message-Id: <DMKL2K1ANGGP.29OFOOMS35HLA@bootlin.com>
Subject: Re: [docs] [PATCH v3] ref-manual/faq: Add entry about emails on
 patch merging
Cc: "Paul Barker" <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
References: <20261030230207.3536573-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20261030230207.3536573-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 08:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10752

Hi,

On Sat Oct 31, 2026 at 12:02 AM CET, Richard Purdie via docs wrote:
> Document why we don't currently send emails when patches merge in the FAQ=
.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/ref-manual/faq.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/=
faq.rst
> index 3646286a6..c1657d677 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -88,6 +88,26 @@ Our automated testing includes it through the ``poky-a=
ltcfg`` :term:`DISTRO` and
>  we don't really need it to be the default: it is tested, it works, and p=
eople
>  can choose to use it.
> =20
> +Why don't I get an email when my patch merges?
> +----------------------------------------------
> +
> +Where the project uses mailing lists for patch submission, many of the c=
omponents
> +such as bitbake and OpenEmbedded-Core haven't found it appropriate to re=
ply on the
> +mailing list for each patch that merges for two main reasons. Firstly, i=
t would
> +generate a lot of email traffic with content that may only be useful to =
a small
> +number of people and quite annoying for other uninterested people to fil=
ter through.
> +That could be avoided by only sending emails direct to the submitters.
> +
> +Secondly, sending such emails accurately, takes time and it wasn't felt =
to be the

I feel like the second comma here isn't needed. I'll remove it when merging=
 to
master-next.

> +best use of limited maintainer time. We do track patch status to some le=
vel
> +in patchwork and there is automated tooling which could extend on top of=
 that but

We can add a link to https://patchwork.yoctoproject.org/. Can do that when =
merging.

> +it hasn't been possible to fit that into the projects workflows with eno=
ugh accuracy
> +at this time.
> +
> +It is very easy to check whether a patch has merged by looking at the re=
pository, or
> +pulling and rebasing.

Have we settled on the master-review/master-backlog process now? That is
something we could mention here (or somewhere else and xref here), with lin=
ks to
branches, so at least people would know a bit more about the status of thei=
r
patch. But I am not sure how mature this process is as of today. Cc'ing Pau=
l as
I think he might have worked on docs for this.

Otherwise the patch LGTM, the point above could be a follow-up.

Thanks,
Antonin
