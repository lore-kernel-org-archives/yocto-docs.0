Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB22CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:41:36 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.5044.1761165690080623565
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 13:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Odd+u9JK;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e330a1360so36622d50.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761165689; x=1761770489; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMz4MjWmEjo8MCVFCQmb3m8xWWVoRp7Aa5V83Qc6Zy8=;
        b=Odd+u9JKmqa2+nWZ5v8M+egXrQ3zCafoibiYr5KXfKnfMgH+NYoRVKOyRKhr0pEizU
         DgTkCkF617pGQWY446EuG9Lp/RGamDX7DaFYd4QYUvyi88KhMoJh7wHq7yTrE5NlEkL5
         bsjTdK96oVMNAMseB1FRiQ80eMOqurLsJnE3lf8y/DQD8qYf6cqnpErAhCuqqNZW2Nly
         libxUKXcYpZ5SyZmJFb2RB3iV5IBWfx1/nI1Ay0ALJnlJH59mHXhEyeU/hQ3G1ATCGie
         VW6EswoW/D6yyCPLwIfar9qDb5pZ55yaKF/q+OmZx9MVUxYCfsoj5s0Cx2chXPhLjoYF
         K0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761165689; x=1761770489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMz4MjWmEjo8MCVFCQmb3m8xWWVoRp7Aa5V83Qc6Zy8=;
        b=KdSBYCpoo0lJyPvSVzsxDwVLZ1L9py/IIQmSx+VDOwhWvVW8me85vps1mRMzf8nlo8
         CYUNt12cuyc7JWtdV0QlLl7+qsT4XRQMZ1BY8uJZ0XfM1VM4LTmfQXsNucg73RgYNP+J
         7S5Mtc/15QU3atXQjbpfTt7fJtk3AOuJVcqw3X/uyiuns/XEEDnTEE4BScoN7F58tmd9
         YuJ0CpFGKC8X8JHgp6lwyKWaf9mk0n38z1dAAoWo63zoZVUiZWf7/wF6Lc48O5Fu02Up
         3riuBiIJaKQEGBut0wTEXFMdgLxZbBofgzY0YwNCX+3rfvdVHjssKwEtBFU1HOlE9Rmt
         1UkQ==
X-Gm-Message-State: AOJu0YzX46gPvWBxQVN3dYuSdYWGsVWRKvSfBxUaM5VD1/aJAuGPlogo
	xCSlOJIfQisC7HkOGgp/JMN0SOD5nJ/DwpP++gK3E9ECdr6mF06pnAp/CLuURRKFHr/3+H2vuss
	SUthXJIlUvypQIHSEs2CMa3aoVODHEqduEa/6
X-Gm-Gg: ASbGncs/rpmdhVBSWtWWFqT1z5QRNm2PbvK6PClwk0x7y71ynLd5S6QauOraDZZiGAO
	jmaR3Z7880cy66bghFgUf84VLWU2eim7K/WHU/Han7RvgjSfN4E56iOkcXqXMeQU2zWptGD1zjD
	05pyiBcI5B3K/kXKoAlrXTJdreUUx1JNFU5GKnDMP1heEAp6m2x6omvl0veQ4UkdUd+8icFq+TV
	HAnCeM2NYqUtG0AM1m/RAqqp4UhUdjCLowvzcRoLyzLmT0FixvV9ndgQVvxIicO/3oZupagZwmK
	I1Wz62NchoRWUdHQDb3jSdKUROS4KJOJr/hRFA6jJwu6fju6aqXmsfUo17+7qn32Ekh3nrf0W/I
	djC+FiYqcy7l05A0=
X-Google-Smtp-Source: AGHT+IGtgdfp/TiDDgyF2zZqkZcE1bp5L8zekrKH1YAwXiGxrLz5gJaswwr6hQ+4cto6EEQVKho6ciw0nWRTMmzoZpo=
X-Received: by 2002:a05:690e:434e:b0:63e:28ce:9a95 with SMTP id
 956f58d0204a3-63f378e15e0mr31295d50.67.1761165689012; Wed, 22 Oct 2025
 13:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca>
In-Reply-To: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Oct 2025 13:41:02 -0700
X-Gm-Features: AS18NWBqhpMJfdnBlihVWdzQF4MFZ_16b0_6P94y_lIoAnWoTCwy1O4qVKJTP9M
Message-ID: <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com>
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 20:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7777

On Wed, Oct 22, 2025 at 1:37=E2=80=AFPM Robert P. J. Day via
lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   reading here:
>
> file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/overvi=
ew-manual/yp-intro.html
>
> and that page states:
>
> "commercial Linux vendors such as Wind River, Mentor Graphics,
> Timesys, and ENEA could take it and provide ongoing support"
>
>   well, sure, but there are a *lot* of other sources for support that
> are not listed there that might deserve a mention. perhaps that
> sentence should include a link to, perhaps:
>
>   https://www.yoctoproject.org/about/participants/
>
> or at least a more all-encompassing list of support providers.

I think a link is a good option provided it is kept uptodate.

>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7775): https://lists.yoctoproject.org/g/docs/message/=
7775
> Mute This Topic: https://lists.yoctoproject.org/mt/115899908/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

