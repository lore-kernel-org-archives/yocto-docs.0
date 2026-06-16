Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CDDCD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:05:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156580.1781622342056192892
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q45vyIrk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 660071A395A
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:05:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE18601A9;
	Tue, 16 Jun 2026 15:05:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F0E4106C9EA9;
	Tue, 16 Jun 2026 17:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622339; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J8DxnB8NeMWEJnTCumD7XwDn983YlUykO4pXXU43cAg=;
	b=Q45vyIrkCDENuTe5JdDvx8iT3fLLRNx7FXgjsRi0+BHRJQHb7a0pURSElqRcDx1NtsPYPA
	hj0a1gC/Gvfp9N32fi7mCKmckeFSmdFQ8d/LTnPllQoQcpQTX9pcTIvKztVkF1zCIE5eTG
	wldi+dmorjcSQ/t0SYUFaBac9ggdyEijQrqxIuMJuyQ9QlQYnVSRepBDHh5rqMDSBDxExw
	t3mjljmq6pYSSmCoHwgdDc9FasBYFN15ID4y+0m0s+r29M0BMset/SHj9MhYLC19rDNXRR
	BvIlpT8GKl4JDxIczAiZJCusV4zztyBCCTIE7XEALwVaBNTufe0GRa5DvBRhGw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:05:38 +0200
Message-Id: <DJAKERB4BM4W.2GT2TON6I862L@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: add note explaining OE will identify
 missing packages
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <0abc41e2-cf58-a97f-a3fb-711493c5686f@crashcourse.ca>
In-Reply-To: <0abc41e2-cf58-a97f-a3fb-711493c5686f@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:05:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9751

Hi,

On Tue Jun 16, 2026 at 1:15 PM CEST, Robert P. J. Day wrote:
>
> Add a note explaining that, if any required host tools are not
> installed on the build host, doing a build will let the developer know
> what they still need to install.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
> index 5171ca6ba..829b88293 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -160,6 +160,17 @@ large when covering all build scenarios using the Yo=
cto Project. This
>  section describes required packages according to Linux distribution and
>  function.
>
> +.. note::
> +
> +   If you don't have all of the required build packages as described bel=
ow,
> +   trying to build will almost certainly generate an error message simil=
ar to::
> +
> +      ERROR: The following required tools (as specified by HOSTTOOLS) ap=
pear
> +      to be unavailable in PATH, please install them in order to proceed=
:
> +        gawk
> +
> +   to let you know what's missing.
> +

The section is called System *Requirements*. So I think this is already imp=
lied
by the title. And I don't think anyone would skip over some of those with a
section title like this one.

Antonin

