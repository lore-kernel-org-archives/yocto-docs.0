Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF62CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:08:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17007.1781086094991903574
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 03:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A+pk0us0;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so57483255e9.3
        for <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781086093; x=1781690893; darn=lists.yoctoproject.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WUUXnXoVwER610lf7p4ZMCb43FIfromimGDMbNp4gI=;
        b=A+pk0us0jIoSVkFg/GcPOTc5ifU9f3H8rqzb0P2MQXIQnX1NV9kuMWIIDrw1fd9OwM
         bBRHJIb2i3mHFnPSxxypqSfti19jHzML4Mk8Quvj41Z8bewvyRnPL7mUWFAZDvtjkq+S
         r5iuVGu/Qt8DUFJWI6Molmxh9xf04Mlozt2V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086093; x=1781690893;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WUUXnXoVwER610lf7p4ZMCb43FIfromimGDMbNp4gI=;
        b=oev6cHIn6NkA1iKYBo0EhJ+3BGNTtJ2w0QU3SpQqCD/FEK7LjZ7fPX2jBirCb7GczK
         z6iS/KwdvnPpam+WH4d6YiK0KO1qMtXmJ+B+BrvQ+nlb4VZD1i3Hf65cpMq9DJq3cyVu
         UYGzPaAhWBofDLWqBF0HxphXPga5vZzOIujhEIhn2W6CtShhPh5BJhUVnghu6j0GFwZO
         LnrVWJ9Mz15RaZ1EwIiq6Mx8eCkESSTNm/+GsZegBZIkHIhFyVOVCnxs6/4DCO76ThSC
         lSpIQh9N+Q7++kQ2ZWwBqxAJMTkv8eiJ7qwFZW1DeX2Ynic4/+G/piYpFkKadMFa4w3c
         10qQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UEr+M6Ygm4t6K/D9UuMkzUE7iPwubm0BGhuj2CM3VdPnxjiAaEyvrs+6UZ614a63Lh6Ov@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxRe0yJxsxsWZkOKQ88gGCQkCu3SbEjNmI8nRHk3DayvlPdvFUK
	QwyXaVue8kiPG0mtFfQT0ntXBaEKH8O0RbxCnl3rGsStlcIV3xhQvMQGD5LW2sYrRfg=
X-Gm-Gg: Acq92OECd4w14WKoINepEBWkNqkWtt5Zg5fhUWOIlt3NZgV0GJkC8Cdff1Kj3zA+8M5
	VOa8457xYZla95eVWz6eQ348zB1WPJR2vWitDF9p1ITi5gRwAdz3nV6sZEsXgbkGFwhzNRW5GO5
	JQ3NPYWvvt76e6moWn4tHSvZNuarHRSxrOc+hoSug3jAgLKa5nyka09bUr25pJuSJ3Y60Pnjln6
	+O9iHscbpt9MsDgRIDwkdwvKy6C8AMpqr/sCiJudkJv/LLHrCnZTqCOtQOh7a2YiLubrmCN+gCI
	Rw3/6bmlA/faVegj56I2H8ThvSqk+YcS8pHDELKSAjkmNpyMHACOQczA6w8CM7iDyVqYbmwuYr3
	OoMgKHFOyCQyqPyOsfscbCO8vYeHp64pJOXmbtT1Q7dPFLovw148AEcTfwQ2lQaiNhcNMKQUBOi
	SGJsxPdUdxCYTVj/gMT770oxJQqL/uvav2isOLOM4ewTo1P3/Pywi7pZTGjC9VhUQIKje0tadQu
	BRQ61yqXiwYGt0RBJTf/1+aIkk=
X-Received: by 2002:a05:600c:45ce:b0:490:b35c:88ea with SMTP id 5b1f17b1804b1-490c25e74b7mr355694085e9.15.1781086091546;
        Wed, 10 Jun 2026 03:08:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm526604025e9.10.2026.06.10.03.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:08:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 12:08:10 +0200
Message-Id: <DJ5ABQHS3CCX.1HSTYR4LCU4YH@smile.fr>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <bitbake-devel@lists.openembedded.org>
Subject: Re: [PATCH] doc/bitbake-user-manual-ref-variables: document
 BB_CONSOLE_LOG's persistence
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260610-bb-console-log-persistent-v1-1-5430d24061c3@bootlin.com>
In-Reply-To: <20260610-bb-console-log-persistent-v1-1-5430d24061c3@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 10:08:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9677

On Wed Jun 10, 2026 at 10:28 AM CEST, Antonin Godard wrote:
> Changes to this variable only take effect after a server restart.
> Document this behavior.
>
> [YOCTO #15641]
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---

Looks good to me, thanks!

>  doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst | 10 +++++=
+++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rs=
t b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> index 9824b58ef27..f3e1a3a38c9 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
> @@ -135,6 +135,16 @@ overview of their function and contents.
>        Specifies the path to a log file into which BitBake's user interfa=
ce
>        writes output during the build.
> =20
> +      This variable's value remains persistent during the entire executi=
on of
> +      the BitBake server. Changes to this variable will only take effect
> +      after a server restart, which can be accomplished with the ``bitba=
ke
> +      --kill-server`` command.
> +
> +      .. note::
> +
> +         For more details on how to make the BitBake server persistent, =
see the
> +         :term:`BB_SERVER_TIMEOUT` variable.
> +
>     :term:`BB_CURRENTTASK`
>        Contains the name of the currently running task. The name does not
>        include the ``do_`` prefix.
>
> ---
> base-commit: c687d42b81b17e7a2399099cab0f1a6aafcf6520
> change-id: 20260610-bb-console-log-persistent-c91ce341f898


--=20
Yoann Congal
Smile ECS


