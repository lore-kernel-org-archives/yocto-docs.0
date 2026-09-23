Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469D2C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:11:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1561.1790179866860253955
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V6ouu1C5;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so9513205e9.3
        for <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790179865; x=1790784665; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WmaeTOaK+85TyCVB8527ubTpv/qUY7QOHSurAMdlfOg=;
        b=V6ouu1C5W+j5cIPaBK6LnHmzwYbtvgllNzv0zY1yE4xrmZiV4BdRvaB4fk1/iFU4iX
         yyR7pXV7lNIUiYBsERZrJGfpK75HU2aEcxVpkWFWTfgvozpK6TadP4nZjymlj2PH18F+
         MIELAiaCwDQLkn7PoRRBIxWc7x/q/GO58SviI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179865; x=1790784665;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmaeTOaK+85TyCVB8527ubTpv/qUY7QOHSurAMdlfOg=;
        b=hXQVx0gBzKoiOdNcftAN0BCXFc8UEaq1AShdolThGmrmwIUiBoFluvRVd4wiuF/PKS
         nlPOv1kol/CV52IQ/N+5qW63sokurwYc0sLyNvVRgFCmy6+gG2BlcGTBfHzVlyjdpEZP
         wY1iWu6k4c/GXW37nPOOU011ZQc494p9RXxCpfCzXN2ee43KiUsNeFYcOEs6y2QlKSyN
         55V+gzKVNERE91jHK0kVTqYoGFOvXcGA7Mc3yg3dWLsxrcMxUFiS9M+DxTaAuVG8sMoZ
         H/L8R4rTZVe5rBKJGtWWbXAvqt5cVun4f/+xpKI8Q5TJ1RhVbJNxAtPyCu7S2XV/ajJz
         A8iA==
X-Gm-Message-State: AFuF++n2GNYbVOTnlL2uLKY5QP6GAb5Iozlh2XPTxQ/YllTo5kSflpUw
	rjYpeKHIoXcJ+u/IYaBCNxVJpfL1UnuDEmedpLboCdUaCSsLzhZhpXkUycWWpHl/xXU=
X-Gm-Gg: AYBFou05ukov0BoHauArHRcYVDRJ3ol/6FNLPu359YiC8B0pZq31SCg5dJpM/MtEPaU
	DkrN1BZtOw3h0R1OQ3bzBkaJJsPADpNfhgDd7q+QtvLKyOrCT9ObEvNZH/0Zz6mJpDMYcfnULo7
	fnkjTeKeh1WYEUs/mKrL3WarZ1wNULsvaqR/qgT8LmNm0FttErx4PgfkhO2itym5okwOCqjdRUc
	Qs8jjVT9QDPY3t5WUmSvkl86B/f4pFhZE9FPCrXIvP3iHPCfC82Jdh34paFU9QILAIAO26KdrzH
	05jPj3q16bMJqnTjaZMpNB6Qi6rK3t3blO+RlTyso5CEq55KekEdLWuhPPdoQrpGOTnMG3A0Hpk
	BvDuHBOdf4Z7y0v/4aXsetg6QZucgEuAiEFNSiSC+Nfj9aiKiazHdvz8IfbIBQC19kB5ugMSb/4
	IV9lc89Q7mNTPxDY0qXbnbabByAvwFu+/3OX3ko5dxzufA0EBOiiIJiUv/8/8M3sZOVIR75pPcx
	6YxlHHbfFSa6jUccXLOj4DYvksFxXXtR6eGNIHC8RHw9aDNgL0dsr2hhjETwUE=
X-Received: by 2002:a05:600c:4f16:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49fe5946e2cmr2594715e9.7.1790179864828;
        Wed, 23 Sep 2026 09:11:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:36fd:f492:2703:247a? ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm8153856f8f.34.2026.09.23.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:11:04 -0700 (PDT)
Message-ID: <a93729d70f21488844f69b17d34eb6b57faef7d6.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3 0/5] bitbake: Add basic landlock support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: david.nystrom@est.tech, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mattias.jernberg@axis.com, peter.kjellerstedt@axis.com
Date: Wed, 23 Sep 2026 17:11:03 +0100
In-Reply-To: <20260914-landlock_try2-v3-0-4ea504789675@est.tech>
References: <20260914-landlock_try2-v3-0-4ea504789675@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10610

On Mon, 2026-09-14 at 20:42 +0200, David Nystr=C3=B6m via lists.yoctoprojec=
t.org wrote:
> When current implementation runs in an unprivileged docker container,
> basic networking will be allowed by default in all steps, ignoring the
> network varflags intention.
> Introduce support for landlock blocking of bind and connect, providing
> basic support for blocking TCP.
> UDP is corrently beeing worked on upstream, but not yet supported.
>=20
> Landlock requires PR_SET_NO_NEW_PRIVS for unpriv usage,=20
> which is also attempted. devshell and related are already tagged=20
> with network varflag and can sudo at will.
>=20
> This changes the default task behaviour to set no_new_privs, and=20
> the 'network' varflag to exclude no_new_privs, which is needed
> in a few places, like do_testimage.
>=20
> syscall ABI is asm-generic, 6.7+ for all archs except alpha.
> On alpha, we leak 2 fd:s in the childs context before graceful exit,
> which is cleaned up at child termination.
> x32, MIPS(except LoongSoon) will fail gracefully.
> Don't have an alpha target, so this is not tested, evaluated via=20
> static analysis only.
>=20
> Adding Bruce to CC, due to fusermount usage in vrunner.
> There might be fallout in other sublayers as well,=20
> give me a CC and I'll try to help out.
>=20
> Adding Peter and Mattias for awareness, since they seem to be=20
> users of enable_loopback_networking

We discussed this in the review call and decided to take the first
patches but not to add in the varflag. We'll see if anyone reports
issues with that and keep the option of the varflag in mind if anyone
does. We suspect most can probably just use the network flag and
keeping the code simpler is always preferred if we can.

Thanks again for the patches.

Cheers,

Richard

