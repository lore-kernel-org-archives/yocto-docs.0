Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C02CE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 23:47:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.126.1735084047250396627
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 15:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+z0m9DP;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f22fd6832so5986714e87.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735084045; x=1735688845; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDEJew1mbyjrZq+XXVd1FUsnqoTW/kVmmc9bd+mXtkg=;
        b=W+z0m9DPTaDO3STvDM+uawdIqVVkrnOxY9eYvCglEGYAciwBxyldvWxs9qHoG+G5TN
         L6sUE3Igda/dhQWq4pfbO827kRl8DliIWmo09HiGff06pPudPuO350IwfGq9v0shlaEv
         AGwUtScGnslV4GQ5IENylReiwtFA6rlXcDYJLxDTqTjli1+bDxwoTHn7hgy1F0Cb8IbM
         CohF25gcA11rFcJ7x1VMnW/wPxAaWWp+Uog7dTSpX+fc+GjgrRlxoVEsN3hdCnod3UlZ
         rSceit9oInYiy6JbEwh+KequBOHYyrnH6gL9s6cOPwUpqu/jJJRc9cJP2niyhvi+x7ma
         Wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735084045; x=1735688845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDEJew1mbyjrZq+XXVd1FUsnqoTW/kVmmc9bd+mXtkg=;
        b=LD2RZ201V3vfy0Ev555Qz0LKaOb8n1u9BUkV+eBJdUnR/vdu4GFrSYY+4g3rGcXFjT
         nlxvQl0N4L08qJhoFMaJTPIM7PVRK7BJRZ4fRUarxB6U64pXIVDIJQBZQ/b0aU91IqY2
         rq3iBRw2d2/BJXrUMTMIPD6tsvk4541ZbSDTXkCSWPTeaf0Bvx1SietEMsIbr/9UUWZ+
         s7MlHXPCqpex6fsePqWsPyS1jNqfEJecGctrohj4TmIFPHJDMVuAW/NymWwgp54xZ3sk
         HkONx6+PMGe4XWUn7GS195gZNJ2SFtMtas97EANTeqdhh91xn3WUMKcfKSkktgGWllBG
         PgqA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Vdqg1NDf3VGXYYcU5NedPK3gD/EZP0Qkm094TlpyVXceu6dQR0axrW3hkwZaT5la/cHm@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzWPj0FOpe9CgAlGefsRZiear03aQ1v4f6oi9ZYD/G7xSeKPRNb
	yJNHZIw8za2yCLGyNPbWyIh982rpnSJ/k9U/DL6eyZs8ojxIDLpkQJRhRB9EmDN1gAM6cVHjNI0
	jF2HE1Xl6k5x1TqF4tXgwOoqzYik=
X-Gm-Gg: ASbGncv6Xsl5lxI38RfNvveAJzUGUiXdeJZcnr7Pih92qES0HD6BgkoOOBk+MtKoqSl
	d2SIW/Beiabq6KgagOfNZxq5gbvelVo9jEr7nj61ccB7D99d3B2MqZUjY5iAPgqMgH41lxNU=
X-Google-Smtp-Source: AGHT+IFREH+PWr7lMwZmKfgXAlFRloYjzJTL1H/NtZx0eh5MtvWT4K/sOv5nYnwPWAQQetOn+LkDcDZJAgFO10JOsv4=
X-Received: by 2002:a05:6512:1283:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-5422956bf40mr5031376e87.52.1735084044960; Tue, 24 Dec 2024
 15:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com> <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
 <CA+chaQcQN96LXQGKuP_MR1AO+ROvWZrAyMCci=F8E1xJWOQA-Q@mail.gmail.com> <031a8378-b9a0-4bf9-aab7-8b98517f6779@app.fastmail.com>
In-Reply-To: <031a8378-b9a0-4bf9-aab7-8b98517f6779@app.fastmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Dec 2024 00:47:13 +0100
Message-ID: <CA+chaQeH8EaVww4=18WhDXCXZW=Yyn2gD-cbkD-acteDw03aTA@mail.gmail.com>
Subject: Re: [docs] [PATCH] Set max supported Python version
To: Javier Tia <javier.tia@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs@lists.yoctoproject.org, 
	Mikko Rapeli <mikko.rapeli@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 23:47:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6031

Hi Javier,

yeah I believe you. I just wanted to show that not all 3.13.1 pythons
trigger this issue and it's important to figure out what's different
on your system. e.g. in gentoo I'm disabling pgo in python since 3.13
due to some issues (detected in python test suite already).

I meant this commit (which you already have unless you're using more
layers and one of them changes SRCREV in pseudo recipe - which we also
had before in one of our layers):
https://git.openembedded.org/openembedded-core/commit/?id=3Dd80e20d70d17039=
7f9827c5a5fc75ad1f2e8cd94

Cheers,

On Wed, Dec 25, 2024 at 12:39=E2=80=AFAM Javier Tia <javier.tia@linaro.org>=
 wrote:
>
> Hi Martin,
>
> On Tue, Dec 24, 2024, at 5:34 PM, Martin Jansa wrote:
> > FWIW: I'm using gentoo with 3.13.1 and I'm not seeing these issues
> > since pseudo was updated.
>
> Yes, I updated pseudo [1], but all build issues happened:
>
> [1] bitbake pseudo-native -c cleanall && bitbake pseudo-native.
>
> Thanks,
>
> > On Wed, Dec 25, 2024 at 12:22=E2=80=AFAM Richard Purdie via
> > lists.yoctoproject.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
> >>
> >> On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
> >> > On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
> >> > > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
> >> > > lists.yoctoproject.org wrote:
> >> > > > When Bitbake is used with Python 3.13, it generates numerous
> >> > > > build
> >> > > > issues that do not occur with Python 3.12. The documentation is
> >> > > > clear
> >> > > > for the supported Linux distributions, but not for the supported
> >> > > > Python
> >> > > > versions.
> >> > > >
> >> > > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> >> > >
> >> > > Can you be specific about which version of bitbake you saw the
> >> > > issues
> >> > > with? I was hoping we had resolved most of the issues with 3.13, a=
t
> >> > > least in master. We do aim to work with new versions of python but
> >> > > it
> >> > > obviously takes time to catch up and for fixes to make older
> >> > > versions.
> >> >
> >> > With Bitbake from poky master (284a08b6e40761f) and BitBake from the
> >> > latest master (c9906bb289dcfd9). Python 3.13.1.
> >> >
> >> > Issues:
> >> >
> >> > - "ERROR: ParseError in None: Not all recipes parsed, parser thread
> >> > killed/died? Exciting." I noticed it was solved in Yocto Bugzilla,
> >> > but I reopened the bug because I believe it is still not fixed.
> >> >
> >> > - The problem mentioned on
> >> > https://wiki.yoctoproject.org/wiki/Pseudo_Abort with several poky
> >> > recipes (base-files, update-rc.d, qemu, and u-boot) and other recipe=
s
> >> > from other layers.
> >> >
> >> > Please let me know if more information is needed.
> >>
> >> We have a fedora41 worker in the autobuilder cluster which has:
> >>
> >> fedora41-vk-1:~$ python3 --version
> >> Python 3.13.0
> >>
> >> As you can see here:
> >>
> >> https://valkyrie.yoctoproject.org/#/workers/54
> >>
> >> is it running builds successfully. There is therefore some difference
> >> in your environment and I'm not sure it is python 3.13 that is the
> >> cause of the problems you're seeing.
> >>
> >> Are there any tracebacks in bitbake-cookerdaemon.log? Which distro is
> >> this?
> >>
> >> The pseudo aborts are likely a different problem with a missing libc
> >> intercept or similar issue and secondary to the other problem.
> >>
> >> Cheers,
> >>
> >> Richard
>
> --
> =C2=BB Javier Tia =E2=9C=8D

