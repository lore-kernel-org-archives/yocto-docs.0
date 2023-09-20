Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EBC05024
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 20:50:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.823.1695243025605492010
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 13:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6nIDP16;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401f68602a8so2631035e9.3
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695243024; x=1695847824; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HbM8acmcR1pT99lhLvI7XlMUtE53adPzRXOtVZD12mY=;
        b=a6nIDP16DGg1jzM1uU6w0T+IfvtG/M7yv/lJBouQMOCw6gFaIrluRIdUHV6vrxcsnE
         ZRV0uTu5UMYmvHRoAxe8xTqp6F/+x3z7vrPIQedMcfLMazJw4MDRIBeSi2AY8cTdv6Qf
         w0SHixQfIw0oHZWF5aD1XhJUvEHS5FROPn9Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243024; x=1695847824;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HbM8acmcR1pT99lhLvI7XlMUtE53adPzRXOtVZD12mY=;
        b=lsKqgajxKEwplY70LSkCLYTef/UXwA4bBcbO3Wlbz/TythMf8T/xrdydYql3Ey2KkS
         d8X260vW1kk2BkqSpg15L2ci9x0FYrHzPcQG031bYulq+h7bswFFOGZ95LzuvMox3w6l
         v28+k2fN7dya9k2k5NhaElVZI212lbrW5Aq5+QdClyCyaf4Pgn/Q0I7IBziqixKbdWeE
         KcAYdhVoV1DEtKlqf9cc0yKFXoGmOvZ0OYzR7fv12o63G/T/3gN1f4sAkEdJTfJbLRIV
         QOsuk39rlW9pv94S7XZoxLmECIBK3p2T9O4j2snG5m8EkjXdR1BuCcqK/iXAXcZVxCvs
         s8pA==
X-Gm-Message-State: AOJu0YwShCZuNwMDhBltPYjvwuJ8xNP3jIbNOebHvvDVY2OcmIjRwc88
	uhvWX5BV3JVr7+M2I3PU4qqxIQ==
X-Google-Smtp-Source: AGHT+IE+CrAJixxuacJTPO58rcO/3fjet1zfglzS40MhEwj9kpy27x0lVy7aajxdDXySQv9MoGlhXQ==
X-Received: by 2002:a1c:f717:0:b0:3fe:d1b9:7ea9 with SMTP id v23-20020a1cf717000000b003fed1b97ea9mr3450703wmh.36.1695243023944;
        Wed, 20 Sep 2023 13:50:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e? ([2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm1743393wrm.93.2023.09.20.13.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 13:50:23 -0700 (PDT)
Message-ID: <6cbbd72577806ebf54412268686f4974c5954d61.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] contributor-guide/style-guide: Add a note about task
 idempotence
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 20 Sep 2023 21:50:22 +0100
In-Reply-To: <20230920191329.2504837-1-michael.opdenacker@bootlin.com>
References: <95b653db-9dd2-7fe9-189c-03d646a57b20@smile.fr>
	 <20230920191329.2504837-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 20:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4279

On Wed, 2023-09-20 at 21:13 +0200, michael.opdenacker@bootlin.com
wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Yoann Congal <yoann.congal@smile.fr>
>=20
> ---
> Changes in V2:
> - Use a bulleted list to clarify the order of steps
>   (Suggested by Yoann Congal)
> - Recall that we are talking about idempotence in tasks.
>   Useful for people overlooking the previous paragraph.
> ---
>  .../contributor-guide/recipe-style-guide.rst       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/doc=
umentation/contributor-guide/recipe-style-guide.rst
> index 1a1c1c6ee2..b63172bd77 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -257,6 +257,20 @@ Tips and Guidelines for Writing Recipes
>     and ``-nativesdk`` ones, whenever possible. This avoids having to mai=
ntain multiple
>     recipe files at the same time.
> =20
> +-  Recipes should have tasks which are idempotent, i.e. that executing a=
 given task
> +   multiple times shouldn't change the end result. The build environment=
 is built upon
> +   this assumption and breaking it can cause obscure build failures.
> +
> +-  For idempotence when modifying files in tasks, it is usually best to:
> +
> +   - copy a file ``X`` to ``X.orig`` (only if it doesn't exist already)
> +   - then, copy ``X.orig`` back to ``X``,
> +   - and, finally, modify ``X``.
> +
> +   This ensures if rerun the task always has the same end result and the
> +   original file can be preserved to reuse. It also guards against an
> +   interrupted build corrupting the file.
> +
>  Patch Upstream Status
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


FWIW, fine by me, thanks.

Richard


