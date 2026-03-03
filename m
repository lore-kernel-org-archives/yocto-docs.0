Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C854EC1458
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:07:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19020.1772546853482125552
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oNJsjbbm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 495AB1A2357;
	Tue,  3 Mar 2026 14:07:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FC7C5FF29;
	Tue,  3 Mar 2026 14:07:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CABF51036893A;
	Tue,  3 Mar 2026 15:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772546850; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pixmbE+U7NEcOk+yAKnKJ5HJCEYTF9oywJ9T82lV94w=;
	b=oNJsjbbmC8oHrtdF5VWsZqrYZVBeAjSNYCyWeb4RfQhzu51385SlKGe8EC76mg3U1kYIwV
	XMFNcwn3oZJyHaHDZEkN7smPyyjTeaQ2+PAOYdza0X3/POGLoN5C2jwoNjhg6hJZ/VBEjK
	l/MynqeHS+bLUwnOXyznZ5DAr1X79XXDOwqiFdrpck//1weeHYrUfOk829TRSSOeKqHqQd
	E8Q+LWQ7BloiDuaYVYxpiEG/Bk4vOMY77fy442Hiv7jVh3LzUx54EcIJoGcoKcoXk5RDNk
	JvVTOdmMCHHwKxP1hUj5NwvonSUjg6ntw/om5YL+faCg1WZP+dG60/Zdw+JP/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 15:07:28 +0100
Message-Id: <DGT7F0WSEB9X.37DJTF2SVYR37@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: delete claim PACKAGE_EXCLUDE does
 not support .deb
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <095c8524-27d0-9a44-f1a3-63079c9ba360@crashcourse.ca>
In-Reply-To: <095c8524-27d0-9a44-f1a3-63079c9ba360@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9051

On Tue Mar 3, 2026 at 2:46 PM CET, Robert P. J. Day wrote:
>
> The current explanation of "PACKAGE_EXCLUDE" claims that this
> variable does not support .deb packaging; this is incorrect.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 45073d8a0..9e0c5b083 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -300,9 +300,6 @@ system and gives an overview of their function and co=
ntents.
>        variable), the OpenEmbedded build system ignores your request and
>        will install the packages to avoid dependency errors.
>
> -      This variable is supported only when using the IPK and RPM
> -      packaging backends. DEB is not supported.
> -
>        See the :term:`NO_RECOMMENDATIONS` and the
>        :term:`PACKAGE_EXCLUDE` variables for related
>        information.

Yes, I could also verify this.

Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks,
Antonin

