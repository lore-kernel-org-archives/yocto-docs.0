Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12881C4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 12:06:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.184261.1698753988154636025
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 05:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cg93S9jX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40839807e82so33211965e9.0
        for <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698753986; x=1699358786; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSkqp5nJDCuq4+9WtF9BRuMLRfb8tK65QucDgufrOhU=;
        b=Cg93S9jXa9z0oh3tosyDgFwyofF4rxVG5CMeAR2iPTk0k1AIS8AxxWBlh1maBLeEZT
         /eqsaLEJl3ag78Z0P2FAH2Ge7zPdja5129E28fqcxEQ8yE69mz9zJPYY3BFDIzgS29VZ
         cS3xZDuQp0/NIKHmYlgmmmkNuq2oO6p8+ZeA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698753986; x=1699358786;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSkqp5nJDCuq4+9WtF9BRuMLRfb8tK65QucDgufrOhU=;
        b=kxhs2LRtAERL1/T+2UFwjW4OlZyNqFj++TWFOckWeaxzU9vjRbmWJ63rbMpLQHIcZK
         6Hj/wVR/7I++QALSt3feIjYHdMzXVQZz/oZZLdJYWQ6/BmoPFbL2I7rrRx3JISyGe4td
         RlvmR+oukUUAFuiQ81KxtXhwTAl4b1U0rBBKpm8YFVgXNH8XeQcX8UxOf86oa5qbILaE
         NHZ0F4+scYEndI01Wg/2/V7YQNMKAACExD1PdSP19Nmhmpf/0EZ0/gNMjx9TAuv5/fof
         2d/378SWV0NJA+edu4IVUVpFXgk2Q3ONuKnrcHzICxMSXuTiIq6HyTmgNEVY+uxVpzMX
         JCeA==
X-Gm-Message-State: AOJu0YwaCKxcfUIxFCZAT1PIuOVF4Hc0qK0qN9/3VBABS7XQibQlWKmp
	HHw6iLZMV68WylF4Ijz+GsfQ3Q==
X-Google-Smtp-Source: AGHT+IG4eBHoqDIbhzcSpnFXEYBFMF0raBBkvYvIGW1u19JXyIoCvgordva3KSUm5vQOLRpvOVIKhw==
X-Received: by 2002:a05:600c:3d05:b0:403:aced:f7f4 with SMTP id bh5-20020a05600c3d0500b00403acedf7f4mr2700267wmb.12.1698753986456;
        Tue, 31 Oct 2023 05:06:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9850:4974:d357:58d5? ([2001:8b0:aba:5f3c:9850:4974:d357:58d5])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d4b91000000b0032dba85ea1bsm1378118wrt.75.2023.10.31.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 05:06:26 -0700 (PDT)
Message-ID: <ba52405bc4c9fe7016c4de37c387a5832303e8a3.camel@linuxfoundation.org>
Subject: Re: [nanbield] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 31 Oct 2023 12:06:25 +0000
In-Reply-To: <808560ba-78f0-42b2-be6c-86531902bc51@bootlin.com>
References: <808560ba-78f0-42b2-be6c-86531902bc51@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 12:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4539

Hi Michael,

Would it make sense to update nanbield to master? Is there anything
there which shouldn't be in nanbield?

Cheers,

Richard

On Tue, 2023-10-31 at 10:16 +0100, Michael Opdenacker wrote:
> Hi Richard,
>=20
> The following changes since commit 65b62118da6f355e56c489c6be08ba9ea94b9f=
04:
>=20
>  =C2=A0 ref-manual: variables: add example for SYSROOT_DIRS variable=20
> (2023-10-20 15:19:18 +0200)
>=20
> are available in the Git repository at:
>=20
>  =C2=A0 git://git.yoctoproject.org/yocto-docs master
>=20
> for you to fetch changes up to 8109eeb5b7a4e5b2f50047e049ce0295bdc94856:
>=20
>  =C2=A0 ref-manual: document MESON_TARGET (2023-10-30 10:56:25 +0100)
>=20
> ----------------------------------------------------------------
> Eero Aaltonen (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: add systemd-resolved to distr=
o features
>=20
> Marta Rybczynska (1):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-manual: add security team processes
>=20
> Michael Opdenacker (10):
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manuals: correct "yocto-linux" by "linux-=
yocto"
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test-manual: reproducible-builds: stop me=
ntioning LTO bug
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: document KERNEL_LOCALVERSION
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: variables: document OEQA_REPR=
ODUCIBLE_TEST_PACKAGE
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migration-guides: updates for 4.3
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migration-guides: mention runqemu change =
in serial port management
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: document KERNEL_STRIP
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migration-guides: further updates for 4.3
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manuals: improve description of CVE_STATU=
S and CVE_STATUS_GROUPS
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref-manual: document MESON_TARGET
>=20


