Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB59EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 15:06:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.45070.1691766400520013438
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 08:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QHwHkIPn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so12657375e9.0
        for <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691766399; x=1692371199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4W0RWWR0Wc9oWFhw8WJ9tBVwoUHPDvYUJx+6PRx+CCo=;
        b=QHwHkIPnCymFf1JVhpQRGpnVRbfZNUXho+T+N0Kcp948GQGf7MjDZmgp1H6soZmU+a
         WJEgytAXGzqmESL+RMSMl9y1awRq1PcOeYZp8DUar6UlFx9LDRDtZtgGd6/G1exK1s40
         Zgzpmes6aNzB84QhvgYIZhNJ8AqyEW5D6SdM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691766399; x=1692371199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4W0RWWR0Wc9oWFhw8WJ9tBVwoUHPDvYUJx+6PRx+CCo=;
        b=MluEbuhe67ibelIqwzw45rpR+pZQhn+cNiK5I8pnVicBn8fk+sjbidx1oyl1fFe0wA
         yHUVvhpX89Sj/Mfp7aq+UdseS2kyAl0he65zVwoIwX0ABPDrtyrqBSLnraw9mwaUpJrE
         XLTgbkNJfbM/cQ5vZgX8DZXGoJSWVBPYhgB4xnrfLUFGO7M7U2kwoClwRmLxFukmmJCS
         WMfAPdC6WvkTgqSM8Wao1c3iZ6LIXZ8WOYQ+X7tPUsaLHDCDNFRkRMDFnxtMOBCOyWBU
         tAglZwPc0p9z259dlc14hO9lLpPXvpo5oHiLglDORQx1k/CC2ThivqzFm6Fc6l2+mL8R
         DoRw==
X-Gm-Message-State: AOJu0YyrFVO27y1+wnvgL+3Ccb1CM4L2f796i36AyvcVs6E6ozXbp5cX
	/Nf6PA0/gvcbpiHvFTfgCDqG6w==
X-Google-Smtp-Source: AGHT+IFAeqzQGvXItCF33iBodg/8DydN2lx1oEx2FTReQRYuj473ZixBwJvp1t9Hf49E2q/uZQQMOw==
X-Received: by 2002:a05:600c:4fc8:b0:3fe:2120:eb7c with SMTP id o8-20020a05600c4fc800b003fe2120eb7cmr4763529wmq.0.1691766398843;
        Fri, 11 Aug 2023 08:06:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f961:7656:a74a:6fde? ([2001:8b0:aba:5f3c:f961:7656:a74a:6fde])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c205000b003fe26bf65e7sm5464602wmg.13.2023.08.11.08.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:06:37 -0700 (PDT)
Message-ID: <e97b46476d71da9139ac2ade7f9e397f45a58d5d.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] dev-manual: disk-space: mention faster "find"
 command to trim sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Yoann CONGAL <yoann.congal@smile.fr>, Randy MacLeod
	 <randy.macleod@windriver.com>, Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 11 Aug 2023 16:06:23 +0100
In-Reply-To: <20230811090920.1095076-1-michael.opdenacker@bootlin.com>
References: <20230811090920.1095076-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 15:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4143

On Fri, 2023-08-11 at 11:09 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> [YOCTO #15182]
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
> Reported-by: Randy MacLeod <randy.macleod@windriver.com>
> Reported-by: Josef Holzmayr <jester@theyoctojester.info>
> ---
>  documentation/dev-manual/disk-space.rst | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-=
manual/disk-space.rst
> index c63591cc7a..670f3d2792 100644
> --- a/documentation/dev-manual/disk-space.rst
> +++ b/documentation/dev-manual/disk-space.rst
> @@ -27,19 +27,25 @@ Purging Duplicate Shared State Cache Files
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  After multiple build iterations, the Shared State (sstate) cache can con=
tain
> -duplicate cache files for a given package, while only the most recent on=
e
> -is likely to be reusable. The following command purges all but the
> -newest sstate cache file for each package::
> +duplicate cache files for a given package, consuming a substantial amoun=
t of
> +disk space. However, only the most recent cache files are likeky to be r=
eusable.
> =20
> -   sstate-cache-management.sh --remove-duplicated --cache-dir=3Dbuild/ss=
tate-cache
> +The following command is a quick way to purge all the cache files which
> +are older than a specified number of days::
> =20
> -This command will ask you to confirm the deletions it identifies.
> +   find build/sstate-cache -type f -atime +$DAYS -delete
> =20
> -.. note::
> +OpenEmbedded-Core also offers a command which can be used to look for
> +cache files only for enabled architectures, and purge all but the newest
> +ones on each architecture::
> =20
> -   The duplicated sstate cache files of one package must have the same
> -   architecture, which means that sstate cache files with multiple
> -   architectures are not considered as duplicate.
> +   sstate-cache-management.sh --remove-duplicated --cache-dir=3Dbuild/ss=
tate-cache
> =20
> +This command will ask you to confirm the deletions it identifies.
>  Run ``sstate-cache-management.sh`` for more details about this script.

As long as bitbake builds have writable access to the sstate cache,
files are touched as they are accessed so it is easy to know which ones
are being used and which ones are not. As such you can use mtime in the
above example even for a partition mounted as "noatime" for performance
reasons.

> =20
> +.. note::
> +
> +   As this command is much more cautious and selective, removing only ca=
che files,
> +   it will execute much slower than the simple ``find`` command describe=
d above.
> +   Therefore, it may not be your best option to trim huge cache director=
ies.

It doesn't remove only cache files, it removes files that it considers
to be unreachable by exploring a set of build configurations. It
requires full build environment to be available and doesn't work well
covering multiple releases. It also doesn't work in a limited
environment like a BSD based NAS where the above find command would
still likely work easily.

Can we get rid of sstate-cache-management.sh? :)

Cheers,

Richard





