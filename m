Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69935CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:04:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72173.1778580288896687630
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 03:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qMuiS1RL;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3288585f8f.2
        for <docs@lists.yoctoproject.org>; Tue, 12 May 2026 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778580287; x=1779185087; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRrynxWgZ1c8qInK3RlSvwgKxARstCcZRcJRfq4tsZk=;
        b=qMuiS1RLw45v8fn4QgPnRYpdksNuswHis0uSKEpzVXY/KWvvcUUYLP3e3WdWTCDF9m
         rNDP/dNZTwJN7V9b5y4sJFSOU6igksj59lfSGkoanXuERiTqLwf7EjVBMw7Fdx182afq
         gPLY28C0nQstSqxXYuDl8kQtKYPgIJIgT0VcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580287; x=1779185087;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRrynxWgZ1c8qInK3RlSvwgKxARstCcZRcJRfq4tsZk=;
        b=I8aW2N+5TSmzHsBbVBQ+Vw56zu/GwNYt4j7L2J3ga3b6MR6x7f3P5JG3aj/pR/vWjy
         /DmtlEGKLAeg92uW2P0JG8WhLRTP6gaBrRbI0oSL93rLLo/ul8ery3zQVRloTULL92rP
         DAolisno7+lhRdxpVbFWyi98sL5k8qIoFS7f0puoAVxIft4nlUfJkK4hUltMAfreHQym
         zgyoyg4XteKx0u7cGesaoszudh1WwQEqnk79HNaYwM54kk8rzT8YFsxBjJVDaqc3Oynd
         GWvJeMkGFWjCLCXdOyl83JdT8xRxfhJxV5X221OY+Jmd0GMjuhLikkG8m+zSgVSSdqCx
         l4Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/aYyZMyF1AV22gBgoz9F2f6nEYmbVBLrohoKyYrTr4Cr504FpyOnk+WAH//O9CzILmiozS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwHSWUa4x3OciroQ9hcaky0Hkw2oQJ5jkN34sQMSriCOHCYwBfb
	ZADEnFNtg4sCNVd887BaK29dejQnk1XkjILjoG3EUklhSHkdre3XDWtVCTOmy8HEaiH3LSnyjlj
	8UZA8OOs=
X-Gm-Gg: Acq92OFx82LZKqQAzrDTG3XKKj0V4teAAf4Lk3XaEhhv6ufOlnIL4dCp+RUCsdfxbTI
	Y9p2JhciOUjLWf8O4RzIYPgl2UqwBPgD5tVhECS7xUWBabmO4VeL4tnupaMAmBfsTUt84ss1VRV
	xfAMz9isHxjgAVWF7dV0c1Q8Li/OtWfDm43tv3W8COXzAX6Ig2RsJ6aw6u6DHUk/iiwMzHfL9jw
	SYj/mvpsiV6evxhKVdbI98EECEWhTx3kQiE+EmGjnPRZr3rT+DA966KUHOj3+NpWTFNAG9o1KGK
	LnaWLFIO9OJUDMvQViHmKnPW1/finSY6ZZlfYJXcKZIyFTkMhHUk+QnufdC3SKS/eejmVS6+Kqr
	1VnBgi06jhb1QhEJVf2CwcJPXjKixnSqsxCr6SL1Im7CpduyOsMowht3GNeLD0uFy3R86jIdH6d
	CtE29+OI1ahGBflO8W2ni525hhvSZelj1tVwh+q8KjNFg0W2UuPecvRsrnsAP6lym7zRNrPwGK4
	6qFYxitWjqyVYExA5Tr4cr+HQ==
X-Received: by 2002:a05:600c:c0cf:b0:48e:6275:27e1 with SMTP id 5b1f17b1804b1-48e8fe853ccmr28172405e9.26.1778580287050;
        Tue, 12 May 2026 03:04:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm35356035e9.12.2026.05.12.03.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:04:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 12:04:46 +0200
Message-Id: <DIGM3BSE8WEK.2Z9C44JXC4GR@smile.fr>
Subject: Re: [docs] [PATCH] ref-manual/variables: document the 'dynamic
 layer' concept
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mw.choi@telica.co.kr>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <20260511093446.2350-1-mw.choi@telica.co.kr>
In-Reply-To: <20260511093446.2350-1-mw.choi@telica.co.kr>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 10:04:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9459

On Mon May 11, 2026 at 11:34 AM CEST, =EC=B5=9C=EB=AF=BC=EC=9A=B0 via lists=
.yoctoproject.org wrote:
> Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>

This fixes the bug #15713 =E2=80=93 Document the "dynamic layer" concept
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15713

Can you add "[YOCTO #15713]" in your commit message?

Thanks!

> ---
>  documentation/ref-manual/variables.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a8cbb87cf..755929947 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -841,8 +841,9 @@ system and gives an overview of their function and co=
ntents.
>        previous link.
> =20
>     :term:`BBFILES_DYNAMIC`
> -      Activates content when identified layers are present. You identify
> -      the layers by the collections that the layers define.
> +      Activates content when identified layers are present. This mechani=
sm
> +      is commonly referred to as "dynamic layers". You identify the laye=
rs
> +      by the collections that the layers define.
> =20
>        Use the :term:`BBFILES_DYNAMIC` variable to avoid ``.bbappend`` fi=
les
>        whose corresponding ``.bb`` file is in a layer that attempts to


--=20
Yoann Congal
Smile ECS


