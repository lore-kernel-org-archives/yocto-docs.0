Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5F9E9539F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:32:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20389.1770211966422369459
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 05:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Eb4W2Uqd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so53032095e9.2
        for <docs@lists.yoctoproject.org>; Wed, 04 Feb 2026 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770211965; x=1770816765; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3BwZ8IBQdwbJL5ARI6rPTCtw8xNgciE64ufrG68z1BI=;
        b=Eb4W2UqdMAEFYZ0NQACVWAntU/BeAoJ9V4RY5PPlp13/eyORKy+GM67LogcWPu2DTA
         GxNJ7w1Pa8+coXm6j9YH4ztGLe5LdVc22XXaZRnrQVLWlpogwmVPmXO4JHzaj1G8/Fik
         11g9VK4bUyxOjnu+UAoO6M3yXLEYNZa1YYLRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211965; x=1770816765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BwZ8IBQdwbJL5ARI6rPTCtw8xNgciE64ufrG68z1BI=;
        b=PRG9mTI0YeDWxoil9xbfbBNFe+86MuAdK9xeDpV93sWs6U3GaOM+npNXadwAiyNQNb
         roswM7pScQRsNPjD7F4B1Xxwb9PzOClB2DEKDHL+0jdpiN29OpebZ7gVru30s2bKI/E7
         IxBF6Ej6ZAV8FBhl+IvCsG7lT1yPYnGnjepM0gXlWi8kfO9BONYucueSE4k3lDeZxya2
         UZVi7cU+LBeosS2rSoTblQhZzNkKIfpiTSlotK6yLHRQaKYeN+omHsdNZjRTVDUirjv/
         ExFpVhOPC2i0BvbZtAKn7c2sbhtJeb9fulxwyhtHX5/HZVcLDK5nR80iptH23S1KCaMd
         hLUA==
X-Forwarded-Encrypted: i=1; AJvYcCW8iefoLi/0V9lTuy69spCYHsqpldrMkOSG0VKFv+H0IHEZz9lIMKvgEAZ/KvuRfesn/tgU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyGgcJYODzkic5GcXYF+QUKUXJhYCKybWG1tV008cBkv9vS8TOb
	sLWlAFdUh6RdiVxeDXafoYcoKzrWEzBvSIE8jcTKB290Bb30sPBgAqrgwxQjoNcCW28=
X-Gm-Gg: AZuq6aLgGtAXh/i94v0dLMyPdp8BukFgXkXhXcRWXRngxIk0Ze56sCLnrrPnWZ2C14p
	ZkemVIu1fqt8DdXo9Bz7E+/a0qWkPiowTXByYm4z0NIMuJjZFKrU7B3+zLWfY4NrVi1aWpQ0npj
	MVEMM8W5YwVb5mfOOl9H6MJez0T17T/EsbaSutwF2LsuHJ2UzQBmHcm7VW3r0My4m5O4QRUA9sQ
	pIE0U4RO/Cmw7vqj2x9alMSrQxHdXFtSfIldOVCuIeXfxBo1x2XuPROWOOG+e+AqBKhmeuK76Jt
	grrWMO88ttBgEnu0+c4ErVV4IaUsv1WYofDJbrVSaLQH/ti+RkLDcl5SZWFpCbDicCjfY/4AHF+
	S3uGIRjj9bKgFk83mBDHVbGTMfJq40/hrCFzZCz8eTJ5EcdNmBk0gQnjUj1SueqX73vyEW/Pk5T
	H3crqMomL/zgEu7B59eAXJL1b+h9PNf7wbzh/9KGKOOmtnaOy8LLLEJ9OLadAaQy5jZJ5oIPN3d
	A0=
X-Received: by 2002:a05:600c:8489:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-4830ea687b8mr40244435e9.36.1770211964723;
        Wed, 04 Feb 2026 05:32:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831091a0e9sm77799335e9.10.2026.02.04.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:32:43 -0800 (PST)
Message-ID: <ad6217119fe0e7382684ef6a41078e172a4e8498.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH v2] doc: fix the switchers menu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 04 Feb 2026 13:32:43 +0000
In-Reply-To: <20260204-fix-switchers-js-v2-1-ea80107eff85@bootlin.com>
References: <20260204-fix-switchers-js-v2-1-ea80107eff85@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Feb 2026 13:32:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8862

On Wed, 2026-02-04 at 11:03 +0100, Antonin Godard via lists.openembedded.or=
g wrote:
> Fix the switchers.js script of Bitbake to show what are the supported
> versions and be able to switch between them.
>=20
> The default landing page is the stable branch and shows the BitBake
> version along with the corresponding Yocto Project codename. This
> hopefully makes it easier to remember the correspondance between the
> BitBake version and the Yocto Project version.
>=20
> This works thanks to a set_versions.py script, which is largely inspired
> from yocto-docs. It reads the tags from the repository and tries to
> guess the currently checked out version of BitBake on which we are.
>=20
> The "obsolete" warning is now also shown when browsing outdated manuals,
> meaning any version not part of activereleases in set_versions.py.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Note: This will be accompanied by a patch to adapt the Autobuilder to
> generate this file for each release.
> ---
> Changes in v2:
> - Remove environment information grabbing mechanism, making this fully
> =C2=A0 standalone.
> - Link to v1: https://lore.kernel.org/r/20250915-fix-switchers-js-v1-0-52=
3ef53fe802@bootlin.com
> ---
> =C2=A0doc/.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> =C2=A0doc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0doc/bitbake.yaml.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +

I was about to merge this however is there a requirement to use yaml
here? I ask mainly as we don't currently have yaml config files and I'd
prefer not to start adding them and try to remain consistent with what
we're using...

Cheers,

Richard

