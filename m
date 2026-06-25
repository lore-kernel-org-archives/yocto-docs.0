Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A238CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:23:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6581.1782375810812683329
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tK5lUtvK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9367A4E408AC;
	Thu, 25 Jun 2026 08:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 674155FF03;
	Thu, 25 Jun 2026 08:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E684106C8077;
	Thu, 25 Jun 2026 10:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782375808; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VG+A1sowywLgzfMLlM0oUwCwRQJecm5O/MXRoVXbys4=;
	b=tK5lUtvKqgX6XQqlv0GWQhsgxYTqNr4GvKQQ0sV8ySXMoMGh6+POUM135cb4NWHZOVwtx5
	ucfVOeq74bAnr/14Cy0Qt3tcOwCkaOa/mTwwcP6EpuDH6FlDv4NzumCY8CrWFvGy5W9aj8
	rkobqjMBQYtSZ0gYGPvtpeHZXq3J1iBlgS/w2fHXZd8m2do48Sc9vMlhDflZn/r0l6IEEW
	HRm+ynYhmyacMqx8VioHUjTQGNovSsxMiaZaadG76Jw/6l1oQALho5/ZgH2aPdImbOJvVK
	O6zAoqAfvzHTMWP2+02/dEMki9wWqsRgDt3N6gn9TtCQorLrd84SBVXpdsNylQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 10:23:26 +0200
Message-Id: <DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
In-Reply-To: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9877

Hi,

On Tue Jun 23, 2026 at 7:43 PM CEST, Robert P. J. Day wrote:
>
> Add two new entries for the meta/conf/{fragments,templates}
> directories to the structure of OE-Core metadata.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   I didn't bother with the "multiconfig" directory since all it
> contained was an empty default.conf file. So let's just go with these.
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index ff84b250b..96f9c9f34 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -862,6 +862,25 @@ it is possible to extend that support to other SDK h=
osts by adding
>  additional configuration files in this subdirectory within another
>  layer.
>
> +.. _structure-meta-conf-fragments:
> +
> +``meta/conf/fragments/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This directory contains a number of
> +:term:`configuration fragments <Configuration Fragment>` ---
> +top-level build configuration features that can be independently enabled
> +and disabled using standard tooling.

s/using standard tooling/using the :bitbake_path:`bitbake-config-build <bin=
/bitbake-config-build>` utility/

Can you add a link to the reference manual's fragment section here please?
(documentation/ref-manual/fragments.rst)

> +
> +.. _structure-meta-conf-templates:
> +
> +``meta/conf/templates/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This directory contains default templates to be used as initial files
> +such as ``local.conf``, ``bblayers.conf`` and other files when
> +initializing a new Yocto Project build.

Please cross link to documentation/dev-manual/custom-template-configuration=
-directory.rst

Antonin

