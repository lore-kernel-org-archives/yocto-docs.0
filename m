Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2693C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:26:10 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.3660.1714677969047275651
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQ4kljPK;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so7819981fa.0
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714677967; x=1715282767; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxebPaq+iQVRmuJdvNilHEqjDARIj4xJYwPhKB6iDJI=;
        b=JQ4kljPK/v43rpdbfP/byA/43jpS6C76F0BABzoJzyEdqV/aST1tia4Mu1hdGvQqaI
         3XK/hB1WmGSFdg5W0aHNYkZ48ifR1w/9+x+csStm9xXLcF5QkUxoTXyZ8WybDpvZjwa1
         1ujxEMFROIe9LsYJo44fR1EscyPI8WmWc4vUW6bt3qiDPyWKnVQstOOYd052tk0NnYt3
         +sBTa0r4q65a1A1hohSKtp+Qt4jxa+u+zNr4Kn6/uSuuJmAtZW2nX2IFiS61Fpn9qllk
         UIcRFJ2hnuiHoB6wk5Rllib5CgzMWocF1+KzotADKipMBF2b9Aaysi9oQF5PVU6arvNY
         cSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714677967; x=1715282767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxebPaq+iQVRmuJdvNilHEqjDARIj4xJYwPhKB6iDJI=;
        b=bovEUFzXiplUJBA0d3WTgkGuMS4812TJBAyCto8UeKnfeFNbZb9qJtaz8Py5yigi7S
         rOFo4NmMKvQOCuiAXLzqcajuASmv+5yWmbY63rp+7Ed2u6pAb5ULx/26zbT9Is1WGsZc
         GmFdp99bd+8k9liyaytMXK4hvN9/ycUlIcAvg0c+hWhdvYvwvkWDAIIBEiYSuiflr5Uh
         +zjsvBfLAQgpmWdiGYNc6O86P3v98Uy0tzPVrBq/2WAyuwMjbeD57ido46J1FJr/R3ou
         0o+YR/3MRXGxSacDvR0JuxUfxtU/9cwfJHaYrdYgxzbnHF38AyKmLMIn1fq0OXD+a9uD
         sJiA==
X-Forwarded-Encrypted: i=1; AJvYcCWoluC8k1LOmaD8etf0kG0UrgJOfU3/w16WdAJHScSmUsqSgFS300REjXpAu5wjxNA+R6tCygfKQ9crlhFdg7BnaNdl+X9lLCTj26U=
X-Gm-Message-State: AOJu0YyOTikra7vELXUGf5q+Bgo9avKvKV1XQGtCwwK3/go/4j07fx1E
	41C+IOIWcR7/08TjJFvymetxqGVSYFbqCgY3YPhMOsNydlZYHFNm4Rsd4LtkKhe0J9xltjMZfhv
	t/BhAzW0LUYTs6Q3zyPrcxZiIyzo=
X-Google-Smtp-Source: AGHT+IFKCUUtW/jLQzKmgYUKSSAlLdkwAEwwzP7WwKFpG5f7adSYi8ng683W5cZqg5UxkRCIKg0eME0YkVLCvZ+aBak=
X-Received: by 2002:a2e:a1d0:0:b0:2d8:611c:228a with SMTP id
 c16-20020a2ea1d0000000b002d8611c228amr1011843ljm.8.1714677966775; Thu, 02 May
 2024 12:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com> <20240502191839a351b43b@mail.local>
In-Reply-To: <20240502191839a351b43b@mail.local>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 2 May 2024 13:25:54 -0600
Message-ID: <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: alexandre.belloni@bootlin.com
Cc: Tim Orling <tim.orling@konsulko.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 19:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5206

On Thu, May 2, 2024 at 1:18=E2=80=AFPM Alexandre Belloni via
lists.yoctoproject.org
<alexandre.belloni=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> On 02/05/2024 08:27:02-0700, Tim Orling wrote:
> > We are seeing a lot of patches failing when the From:
> > line is not contained in the message body. It is probably
> > better to just recommend to force the in-body From: to be
> > present globally.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  documentation/contributor-guide/submit-changes.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/documentation/contributor-guide/submit-changes.rst b/docum=
entation/contributor-guide/submit-changes.rst
> > index 47a416b24..c292a143a 100644
> > --- a/documentation/contributor-guide/submit-changes.rst
> > +++ b/documentation/contributor-guide/submit-changes.rst
> > @@ -65,6 +65,11 @@ use to identify your commits::
> >     git config --global user.name "Ada Lovelace"
> >     git config --global user.email "ada.lovelace@gmail.com"
> >
> > +To ensure that your patches are formatted properly, it is also
> > +recommended to set::
> > +
> > +   git config --global format.forceInBodyFrom true
> > +
>
> I do believe the current documentation already points to a working
> solution:
>
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixin=
g-your-from-identity
>
> Doesn't that work for you?

Empirically, that is insufficient. I've had that set and it mangled my
From line anyway. I beleive that only affects the SMTP header From,
when you actually need the "correct" From in the message body as a Git
header (which is what format.forceInBodyFrom does). Besides, most
people probably already set that anyway because I think it prompts if
you don't have it set

>
> >  Clone the Git repository for the component to modify
> >  ----------------------------------------------------
> >
> > --
> > 2.43.2
> >
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5205): https://lists.yoctoproject.org/g/docs/message/=
5205
> Mute This Topic: https://lists.yoctoproject.org/mt/105864996/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmai=
l.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

