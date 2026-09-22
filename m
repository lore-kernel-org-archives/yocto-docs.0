Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC8C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:17:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5267.1790065058655851667
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 01:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Sy3GIQ7T;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 517CF4E40ECD;
	Tue, 22 Sep 2026 08:17:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14C0E60580;
	Tue, 22 Sep 2026 08:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE0D710329206;
	Tue, 22 Sep 2026 10:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790065055; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TNZ5ISXEjm2PNB+yvL6KX1JBXOE35QnW4KdU0WSwTEQ=;
	b=Sy3GIQ7TN30UMBnaMhgk5Z1PclWzH2zrESExk8AFpjts8EISVdyDl867pGY/URJ0KBxrJ0
	83eojvgJITDl54nZuxMRQ2IPm0lf96jxNbkY3EBJOQzunR0BlamuKpdY5vC/AvEbCRMmH+
	ye4xW+CMYw8aT2uj6xpiLWQ4BbHYEvvBibLvo4IL6G3/WBlKa9YY9qKtVqaP4l8ZTKsbOk
	XfTagr27LEp+tU1/zmSfA5kt1yS1hP7ZSKdVOJ9boaozlGBuzLIpbf/t8gcgvpRWC4R7Gq
	/2hRMRFfCQdThtcaIqIUVsDGXISbZC0VMmsUosRtIMwOPaq/jF5xa67EpV37aA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 10:17:33 +0200
Message-Id: <DLLP3P6UGBWU.5MIE87WD6FE@bootlin.com>
Subject: Re: [docs] [PATCH 2/4] conf.py: enable sphinx.ext.graphviz
 extension
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20260911150750.75697-1-adrian.freihofer@siemens.com>
 <20260911150750.75697-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260911150750.75697-2-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 08:17:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10573

Hi,

On Fri Sep 11, 2026 at 5:07 PM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Required by the .. graphviz:: diagrams added to dev-manual/devtool.rst
> in a following commit.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 48d28a686..7144d6db1 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -48,6 +48,7 @@ needs_sphinx =3D "4.0"
>  extensions =3D [
>      'sphinx.ext.autosectionlabel',
>      'sphinx.ext.extlinks',
> +    'sphinx.ext.graphviz',
>      'sphinx.ext.intersphinx',
>      'sphinx_copybutton',
>      'sphinxcontrib.rsvgconverter',

In order to add this extension, we also need to update our standards.md doc=
ument
to mention the usage of these types of graphics (under "## Adding new
diagrams"). Also, we need to explain how to edit these graphs - did you use
software to create them? Which one?

Unrelated, but your series does not apply to master anymore, sorry :/ Could=
 you
rebase it?

Thanks,
Antonin

