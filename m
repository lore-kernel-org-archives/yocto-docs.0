Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D2ACFD63E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:57:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6344.1767794266703363559
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ksj2tOOk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so1143287f8f.0
        for <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767794265; x=1768399065; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SUN+PjJ0QBx6LDFGyIjIzaoW+Qjf5OA4pGDxULUNZ8=;
        b=Ksj2tOOkQAnTqJlODcMYr0Oj+qzZ+eUoDxKk3UGnJ0J+vAFZq3PmYW0c1omv4GTncP
         Y/8TvD+X54Jz66xexhgn0KcuBMeSp53QRL/b7tpw1ui9O4EzgYsZkoadDDk6VVnEV6uh
         +CJ1w9xeJ18H1mMzdRQZSsx88y0PhFhFM9LVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794265; x=1768399065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SUN+PjJ0QBx6LDFGyIjIzaoW+Qjf5OA4pGDxULUNZ8=;
        b=QQmAupovPrv857WaSxcxWThDMUkSp3qFejNqS+7Lvj1K7Py9nWoXyvydjgX6Edhzw3
         h47yM0HVwbYImnGNIC0XKMjrA4XxHfSBl08AiL6kxF6wn31JNIgkc+q112ClRxLv8j5m
         noANEeK0SqQrUvakJs7BCIYSClh42ef1/XS5Tyhz5OhCXifkH92MmmvrUr19t7qt+h6g
         +KAHPavL5U218OB21JVhbK+M2z6z5SmF2jZ8tkYCH22a7wYJWqqi59iBY6xgrV/ZQ1DC
         oskrHLy0sDt+4y4XxY+gvXSeFCcHFSoGgLibD08XOQazdIbYTN1CTleZ+ShoXwPmEBwt
         qmiw==
X-Forwarded-Encrypted: i=1; AJvYcCWVeJIqwu1XLNLDHICCOxMxXY0I4SPY0w9gAy9j9J/PqfGv96WzVV1I1DV3kNOBSGMHKXNy@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzasVvajCFyyEMxv1P01OFKsax1SS4DNGpyAVqFdtu9cluPq6B7
	41a91ks1GrdK2xcaIguUEAjsp+hufwhl85drIYPvtSbHVFOh/wt4D6THcZf1K4yGt/4=
X-Gm-Gg: AY/fxX7AKjL8nnihA3lqJ3UXexNNOz4+WjnMwcRhcMT+7E1npOk+O3RKw8j7W1KdAKA
	PhSlC3WBBgaEZZdJ6Ja+LYHQPMYArg3qT2sGETpYifmAIvw848BQ/mN4+HisTL7prkXT3PkH5zK
	OcPhncj73ZiSQzWDkLhcZbh05J1UXJ/lG60rGDsEtmUQnCBMmBSkZ/+CLvGZ7uahzCnLDIjSUHR
	L+U2/PuCRgl1j83WEe4ziToUQ0bMxQAAkwtn2bhgpcERXCxlg4RwZneJ+JZ9G2YaT9/H9L+afVs
	JOW0fhNXfBIs4X9nbAFgpz+nlp1V4PuHX5gRqSyEXJsMNJcFlXrd/QOZ9kW784SFLZhSgyAptc8
	jvLDjJYErXOsMnQWQI45gSXE9NV07EKPNY4RvL5PfGPuE5Ex/hl2mWfmb3j1mt2B+kAnLI5xnjM
	gP/nbZTdBAvDltQu2Im0eUxORHkm69lyVQUUC8h7ACfEicCri3yiRuQSqcYdBnrO2uqDoq7vPJ
X-Google-Smtp-Source: AGHT+IFQt3GdUS3PZrA3qjLox34RvvUKcwTsie6JkEAkujAB7BNI69uZw1MJWhba3Jzq1i7oyIWn1w==
X-Received: by 2002:a05:6000:290b:b0:42f:9f18:8f59 with SMTP id ffacd0b85a97d-432c376333emr3622263f8f.42.1767794264973;
        Wed, 07 Jan 2026 05:57:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:97d2:bd66:800:7506? ([2001:8b0:aba:5f3c:97d2:bd66:800:7506])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm10310441f8f.28.2026.01.07.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:57:44 -0800 (PST)
Message-ID: <0be22f164e9db91a166e72ed568717fb2045c304.camel@linuxfoundation.org>
Subject: Re: [docs] is a wildcarded bbappend file name valid without a "_"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, rpjday@crashcourse.ca, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 07 Jan 2026 13:57:43 +0000
In-Reply-To: <54ce5cd2-5ef1-4094-b299-b218aca71567@cherry.de>
References: <0a95bb97-ef68-5bb2-c4f6-319fc8f62e06@crashcourse.ca>
	 <54ce5cd2-5ef1-4094-b299-b218aca71567@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:57:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8407

On Wed, 2026-01-07 at 14:40 +0100, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi Robert,
>=20
> On 1/7/26 1:51 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >=20
> > =C2=A0=C2=A0 wasn't sure where to ask this but since i read it in the b=
itbake
> > manual, i figured, let's ask docs.
> >=20
> > =C2=A0=C2=A0 regarding using wildcarding in bbappend file names, the bi=
tbake
> > manual insists:
> >=20
> > "In the most general case, you could name the append file something as
> > simple as busybox_%.bbappend to be entirely version independent."
> >=20
> > =C2=A0=C2=A0 ok, fair enough, that appears to imply that even in the mo=
st general
> > form of wildcarding, you would have the underscore just before the "%"
> > wildcard character.
> >=20
> > =C2=A0=C2=A0 but i've seen a number of examples where even the undersco=
re is
> > omitted, such as in this search under the meta-security layer, where
> > the final line shows that the underscore is missing from the filename:
> >=20
> > $ find . -name "linux-yocto*bbappend"
> > ./recipes-kernel/linux/linux-yocto-rt_%.bbappend
> > ./recipes-kernel/linux/linux-yocto_%.bbappend
> > ./meta-tpm/recipes-kernel/linux/linux-yocto-rt_%.bbappend
> > ./meta-tpm/recipes-kernel/linux/linux-yocto_%.bbappend
> > ./meta-integrity/recipes-kernel/linux/linux-yocto%.bbappend
> > $
> >=20
> > =C2=A0=C2=A0 so this is clearly legal. should it be mentioned as being =
legal? or
>=20
> It's been used for a while (had this in meta-rockchip for years for=20
> u-boot, but that was not what we were supposed to do), so I would be for=
=20
> documenting it.
>=20
> I would add a note about really thinking twice before doing this because=
=20
> it can match more than one thinks and impact third party layers which
> asked for nothing. E.g. the u-boot%.bbappend we used to have in=20
> meta-rockchip used to modify my u-boot-cherry-es recipe if I remember
> correctly, which is typically not something you want to do. In the=20
> example above, linux-yocto% is probably safe enough as I am not sure=20
> people would name their own kernel recipe linux-yocto-something. But=20
> linux% would be a no-no in my book.

Right, the _ is highly recommended as an anchor but you don't have to
do that. So it isn't "the most general case" as that could be
"a%.bbappend" or something but we don't really want to encourage it.

Cheers,

Richard


