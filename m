Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F92C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 20:16:11 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4631.1714680965408568192
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 13:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=frNKan4v;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-518931f8d23so8408408e87.3
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714680963; x=1715285763; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FaOl2yZSSJd1v5ISL9wIZKJUprzohFjV7VnspKYTIE=;
        b=frNKan4vHWtscMlq3+xeTF8EbhfIxdLrC8RWn+3kQY3twRYluAfzRbF3zl9GeCJB1F
         hm5REhdrGoNwMj+k2XDmvRlk2arxn7iMtR56xP9HIi+wOtRyIx4kY0TpIssiyCjUO2kr
         P0me8SDIvEl4+KAEGltdT+20CJCqpB52l6IKclxlpWIROK8zycolCGgLm3We3jL0GsD1
         iloFxyzEJNW+oqQ710GPV+GrDXBeDaqSqReFTnK4hSDUNZRTMDdAeeyX9xnEA192lyUs
         ZSuezh/ugV08vNEDdzPFKON66eMdNUrlJGdc/YfIOlkS0Ly1YtBJLA3AuoEakoSKCDBI
         dq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714680963; x=1715285763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FaOl2yZSSJd1v5ISL9wIZKJUprzohFjV7VnspKYTIE=;
        b=A0KgPonxUWfMrqaZJ1WFSEzNXj8v5LCUG5QcmdM6oS8mi+57FK+Oc6KW56qWID5I8q
         K26RkW1fbiDq7nthRB6rL/r0Odxo86DZcGqMw0UU3kxsTPCTsIYL1Z/QPrTQQ9pcdmBQ
         uz3YW+OD1LGGuXQ/uMFtSVzvE5woiNYV2gerj895hjlw1fwYh9Dsj15dMWcI2VDpm0TP
         H/filEtU3PuSra/ld4GxMc0GgjQ+gDv2xF9XgGgrwlRJLn8pmPfCt+kl18/vqTm5Egxz
         gQdgBoUAGvHACD4Krtto/5mPnNB6UEKlVr8Ht5Xk2HWUq203ekFJE7KpNjuQlAxlTjRy
         axrg==
X-Forwarded-Encrypted: i=1; AJvYcCWKPs2vT9ljlW4wynm2zB50sv/HZgPkh7wSHtUKuFxUMNP4D4ECSo77dhYBwUEcGkvy/HJRD7fDw830kPgegBvWcWSaRX7T4C6aQpQ=
X-Gm-Message-State: AOJu0YwuGk/+7AC80Y1Z5rWDNvZ3DUg9n0UB/8lGCT2wiC/fJUn9dp2C
	tl/GxcbNp5UD72xqbmJNHBKVeHR2npaBGBZp7oIViBy2mH8Bs5p8Yl3DEYVoMo1+zpEtNuvV9X2
	S1EKH4rEkNb5Bscwn3Otsb438hDY=
X-Google-Smtp-Source: AGHT+IEv8Smpx0tvxOSCmTP5LrRL0CvcEoJYgBO3lOXmjurcCsFdi6wzAV/duZtDHNHbbHA85Who4K4/tEyUPlIYur8=
X-Received: by 2002:ac2:5e84:0:b0:51d:416e:8434 with SMTP id
 b4-20020ac25e84000000b0051d416e8434mr583009lfq.2.1714680963261; Thu, 02 May
 2024 13:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <20240502191839a351b43b@mail.local> <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
 <202405021945001e34cffa@mail.local>
In-Reply-To: <202405021945001e34cffa@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 May 2024 22:15:51 +0200
Message-ID: <CANNYZj9GuMZFpbCdYd0kQSJ9fK2isT9rDQzpP3P2YzPpD9s8vA@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: alexandre.belloni@bootlin.com
Cc: Joshua Watt <jpewhacker@gmail.com>, Tim Orling <tim.orling@konsulko.com>, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 20:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5208

I have to agree with Alexandre: forceInBodyFrom is not necessary. My
setup for poky is:

[user]
    email =3D alex@linutronix.de
    name =3D Alexander Kanavin
[sendemail]
    smtpEncryption =3D tls
    smtpServer =3D smtp.gmail.com
    smtpUser =3D alex.kanavin@gmail.com
    smtpServerPort =3D 587

    from =3D Alexander Kanavin <alex.kanavin@gmail.com>
    to =3D openembedded-core@lists.openembedded.org


So patches are made with the linutronix identity, but emails are made
with gmail identity, and then git send-email adds the extra From: into
the email body automatically. No need to force stuff.

You guys need to double check your setup, I think.

Alex


On Thu, 2 May 2024 at 21:45, Alexandre Belloni via
lists.yoctoproject.org
<alexandre.belloni=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> On 02/05/2024 13:25:54-0600, Joshua Watt wrote:
> > On Thu, May 2, 2024 at 1:18=E2=80=AFPM Alexandre Belloni via
> > lists.yoctoproject.org
> > <alexandre.belloni=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > >
> > > On 02/05/2024 08:27:02-0700, Tim Orling wrote:
> > > > We are seeing a lot of patches failing when the From:
> > > > line is not contained in the message body. It is probably
> > > > better to just recommend to force the in-body From: to be
> > > > present globally.
> > > >
> > > > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > > > ---
> > > >  documentation/contributor-guide/submit-changes.rst | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/documentation/contributor-guide/submit-changes.rst b/d=
ocumentation/contributor-guide/submit-changes.rst
> > > > index 47a416b24..c292a143a 100644
> > > > --- a/documentation/contributor-guide/submit-changes.rst
> > > > +++ b/documentation/contributor-guide/submit-changes.rst
> > > > @@ -65,6 +65,11 @@ use to identify your commits::
> > > >     git config --global user.name "Ada Lovelace"
> > > >     git config --global user.email "ada.lovelace@gmail.com"
> > > >
> > > > +To ensure that your patches are formatted properly, it is also
> > > > +recommended to set::
> > > > +
> > > > +   git config --global format.forceInBodyFrom true
> > > > +
> > >
> > > I do believe the current documentation already points to a working
> > > solution:
> > >
> > > https://docs.yoctoproject.org/contributor-guide/submit-changes.html#f=
ixing-your-from-identity
> > >
> > > Doesn't that work for you?
> >
> > Empirically, that is insufficient. I've had that set and it mangled my
> > From line anyway. I beleive that only affects the SMTP header From,
> > when you actually need the "correct" From in the message body as a Git
> > header (which is what format.forceInBodyFrom does). Besides, most
> > people probably already set that anyway because I think it prompts if
> > you don't have it set
>
> I'm pretty sure this has ensured the From: was in the body for us at
> Bootlin.
>
> >
> > >
> > > >  Clone the Git repository for the component to modify
> > > >  ----------------------------------------------------
> > > >
> > > > --
> > > > 2.43.2
> > > >
> > > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
> > >
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5207): https://lists.yoctoproject.org/g/docs/message/=
5207
> Mute This Topic: https://lists.yoctoproject.org/mt/105864996/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

