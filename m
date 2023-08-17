Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE42BC2FC3F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:23:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.188992.1692282180724024964
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 07:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hdgzsrKj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe490c05c9so6683685e9.0
        for <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692282179; x=1692886979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BRVirzyew/HbgemEFgjHI8cZB7L21H2ghA9xuARnwBk=;
        b=hdgzsrKjKAGWhfVczOzzHPzNIC8MoWLGI7VbpI7O6xSLBtPqycufw3Y5b4tjWKb/Sl
         LUdqO+vzpsOp7x+5hDuQLjtiHe+nSUSPjraGzJUePPfxz2DGquPvGXLmY2r1jtP10VVi
         7xL2WxAvWcaaqitH0OLH6FXa7gvw537wjuSYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692282179; x=1692886979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRVirzyew/HbgemEFgjHI8cZB7L21H2ghA9xuARnwBk=;
        b=hPpmFNFu4qfAU7ktrnkUWyFoxIi27j5wdufVuvLRgRVoy3sszkMwhU87Da1BGtMUdo
         /i0O9SvQT+71ZYYr1seQiJyoDnIZKucwkisODUatmHAeN+1Fv5RL3UYhSlA6MFQGxO6W
         JOA0yoPpSuBbar5l+CF6i5iO2rZcFLshuWj0E3szBvR0mowKdCSl962YOk8dkrm9w+N1
         ewZ5354iuEc5y4lNwfKO9G2QYK1sOFWHxgRUAlhsib2XrjMtIOTmuz53zH3U9HcPyhl5
         L3TfA1aDDt1BuoM+QAjhXwMGmTVMGjMeKUWDcJGTzanwxxJE87w980d0AI/6oyNGZSx4
         gn5Q==
X-Gm-Message-State: AOJu0YwS5JQzs4NrHgWkfmGCTc9gENbuAiiJeH6tFEPENAmQvysq4YKB
	pyrGlSy0nBQOl++7XG4Z2ftF0A==
X-Google-Smtp-Source: AGHT+IEdbBKOtrcBcv5Exbpe3slanKUzAnLWl3jO/W9i53RZe/U8+O5dVZujuse+dRWxZkaUrybEqQ==
X-Received: by 2002:adf:f587:0:b0:319:7c17:4c65 with SMTP id f7-20020adff587000000b003197c174c65mr2266350wro.12.1692282179176;
        Thu, 17 Aug 2023 07:22:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce81:b365:d63f:4c86? ([2001:8b0:aba:5f3c:ce81:b365:d63f:4c86])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600012d000b003198a9d758dsm8206289wrx.78.2023.08.17.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:22:58 -0700 (PDT)
Message-ID: <10e53fcdf9698dffe46c251150f9789c7aa216d3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] dev-manual: disk-space: mention faster "find"
 command to trim sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Yoann CONGAL <yoann.congal@smile.fr>, Randy MacLeod
	 <randy.macleod@windriver.com>, Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 17 Aug 2023 15:22:58 +0100
In-Reply-To: <20230817141528.2869208-1-michael.opdenacker@bootlin.com>
References: <177A5EF47817BA65.8497@lists.yoctoproject.org>
	 <20230817141528.2869208-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 14:23:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4154

On Thu, 2023-08-17 at 16:15 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> [YOCTO #15182]
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Yoann CONGAL <yoann.congal@smile.fr>
> Reported-by: Randy MacLeod <randy.macleod@windriver.com>
> Reported-by: Josef Holzmayr <jester@theyoctojester.info>
>=20
> ---
>=20
> - Changes in V2:
>   - Using a more universal "-mtime" option to find files to remove
>     as suggested by Richard Purdie. V1 was using "-atime" which
>     won't work with systems mounted with the "noatime" option used
>     to increase disk performance.
>   - Add more details about sstate-cache-management.sh provided by
>     Richard Purdie, perhaps not recommended but useful to document
>     as long as it is shipped in OE-core.
> ---
>  documentation/dev-manual/disk-space.rst | 31 ++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-=
manual/disk-space.rst
> index c63591cc7a..01cdf911c4 100644
> --- a/documentation/dev-manual/disk-space.rst
> +++ b/documentation/dev-manual/disk-space.rst
> @@ -27,19 +27,32 @@ Purging Duplicate Shared State Cache Files
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
> +haven't been used for a least a specified number of days::
> =20
> -This command will ask you to confirm the deletions it identifies.
> +   find build/sstate-cache -type f -mtime +$DAYS -delete
> =20
> -.. note::
> +The above command relies on the fact that BitBake touches the sstate cac=
he
> +files as it accesses them, when it has write access to the cache.

Add "You could use -atime instead if the partition isn't mounted with
the noatime option for a read only cache."

?

Otherwise looks good thanks.

Cheers,

Richard


