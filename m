Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73D7C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 18:38:23 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.129289.1698086302756699287
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 11:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIoioeSU;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so55413471fa.3
        for <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698086301; x=1698691101; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxqDf8+ePjoihmv6AV4yR4u2teQLDvYUW6CRf5o8tbw=;
        b=NIoioeSUQdpkhKtur9hA+yr7UOvyp0fpD/i6gRgcdOwPU8aVdp+bWJTjOPnybK7+az
         QcJXEZON5tgZf7dWxBHfnCZAsk4c1bTh4D1vk8WCEoCp31ULZc2PtirWO7uXuSAtlTdJ
         dv6Ygeh6wGp66RFZWLxU4WN/Pl+82cqp8LlabMR3Kylr7J/y/7S0E+GxFaGHIUVdNCfE
         or5fPUtrwal4YY6pYd4bzbDQNd5TzM2AWuHXKu8XRIQrDg8MX2hqJO2f8k/yIpvUDfd7
         cAG5ETSBciZdOOuAiS70HEK2t87I3SzgNI/r180/UX4pPFT+XhjeuSXk5O573+OANtSX
         0XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698086301; x=1698691101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxqDf8+ePjoihmv6AV4yR4u2teQLDvYUW6CRf5o8tbw=;
        b=S/fOPuaGma0DC8s+GbOC1HqdOb0pdJ0V+S+iUoJIW9Bzv1LSBRSlYDHmehvEzLSlB8
         tHzq21yU9VvFwImVs5XAZjiPseY/lRlMWSIXXD+4+5ikRQpZzBDClWUg4NaN25YtPF2n
         JwlcGmBunsm+FYPc4VgaAZRr1F6u+bNywLtgVdS9SHIOfQ675TdzXnGSTvL7Q5f5apMd
         NrQjIfxjLd0ZgmrZRtBcIPrOF1k0zEhbwYRSTU0fnpqkdmMmg0syEHhJeFHf4Ym6TiFA
         fahk69LavxEymJVQnooQZEqeZRcZZA4qo+ekSIiycl/C6fG+ZHdA4hBrD14XopELWVxi
         HDig==
X-Gm-Message-State: AOJu0YzZLS8dWdLeQhal+0P4fE83iRRe8L65uNcE02RafiiAjAPLx5wk
	iotBKYgUd+LVeuKaSOJbM4TbNoWtxqJnpT0pYcw=
X-Google-Smtp-Source: AGHT+IEqnUKL9EqOwJAKNsFfnW9/OGa76g4YcXFGomuZZkuArEt6xE3YDhdwKlbw/w0Hc0OtXAUV1PZvGoDwKuh5q8o=
X-Received: by 2002:a05:651c:211d:b0:2bf:e61b:c980 with SMTP id
 a29-20020a05651c211d00b002bfe61bc980mr8893678ljq.8.1698086300609; Mon, 23 Oct
 2023 11:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231020143928.1700522-1-rybczynska@gmail.com> <2638fa02-b0d9-4d5e-9203-94623f065586@bootlin.com>
In-Reply-To: <2638fa02-b0d9-4d5e-9203-94623f065586@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 23 Oct 2023 20:38:08 +0200
Message-ID: <CAApg2=S2U6ryg68cvXtVDPJOHvNMMQu9pRwJuXm40fx+0M51Fw@mail.gmail.com>
Subject: Re: [PATCH v2][docs] dev--manual: add security team processes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 18:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4458

Helo Michael,
Thanks for comments, all are addressed in v3.

On Fri, Oct 20, 2023 at 7:57=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> > +
> > +Branches maintained with security fixes
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +See the :yocto_wiki:`Stable release and LTS </Stable_Release_and_LTS>`
> > +wiki page for detailed info regarding the policies and maintenance of =
stable
> > +branches.
>
> Do you think we could point to
> https://docs.yoctoproject.org/ref-manual/release-process.html instead.
> Does it have enough information?
>

Yes, it is good. Changed the reference.

> > +
> > +  -  Public List yocto [dash] security [at] yoctoproject[dot] org
>
>
> What about "Public List:" instead ?
>

Yes.

> > +When the upstream project releases a version with the fix, they are re=
sponsible
> > +for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number as=
signed
> > +and the CVE record published.
>
> Oops, you already have the exact same paragraph in one of the earlier
> sections above.
> You also have "They may want to include the original reporter in the
> loop"  twice in your patch. I guess the two paragraphs need a bit of rewo=
rk.
>

I moved content around so that this information is given only once now.

> > +Current Security Team members
> > +-----------------------------
> > +
> > +For secure communications, please send your messages encrypted using t=
he GPG
> > +keys. Remember, message headers are not encrypted so do not include se=
nsitive
> > +information in the subject line.
> > +
> > +  -  Ross Burton <ross@burtonini.com> `Public key <https://keys.openpg=
p.org/search?q=3Dross%40burtonini.com>`__
> > +
> > +  -  Michael Halstead <mhalstead [at] linuxfoundation [dot] org>
> > +     `Public key <https://pgp.mit.edu/pks/lookup?op=3Dvindex&search=3D=
0x3373170601861969>`__
> > +     or `Public key <https://keyserver.ubuntu.com/pks/lookup?op=3Dget&=
search=3D0xd1f2407285e571ed12a407a73373170601861969>`__
> > +
> > +  -  Richard Purdie <richard.purdie@linuxfoundation.org> `Public key <=
https://keys.openpgp.org/search?q=3Drichard.purdie%40linuxfoundation.org>`_=
_
> > +
> > +  -  Marta Rybczynska <marta DOT rybczynska [at] syslinbit [dot] com> =
`Public key <https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit=
.com>`__
> > +
> > +  -  Steve Sakoman <steve [at] sakoman [dot] com> `Public key <https:/=
/keys.openpgp.org/search?q=3Dsteve%40sakoman.com>`__
>
> Maybe add a ":" character right after each name?
> That's all I have. Thanks for the quality of this document!

Not sure about it. I was wondering, however, about showing key
fingerprint directly.
That would mean, however, that LTS documentation will require changes
in that regard
(key expiration is typically 1 or 2 years). What do you think?

Regards,
Marta

