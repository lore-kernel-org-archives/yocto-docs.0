Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ADDD132A6
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 09:58:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.54242.1730714314614740324
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 01:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=af6g9sC0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F891E0004;
	Mon,  4 Nov 2024 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730714312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S32bA3oJlTPMRaOxwwxTWK+bpAuHH9fiOWJM/TKfNzQ=;
	b=af6g9sC0GhRa0XPdikBEA3giPZPXhGxe2ia7e3v29q4j6+zw9OvcfY77SbDdTYIuJqMlL5
	FPZdSSaXp6rvCToFCnvbNOut6oLUjjxsi7HK6DfzS0v9yKbxHkhG001RtdI+bNXJjELM6E
	4hRkZVqDSQmXyDz8SnywOsLTIckJ7xS72pI2Rur3LVvEI7D6SNxonVMGev+E1nMJMfjs1U
	Cucgb1D2yNzLjIHOj+alu4XLucKdVtiMOlUREMxxD4gYt1qz46ojHzHr8D8nVPHuMeqkBJ
	Zzo1oeybiR0SgEtnjji6t7pa7roTBF/bffmX1G6SNjg6nPTOdDFL2ZCAxlEzhA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 10:58:32 +0100
Message-Id: <D5DB0QW1VLV3.1D6O0H2GN1USK@bootlin.com>
Subject: Re: [docs] [PATCH] conf.py: silence cve role already registered
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
In-Reply-To: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 09:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5646

Hi Julien,

On Thu Oct 31, 2024 at 5:52 PM CET, Julien Stephan wrote:
> Commit bd9add8a0 - conf.py: add macro for Mitre CVE links
> added a new macro for mitre cve links called "cve_mitre" which conflicts
> with the already existing "cve" role.
>
>   WARNING: role 'cve' is already registered, it will be overridden [app.a=
dd_role]
>
> The warning is turned into an error making "make html" fail, but
> documentation is still successfully built.
>
> Since documentation is still correctly built, just suppress the warning.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/conf.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 35c5c14535ba67aae3554819b55f0fb52a9d0027..aaddf2c789196fc26a734f06d=
be005f147b9bbd3 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -118,6 +118,9 @@ intersphinx_mapping =3D {
>  # Suppress "WARNING: unknown mimetype for ..."
>  suppress_warnings =3D ['epub.unknown_project_files']
> =20
> +# Suppress "WARNING: role 'cve' is already registered, it will be overri=
dden [app.add_role]"
> +suppress_warnings.append('app.add_role')
> +
>  # -- Options for HTML output -------------------------------------------=
------
> =20
>  # The theme to use for HTML and HTML Help pages.  See the documentation =
for
>
> ---
> base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
> change-id: 20241031-fix-cve-add-role-warning-1147c223787a
>
> Best regards,

Thanks, we're also updating Sphinx at the moment, so this comes at the righ=
t
time! I do get the warning/error on 8.1.3, and this fixes the error and mak=
e the
links point to NIST, as expected.

Also verified and it is backward compatible with previous versions of Sphin=
x.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


