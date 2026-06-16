Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B91ACD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:07:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156618.1781622436123361110
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L7vpH/Zv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A5F04E42F00;
	Tue, 16 Jun 2026 15:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F5AF601A9;
	Tue, 16 Jun 2026 15:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FD4D106C966A;
	Tue, 16 Jun 2026 17:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622433; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JIBg8KUdlW9zqQ/mc3jFy97R+rJBD8TZ7EF5AqyynY8=;
	b=L7vpH/Zvit8bx9xYy+y0VzsKskuVsIYT7eKE7bz65ZRI4xIL/oVYzQkKHsAYfEQLkgk9AI
	7AMcG9ka2hER9LapSkZ5iyePNT6UrTn7WIIG6hhanUK0IB56HlsnkqdzM+imIKFu7NBW6i
	1L8okLTvGQiM9xlQs+0B4U0TiXtBeykc+JYOEMq53qTxbZhnTB72PTNSbTVI4dwLdo9Aog
	2a8tlVsOHeMC3VPmDFdqiTs7Q/3P9mA19wNIezXF6oKtdNoWyc+yB1uySdvt5f9adG3M0U
	/0t2UdriqNIYo9oFiUkEg9vdeQsjJbVasryw+yYUB1ibLSwYa19paODdwpw6Bw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:07:12 +0200
Message-Id: <DJAKFYH8SXQE.2N4P9MVMH2FVU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document RM_WORK_EXCLUDE_ITEMS
 variable
References: <e464f1c3-2d29-4a9d-a46f-8e4cb217f17b@crashcourse.ca>
In-Reply-To: <e464f1c3-2d29-4a9d-a46f-8e4cb217f17b@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9753

On Tue Jun 16, 2026 at 3:50 PM CEST, Robert P. J. Day wrote:
>
> Add an explanation of the RM_WORK_EXCLUDE_ITEMS variable to both the
> Reference Manual variables and classes sections.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 95e07f85a..ba87a5cd4 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2614,6 +2614,13 @@ which can also be set in your ``local.conf`` file.=
 Here is an example::
>
>     RM_WORK_EXCLUDE +=3D "busybox glibc"
>
> +Finally, if you are using this class for a recipe but want to prevent
> +:term:`BitBake` from deleting specific folders or files in that recipe's
> +:term:`WORKDIR` (other than ``temp``), you can preserve those folders or
> +files with the :term:`RM_WORK_EXCLUDE_ITEMS` variable as follows::
> +
> +   RM_WORK_EXCLUDE_ITEMS +=3D "items_to_keep"
> +
>  .. _ref-classes-rootfs*:
>
>  ``rootfs*``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index df3666f1c..c74de2be8 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8433,6 +8433,11 @@ system and gives an overview of their function and=
 contents.
>        specifies a list of recipes whose work directories should not be r=
emoved.
>        See the ":ref:`ref-classes-rm-work`" section for more details.
>
> +   :term:`RM_WORK_EXCLUDE_ITEMS`
> +      With :ref:`ref-classes-rm-work` enabled, this variable specifies
> +      a list of files or folders to be preserved.
> +      See the ":ref:`ref-classes-rm-work`" section for more details.

Can you also mention that these files or directories are relative to the WO=
RKDIR?

Thanks,
Antonin

