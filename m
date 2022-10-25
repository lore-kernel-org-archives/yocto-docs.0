Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BB8FA373E
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 18:57:10 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.1969.1666724224118980804
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 11:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/zoEIvH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id d26so15028232eje.10
        for <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 11:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uJTkt2L6PUIMIlYxcFxQLlurQacv1GwGnAau4JGNQAA=;
        b=m/zoEIvH/+3NRQMAIWfLn5kdD+1FYmc6CSLh/F2CLB97kgRSmig1S3LxEmScMB7GxV
         bja9oGfh9Ip4mRuaPfmQ6+LP8q3mDZNIIwMmYH1mb9wXe+wYJMWNrEhWq1zN+D544g0n
         oWwdcaUEI+bwJUyd2CgfWH+0SN7Yfx8HTuuatT74YsE8BweAtiZc2ytpgNZ2SbJtVd5f
         bF9oGEqsk3NeNesQyydh2vo8eEqUGwdS+JnYxyDnnXcCw3WUlf26Y79qITaIc1Wc2Mq0
         M1MvIVCyByvtbxGB9qTcLYAlfGMwb1mE9cdm+1LOp0ZoyspjG7eRtIvRpPNZ3JAanQDp
         JI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJTkt2L6PUIMIlYxcFxQLlurQacv1GwGnAau4JGNQAA=;
        b=HaItbp9IVNVn0s/YAZQSDFcMNLgTOq59ZqTc3trTNnAJiqWEXJS2zJkwjSodN/J6MU
         wAK/1S5peMLKcNsYJQQULZVnD/Pwr16yCtrik8qH7TEYVgoKhqwOpHFrzRm4ncp8A3TR
         HldQJRx8WtHxVlFEy6VnIk+dleXSOVlVSKR7yVHUUAbA5VqCeDboWUVpultaHbhrurkO
         my2kdYfydImBfbP/JRXiy6IPivwvCEFaxT9MFZw1Vrn9ihiC0atPPqQdGY//0JtOHMOX
         loEInptMQRhXn+C59I39NtWujo1sYsGOlAp/wHYh4Dlzcgy+Q7+r/iS2p2DCmfW5Jucm
         Lp+Q==
X-Gm-Message-State: ACrzQf0Ki/Hd3QiEDJ4Y0kyFoVPJZw6MwWnvMb7UyEU6zFJCTiTwXEgp
	+bhHfdTCAa3w4oab/otnyac4rDJI6ZqgJzDsQOY=
X-Google-Smtp-Source: AMsMyM7+fGujt0uLG0rpo9uzquhDaiRG0ev8Q+QZoKFvnPZr1J8Y+p3ndr7cVuXOC2ET/snpez0Ed9WrrImLCJuFg54=
X-Received: by 2002:a17:906:6a1a:b0:7a1:a9e5:7869 with SMTP id
 qw26-20020a1709066a1a00b007a1a9e57869mr16079949ejc.708.1666724222450; Tue, 25
 Oct 2022 11:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <17215B3A7EFA7824.21867@lists.yoctoproject.org> <8623b082-27e0-a3bb-df4c-927efd96f4df@bootlin.com>
In-Reply-To: <8623b082-27e0-a3bb-df4c-927efd96f4df@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 25 Oct 2022 13:56:50 -0500
Message-ID: <CAJdd5GZdNsM9LjmvSOSxCwGjGneGViCKExB3Ki5-tiByC-UAEg@mail.gmail.com>
Subject: Re: [docs] [RFC PATCH] ref-manual: document create-spdx class and variables
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 18:57:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3403

On Tue, Oct 25, 2022 at 11:10 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hello Joshua and all,
>
> On 10/25/22 18:00, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >   documentation/ref-manual/classes.rst   | 11 ++++
> >   documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
> >   2 files changed, 82 insertions(+)
>
>
> Once this is in place (after receiving your corrections and comments),
> I'll have to properly introduce SBoM / SPDX generation.

Excellent! Thanks so much for adding that, I think it will be really helpful

>
> A suitable place may be
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#working-with-licenses.

Maybe even its own section, since licenses are a subset of what SBoMs
can be used for. Although historically the most common usage, I think
that's changing as they become more common.

>
> However, it seems to me that
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#providing-spdx-files
> is now outdated, as we no longer need meta-spdxscanner to generate our
> SPDX files. Am I correct?

Yes I would agree with that. IIRC that documentation was a stop-gap
until we had our own implementation.

>
> Joshua, I saw in your presentation to possibility to go on using
> FOSSology. But what for, as we have all the metadata we need?

TBH, I know very little about FOSSology. I usually mention it as
something you could _probably_ do if you wanted to, but I'm not sure
on the details about how it's done; someone who is would need to pick
it up and document how it's done.

>
> Thanks in advance for your insights.
>
> Cheers
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

