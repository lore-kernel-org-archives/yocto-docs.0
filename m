Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E04DC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:17:56 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.18286.1691677068624719805
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 07:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LlnnCtTY;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3492e8fb906so3393405ab.3
        for <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691677068; x=1692281868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2IHO5eXN4Zb+052tbmrSTZOIX70Hlsw5UxtrQ5rCPE=;
        b=LlnnCtTYfGcxVrsPXXr9X8HNKwiH8Zf1Pt/EDCFuzxatQOsZszgiM/prbi8NewtsfA
         IOyDPHMsUFTJ5oNTLzG2Hj6RcDOShhCczheSGCbfsbtZjtdZul+kz32imWEr9OMvdUPr
         eLIilUry0V4qpAXU5pdk2DmAu+NHbuiKclYCGkOX06apFwe17bHaJiionAgMIQjf0mh8
         dgcMyDhd8utPMzceq1hxMdU28/YR1WGOd2nbLi61ZQsQqle9peWLDoUM0v9SSCtkXGb6
         G4u/taPQYh1HAzZaG0asmHytTzS8cKLp0CbJvSUa/xhmmCxGGP6wF4TMZD5OMOs6+D9d
         gzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691677068; x=1692281868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2IHO5eXN4Zb+052tbmrSTZOIX70Hlsw5UxtrQ5rCPE=;
        b=Ms63KRySpGX3SkDwbfqWLtapmuaIp9GffG0M6jMPFhStSNLfIKi7HD5AdYrE88/Jck
         yuvLlTBXCTbT5TzGltnXhKpqeznSYgE5H7cHKLfH6mcENM7Rt9ZH2vFu5XNoVnoXu7rM
         qmhMR4AjwHu9yAlLORybC5CB2tGj4DdrshFjES3V9wN8LF8D1xVsj8QdrFvpI48do26z
         memRG/POEqPxzFUlC/hSgNcrDU9IjH0T5VE3vXE6AfUFyXOL+G/39Hz/FQBQObp/bSC2
         vRuHo5CRjawpz+d7X/c09KcAtZJcZqzExdEz5KE1rHZlSbRlXaP437X9T7CqN4aKoCFE
         FCsA==
X-Gm-Message-State: AOJu0YxWJCafjU9SxXjyhxkVq1/fFmwAc+7rehmMPOl76TVV+THPXUme
	bRZTHRnN16D3O5mt+PNjsc9Nr8rUofuCliU0j0Y=
X-Google-Smtp-Source: AGHT+IHLD7u+U9ldpaavIKMX5PJESs3T9LGNT2vcMn28TTlc0xVRjV0g4OYl+U1q/WQd+CDaZfwNC3ONNcUnR/9qU0c=
X-Received: by 2002:a05:6e02:1bc3:b0:345:d58d:9ae5 with SMTP id
 x3-20020a056e021bc300b00345d58d9ae5mr3899707ilv.7.1691677067878; Thu, 10 Aug
 2023 07:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
 <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com> <a460f22c-a39d-296c-65df-0997b897d7f0@bootlin.com>
In-Reply-To: <a460f22c-a39d-296c-65df-0997b897d7f0@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Aug 2023 10:17:38 -0400
Message-ID: <CADkTA4NUiyR80P7u8u-3ZOkAWiT0GfvOYfM67fTXREjxHG1Mqw@mail.gmail.com>
Subject: Re: [docs] Keep scripts/create-pull-request and send-pull-request ?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 14:17:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4138

On Thu, Aug 10, 2023 at 10:13=E2=80=AFAM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Bruce
>
> On 10.08.23 at 16:09, Bruce Ashfield wrote:
> > On Thu, Aug 10, 2023 at 10:04=E2=80=AFAM Michael Opdenacker via
> > lists.yoctoproject.org
> > <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >> Greetings,
> >>
> >> I'm reviewing
> >> https://docs.yoctoproject.org/next/contributor-guide/submit-change.htm=
l#using-scripts-to-push-a-change-upstream-and-request-a-pull
> >> and trying to simplify it.
> >>
> >> Do people still use scripts/create-pull-request and send-pull-request?=
 I
> >> see some obsolete URLs in the first script, and mostly old commits to
> >> their code.
> > I use create-pull-request for all my series, so the scripts still do
> > work and are in at least in use here.
> >
> > But I send with git send-email directly.
>
>
> Good to know, thanks!
> So, we need to keep at least the first one. I'll send a patch to it then.
>
> I'm not saying we should keep documenting them though ;-)

Agreed!

Bruce

>
> Thanks
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

