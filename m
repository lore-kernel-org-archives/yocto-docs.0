Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7116CC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 15:11:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.47419.1674659459286911292
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 07:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AyKVNdsm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1517054wms.4
        for <docs@lists.yoctoproject.org>; Wed, 25 Jan 2023 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzeLViKTZ5L/dBTdCX8a4Eqo6H7JsaQiC1vDKo8O6M8=;
        b=AyKVNdsmsBYxeK33N33gBFKLBvcwwuHai8MOxp8MoQYWno9mNeFY+S+EXvQ0XcDGtt
         Uvqs67PQcYn9dGHHJwgRHD0RQ2ooJOelKkT+3BrVZunmf/Y+9CXbyQ/6upRB3/pOYFCb
         XlF6sx/qdBS+JdhPM1HNSRx3GOODURFFbVqQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzeLViKTZ5L/dBTdCX8a4Eqo6H7JsaQiC1vDKo8O6M8=;
        b=MGAwij4QtxQyqjaXsGlqUvnDsr5fc9bFLaKwCVoBnWclBdrBJJ3yqmh8lHK+ZV403t
         PnU7hbPRn080W3vLa8cQgRB+BmDG5zAqJ4x7YLa8BCR0lKsg0DGKo927XjZlT9fzzqye
         HESxBzdBcBTzagmUZWXFlqNmjdddJx6LSaaIcpJDMrBp9rVYPF4rWKGhAuxECt6ytC2a
         pLooTkUu4ev2vPwxR2MrmetCH8D7EilC5vRKliMOymlZ+ciqFRz/HAUGCcdeR2nadWEj
         nyjqJhvkozCvHqNaO64gwVwHKilSvGuoPmDGaVvzXI2Pzl+0XMa4acui75wM3pwYQRYd
         iGPg==
X-Gm-Message-State: AFqh2kr3veGEBMhQs3h16d9ddewIgk7+hZ0R44r9w1glucpW7PETkLPa
	XDoQwyZkuXWBWupR3dQuuSXsLw==
X-Google-Smtp-Source: AMrXdXuxQYsEnV6r17OjSQaxfaay/ZorZcj5fRDC9FqyPtDyxLddlCVteUjPJUvCTzEJn5cgyHZgnA==
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id k20-20020a05600c0b5400b003c6e60f3f6fmr32379551wmr.38.1674659457518;
        Wed, 25 Jan 2023 07:10:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a? ([2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db2e3f2c7csm7928010wms.0.2023.01.25.07.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 07:10:57 -0800 (PST)
Message-ID: <1003421ce4ffd0b93c7dabe3b2aa7c0b5c240746.camel@linuxfoundation.org>
Subject: Re: [docs] yocto-3.1.22/RELEASENOTES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Takayasu Ito <ito@lineo.co.jp>, poky@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Date: Wed, 25 Jan 2023 15:10:56 +0000
In-Reply-To: <8ada8dc6-fb4b-5042-9fce-d0926d422226@lineo.co.jp>
References: <8ada8dc6-fb4b-5042-9fce-d0926d422226@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Jan 2023 15:11:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3621

On Mon, 2023-01-23 at 17:55 +0900, Takayasu Ito wrote:
> I was checking the following RELEASENOTE contents, and the CVE for
> cairo vulnerability has already been fixed in 2019 and the change in the=
=20
> PATCH file is that the status of the upstream PATCH has been changed=20
> from pending to backported.
>=20
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.22/RELEASENOTE=
S
>=20

The patch was updated in:

https://git.yoctoproject.org/poky/commit/?h=3Ddunfell&id=3D6e97ceb8586281a8=
d594a3a1ab9e303fd34e1d4a

which seems to match the change log and release notes? It wasn't just
the patch status but the patch itself as well?

Cheers,

Richard


