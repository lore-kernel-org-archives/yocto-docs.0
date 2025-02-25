Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B434CC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:22:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.891.1740522118265548592
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 14:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FxqUjWyi;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f3913569fso146872f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522116; x=1741126916; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XdXNpCkqKw231oAon/iYyYwoV9tbOEqMBdWOkIzSzzI=;
        b=FxqUjWyiuLJ25csjPIwnfhO6uF5VJQE4gt8ArmSr+E4FyjHW1oY0j8xfJUFZMM5w/e
         9uWthIeSv9luDIT/16mBauiRXWOD9w79PkemR2e0Mqbu+mDhnp5IaDKet7K/fsKmb1Yh
         9knQwcj4Qkuqp8fAUY/Oy8D38Ri8k74VBkflFq5jYbhLp6ndpMyrDMsyk0fzTc8jbnPh
         KlhEit62KHBHH7PZjzEcrpYOX1kZ9SqhhSt01cryq6Udz1Y7r1hmhWp3zxByGHFmFfjj
         xO2q0FGp++kdZyJq1kW5XjJUfPYGALXJc7f7WKfoQMHa8je37PIo3mpQYJ7rTY7X8DLT
         oWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522116; x=1741126916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdXNpCkqKw231oAon/iYyYwoV9tbOEqMBdWOkIzSzzI=;
        b=EmTqCaDWXsbXG0wiud5Qt/mORIAX3vFq8pRvxnO+3T7jr4zUNZHi6/B+XhjI8Axo4+
         B5XFTDbiNmap61MIP8oMIKcmBRRSD8UIQ4lp2TwKcwr+6MC3fD+28lbmVK3ilsl4PJgF
         yBxx9sq91UW1tgm6A+X4t179dxgItx4RaXplRraTNNXw7eTILTw0snhlu2xuSURkK6TP
         7efXZJdlDrYyU69whyO3cfNa1xwiUwCYnG8lomxxJmXIonbHp/nZvKowX7/ZewP52Lrq
         C/g5enu/LyPpDYy2tvJ68BCBYS+yV6sfqrnTBl+Qt10GESvqGq0+83TCVavKkOABjmFS
         bQRg==
X-Forwarded-Encrypted: i=1; AJvYcCUIW6wp3Pb+9LIU8zkDvgQrGu8cEGCZlioFn6gHA6j5jUD1X4vT261R+djq4rCiw+YLPOnf@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YycIk34lOUHYacZ715qB1v0GnsTvKxUsO387B8k7vbB5vNz1hck
	si4vGv+Z0Mra9odK08Ps/ZpfmADaNkMJOcbfz2GFL1G3eRpfhwFd
X-Gm-Gg: ASbGnct3DM7e9+yHHTTrzAPiSShtuZj2oJ7WS1Qx9k9Npgb2Ds30h1tNeFaUf3agJAi
	HXJtg01lLaybnMAqsjbYnKNuEN0zzBTgBiyS//h7nNyj5hG5JsJu6rMfsWFPuDG5Vilre4+icLt
	auWqkiwwNBMQ4j7z4ySA4mKUYn4uKYpzgaGb21PNOer99xeK9nmgha3j4q9V1rSXNZqnoptNzGr
	z5Ax23zUksgmsFEjHxQNZHFQNO6Sys96pTe2aPDBGpjOT/S1lEP/ckOREFdx8r4wcORNw/89+3i
	1KfELpPr3vrPutpcLvSs/sJZLp+9kB4k4TmI10oV6ne3DTjF4uPCvzLGEY/PFnjhNq3NLfbMl5c
	=
X-Google-Smtp-Source: AGHT+IH5xNZ6hv1/y3yyLjzgvsOCMm6giIxUCswNrf0ejGQQHUVfkV9a0w6UpvoMp5hxYCU4T5Xgdg==
X-Received: by 2002:a5d:47c3:0:b0:38d:d59c:c9d6 with SMTP id ffacd0b85a97d-38f61611400mr20070234f8f.21.1740522116469;
        Tue, 25 Feb 2025 14:21:56 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fcfc6sm3663036f8f.94.2025.02.25.14.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:21:55 -0800 (PST)
Message-ID: <0f3f57c6b4da915afadad816529c40390d0de1f5.camel@gmail.com>
Subject: Re: [docs] [PATCH v3] ref-manual: cover UBOOT_ENV variables
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Tue, 25 Feb 2025 23:21:55 +0100
In-Reply-To: <e919d911-0930-42c0-aa89-40f668b26fed@cherry.de>
References: <20250224221630.3331182-1-adrian.freihofer@siemens.com>
	 <e919d911-0930-42c0-aa89-40f668b26fed@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 22:22:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6455

Hi Quentin

Thank you for the re-view. I fixed all the findings with v4.

Just a comment about that section which is also changed acc. your
suggestion now.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV =3D "boot"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV_SUFFIX =3D "scr"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SRC=
_URI +=3D
> > "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> > +
>=20
> Isn't that UBOOT_ENV_SRC directly? I think it'd make sense to use=20
> variables made specifically for that instead of replacing it with its
> content. Best practice and all :)

Yes, it is. But not sure if referring to more variables is helpful from
a user's perspective. Technically it does not matter how the SRC_URI
gets defined.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Adding a script ``uEnv.txt`` as=
 a plain text file to
> > ``/boot``::
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV =3D "uEnv"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBO=
OT_ENV_SUFFIX =3D "txt"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SRC=
_URI +=3D "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
>=20
> Isn't that UBOOT_ENV_BINARY directly? I think it'd make sense to use=20
> variables made specifically for that instead of replacing it with its
> content. Best practice and all :)

Yes, it is. Here it's even more confusing, because having a variable
named ..BINARY referring to a txt file looks odd to me.

But lets follow the best practice, it's fine for me.

Adrian

