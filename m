Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3792BFF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 20:42:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2359.1777408951857994628
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 13:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IMj/T7Rx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d64313c39so9134633f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 28 Apr 2026 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777408950; x=1778013750; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=41iT33yuRbRwNCbmIjZi1iraRNAE8Qm9DtCGAn8WCXs=;
        b=IMj/T7RxrQf/clmLZOaRnHAXKaeD9V1vvDvgLsnPGVYH6ABPNBQ979PMzAl/y4NcrB
         OErOiMNP3tr6Be/gzbiIMxYNuHDC6b9wGcUnbzBJi6y1AGHsqWHJ1VZHGhEEgFPnlCz6
         mKQR/m/xWeAY1NzRlQPUwTmkwoVnoFk9TUSf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408950; x=1778013750;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41iT33yuRbRwNCbmIjZi1iraRNAE8Qm9DtCGAn8WCXs=;
        b=AX5cXoX1OPvL7cDsuVznfdVOq6qfC1gk9MKOFZ9F7FoiC/mCav9vzjFnWWrwitQKw4
         sGwI31kpKVTAEnh5Seh1bwDCcuWBIqtBu0+RfFIRXAAU/52e2CrfO2zAONQ4EBORd5DC
         AiZIVN1uXwQsM42Dbl2MltF6U5mdLDlqTlpY5q0jBUmIJzZwyiBemdQbjFbI+EkNzy8f
         gxvCCGLIq5fMtDD0ZrIyBCTE+j5txQbrxyfKJ43lULaHGWPpg6SSLhQeRhwUtLaNtmSL
         gpS5y2aTBbudgFggpaqxtJwrHt1AGGLlllm2R/quW/SOpy4PetWSQruwa1yvFgskSCKJ
         xBwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QrCloIc/iMBtkGltBz/nKvZLacQhr+Sl1b35GgY3cYCfrd6e4qi1y59BNvtAapfW0gHF0@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzqBRkNxS+LZqcUcqRKRT4jN0CeL8JnGd9CJkl8Hfb/LvQyabCI
	pcGGmgCgX9lB21VpdatGS9GYVm/rkvF19CvNJHxl5gFL09BSeqUTvfyztQyPTbcKNUE=
X-Gm-Gg: AeBDieunFNs+yUU5MwyiMUARPJLOxCYT9amsnigS7/is8SYF/Cy4dw7n5neLemzK5ZP
	dkpIiPwhUGtqGy7Zsct/9hSeofnNsAP9B7NhrbH4KKUFaI4mOEpa11pupY1tY65iHgXukPHu2Yk
	IEwtnby+g5UnkK6VMGym78CfP4UgCdL2voCq4Xia7/SWqXNW8WwVAGQOWFVkolS+m3+SrIyrtT+
	EObJeYATSTmqVWrXIWp0aXQBa0j5QAKsHkqZsKii6xgBMb2IILMJn+iq4kaCXTia0EQ/8EajNiJ
	CmP4fvul+375flH9/tAPNACHqFxrQIX8aN6BODYEDZUiJuEh6Mw8pT8dyCOYIYmvqEejbJ0iXdt
	t7SIALcDdZBF8pSL1vl/GYEace9XuC9/ljAW9RVKEEYU4HMM5pPkjJW/zr/au7XQq5BNbuC+saW
	KP13tWMC0QMSBNiVWWGKcEPcmXIwnia5WH2q2paeNBRRw2/QYdmRpoQl7GwBpYWXiQF2WHm2Yd2
	7rG/sDp+2SJJdR0rs96KA7RucIf5z48rMo=
X-Received: by 2002:a05:6000:1789:b0:43b:8f4e:27f8 with SMTP id ffacd0b85a97d-4478ea89df3mr1559466f8f.12.1777408949747;
        Tue, 28 Apr 2026 13:42:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:549b:62f6:707:b10a? ([2001:8b0:aba:5f3c:549b:62f6:707:b10a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm474393f8f.7.2026.04.28.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:42:29 -0700 (PDT)
Message-ID: <eeab5758b01722f5474855d21f718ea2d5cabff8.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/1] doc:
 bitbake-user-manual-metadata: fix inherit_defer documentation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bijak.dawid@gmail.com, Quentin Schulz <quentin.schulz@cherry.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Tue, 28 Apr 2026 21:42:28 +0100
In-Reply-To: <ljbjkwt32h72aziah2gepb6k5rfxygfrhkfysmulj5scnca5pu@o4vikz4hfmh3>
References: <20260424062327.820993-1-bijak.dawid@gmail.com>
	 <20260424062327.820993-2-bijak.dawid@gmail.com>
	 <c25e0e9a-8809-4ac6-90ee-3687972e03af@cherry.de>
	 <ljbjkwt32h72aziah2gepb6k5rfxygfrhkfysmulj5scnca5pu@o4vikz4hfmh3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Apr 2026 20:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9379

On Mon, 2026-04-27 at 20:14 +0200, Dawid Bijak via lists.openembedded.org w=
rote:
> On Mon, Apr 27, 2026 at 02:35:45PM +0200, Quentin Schulz wrote:
> > Hi Dawid,
> >=20
> > On 4/24/26 8:23 AM, Dawid Bijak via lists.yoctoproject.org wrote:
> > > [You don't often get email from bijak.dawid=3Dgmail.com@lists.yoctopr=
oject.org. Learn why this is important at https://aka.ms/LearnAboutSenderId=
entification=C2=A0]
> > >=20
> > > The documentation for inherit_defer contained the claim
> > >=20
> > > "If VARNAME is going to be set, it needs to be set before the
> > > inherit_defer statement is parsed"
> > >=20
> > > which is incorrect and contradicts the purpose of inherit_defer.
> > > The wrong claim is replaced with an example which demonstrates
> > > the contrast between a plain defer statement and the inherit_defer
> > > statement by using an override assignment placed after inherit_defer
> > >=20
> > > Additionally the inline python expression examples have been
> > > moved from the inherit_defer section up to the inherit section, since
> > > they apply to both directives
> > >=20
> >=20
> > I'm pretty sure the whole inherit_defer thing started because an inline
> > Python expression didn't work. I vaguely remember a bbappend either add=
ing
> > this new inherit based on PACKAGECONFIG containing a value, or having t=
he
> > main recipe with this inherit <PACKAGECONFIG.contains> and a bbappend m=
odify
> > PACKAGECONFIG. See commit 5c2e840eafeb ("ast/BBHandler: Add inherit_def=
er
> > support") in BitBake.
> >=20
> > So I'm very skeptical this is correct.
>=20
> Hi Quentin,
> Thanks for your response.
> I'm afraid I don't quite follow your point about PACKAGECONFIG.contains.
> I'm not sure what you're referring to exactly.
> But, as far as I can tell, the inherit statement works fine with inline p=
ython expressions.=20
> I think, it evaluates the expression in place, much like :=3D would.
>=20
> For example, on current master I tried the following:
> =C2=A0COND =3D ""
> =C2=A0COND:append =3D " x"
> =C2=A0inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
> This inherits foo.=20
>=20
> However, if I move the :append below the inherit directive:
> =C2=A0COND =3D ""
> =C2=A0inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
> =C2=A0COND:append =3D " x"
> it inherits bar.

It works, as long as you are sure that COND won't be changed after the
inherit. When mutliple files altering the variables are involved, that
is often unclear. I think the doc's intent is therefore to recommend
anything with variable accesses is therefore deferred, unless the user
is sure they know what they're doing.

Cheers,

Richard






