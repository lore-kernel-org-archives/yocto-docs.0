Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451CBCCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:43:08 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15686.1762436587151347326
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 05:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cCttfwoQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88051279e87so11527816d6.3
        for <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 05:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762436586; x=1763041386; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWjjtLYhgoe2r/AxoBn4YN6En2GI/CMMz7dehtBBZLY=;
        b=cCttfwoQYXrhUxcVhqL+dQs0F5oXlttyYQz7IJbgSD3sgisGuA4GjLASimseUW5jxt
         5VuK+X59/AVmwAfyk0DSmkv/LylVLncgb/tLWAlKUct+kplw/4174pLguSsgE1NSiyi0
         qPOlmUOBuJJrAnW7gcDfr+pH4/rvX71PT3vj7HVVpLJt0T2cEwAzQ3gCgtdjHg5njXCg
         XmF9MATK40IdGl9WB3yNXl0L+/TjlAVNGJmmnhd67Ht0aPzoIZPSEjYvQ5oqiz6EDSYl
         krr13H6Fcv0S93z8woXBjogki9WR3GCIjnCVWu7GDOIKNdozxAXLXMf76IuThX+BBPM3
         Oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436586; x=1763041386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWjjtLYhgoe2r/AxoBn4YN6En2GI/CMMz7dehtBBZLY=;
        b=JX2QJwlXQvFePMHsFDwalR81+pS8H6VjOmx2m0pwz7X6mdFYq+YtQIKwC4ZbATLRyr
         SYm1KAILNK8Ro4IdgL6yTT2Iz7n62hRdiA8yAGs9cTaBN9NbTAeQKxL3/Bo2alySFVWH
         wYbBEUEAlhhRRs7DI8VcaQRBr75x5M7FoEM90rhhPogwm0A+jjsrFOlm7Za38jzqjXOM
         DEu9Q381e/ZYHNSr+MtGWeNFIO7vawB/halziVWZwSHBPHqypKgqU6I61DpDzM8JWWk7
         eICzfbgyvUwbS04gSyFfmW2jFEVJJR+U6jr+drVWi0TEY9gI1Ulbkb+OBabzGLASLjdH
         evkw==
X-Forwarded-Encrypted: i=1; AJvYcCUVsjWrDPm8qi6PriYzG1vkh1pisY/6lb+vuD/gV1h5ZgN2paSqdpsl+ebwlpvM8apqJOmF@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwWxsu05CWXry/pFQtI8buYG6Wl+J56NfGVbERQnLzsd6Ld4Ygf
	0z8q3luOl7JMDby+T/8VUT0RY0bpDKLfrT2J8UbGyI8aEG99Bt3Cj6G8dKWiu6yzuMbC9oerFmZ
	bKupvhVJp488iLOOfW/2WF4Ph8LfPg2U=
X-Gm-Gg: ASbGncs0uiwKG8PtF4Yhxa0txB3v0tOZ1MxtBC+ULZpGcNN4h6RAIGh17PoT9j3MVOW
	WdPIyVULnwU0Xgie9XVQOFhshM93FmY02lLgYMLVS06N0oTPEtGZypA811gwHUs+3gwjEvFdcSt
	Fmt0Jh8jwXsDHMSHbLZmZ6LPr1l5NFcBRMrm1yC10XGFu5CF+bwcCZJTDTaxkxlYG4EmntZ8RS3
	44M7SWjTDpYAx4c8kYI20EGJUHIKah8gLsHG8mj3AQNpsBP8vdqOuGTKPKZ2vcva6nC8w772UfH
	Gc0zKCOmPN2xyGZh1eJcczaTbttpMA==
X-Google-Smtp-Source: AGHT+IEjopTxcEYT6IHbWR3GOfUuypW7gIwzKrOBmembVX9dSUNHjfsSu2B9dbSEUWxnpx2v5sCedqv5xgBx/DaUIfc=
X-Received: by 2002:a05:6214:f27:b0:880:52b8:2f9e with SMTP id
 6a1803df08f44-88071192619mr96194376d6.21.1762436586107; Thu, 06 Nov 2025
 05:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20251106-bitbake-setup-v2-0-2722ef759c35@bootlin.com> <20251106-bitbake-setup-v2-2-2722ef759c35@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v2-2-2722ef759c35@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 14:42:54 +0100
X-Gm-Features: AWmQ_blqi0tDYCIFtfkQXnYFzGZaiZ6QFZolztzp8ih7bba72rV6jx-qvPGw_Zc
Message-ID: <CANNYZj-v2AOqTdnA+KegBc9zC9TxEuJsM7d8vMEOsCr_wnT_zA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/2] Add bitbake-setup documentation
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 13:43:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8011

On Thu, 6 Nov 2025 at 10:23, Antonin Godard via lists.yoctoproject.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:

> +      :term:`Generic Configuration` files are stored in :term:`registrie=
s
> +      <Registry>`, and can be listed with the :ref:`ref-bbsetup-command-=
init`
> +      command.

'list' command, not 'init'.

> +The choices made during the bare ``bitbake-setup init`` command can also=
 be
> +passed directly on the command-line, for example::
> +
> +   bitbake-setup init poky-master poky distro/poky-tiny
> +
> +``bitbake-setup`` will stop and ask to make a choice if the above comman=
d does
> +not contain all of the required configurations to complete the sequence =
of
> +choices.

The first argument to 'init' specifies a generic configuration id in
the registry, or a path to the generic configuration file on local
disk, or a http URI which bitbake-setup will use to obtain the generic
configuration file.

(this probably isn't clear, but it's easy to bypass the registry when
the user already has a configuration file locally or on the internet,
and they want to use that file directly, for example if they want to
change something in the file and test that it works, or otherwise have
a workflow that doesn't involve a registry)

> +      ``{THISDIR}`` translates to the parent directory of the current
> +      :term:`Generic Configuration` file.
> +
> +      This is useful when (one or more) configuration files and (one or
> +      more) layers are hosted in the same Git repository, which is clone=
d
> +      and managed independently from bitbake-setup workflows. For exampl=
e::
> +
> +         =E2=94=9C=E2=94=80=E2=94=80 meta-myproject/
> +         =E2=94=94=E2=94=80=E2=94=80 myproject.conf.json

Once THISDIR is replaced one way or another, this should be updated.

Other than that, I'm very happy with this! Thanks!

Alex

