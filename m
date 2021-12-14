Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE98C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:53:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.32592.1639518827617037055
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xc87T+gg;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id i22so4976966wrb.13
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRkBBlZ/fKqFC2e2t48aFH2SU/0+3UqBG7GA/vo9bMk=;
        b=Xc87T+gge+Zj/LdY6/UzhPbBkqUj0coYkph/xqD5xKJbGo0Ma8LboLs7R77sFWfj4j
         GyHp5TXISYVXEVE0qpvnz0aD2vpQZ+2BDX5mIJpB5ODorVAfH4nX+u/q2EIUeLdIUX7t
         XB5VXcrk69sCZPfRA8KdmOkEF/DLuG6txUbd7x70d+7Thj7vYPOmnsa9Jsllu0mcUrBs
         dw4oL6xMy8NQXpQSRR/PDlatTuKwC+0GG5u37UrWjBK0R7L0RxtOaBc0Iq/JXvjPz1Gz
         cgskDTwGkFQ3y+CX7E1cWGaEoZwZk1fpkGoOaJYqiMKhbp8vINWjnyC7vcLx3yLdVx+G
         as4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRkBBlZ/fKqFC2e2t48aFH2SU/0+3UqBG7GA/vo9bMk=;
        b=uKbhifUBL+q5BKo3+c0ZFNQM0YVoLJ1s6EfaIAR0dAMnJKuLewTiDFbWdG0DhJEogd
         AngZ0H4RwW5INB2wTiEb24W1E3XCdbPquCaJe2YIeYFQr5jGjrcxzX5zxRyn2KhCP3oL
         dHCmYX4eO+6/N1sTcQ4NXFdXrPzQmfEGx4eQGrYiH6VGWOmbgjywtagLw3/1hfYgrPne
         cW7w90a2nF4BhiBYdkCEVNyFEVfGCRL6LkujxjFBj1TLk8ubb4mxYS8+JjOHP1C4QMl9
         nWZp7sfQAnoBh6lg8vTAntk09d3JXkj6fElu69ypGAx+h+qPqaK6fXGtxcdmz6MiBm8W
         r2RQ==
X-Gm-Message-State: AOAM5323ieM6IlnHoPQnGH+bBeTziJ6BTbe/+mlI5vwaRuQo99BXuq4F
	gbaoI6RID0oPZF7SxXueJKgLXRUAvzUB6N2EiaA=
X-Google-Smtp-Source: 
 ABdhPJxIDyBNgWd7x5aClqqkODr6JazB5XSkO4M+pGynFHGLIJQmMLzm9bLgP7QO7q6OTmJZn+plXmWmXNSrls/khKk=
X-Received: by 2002:a5d:4e0f:: with SMTP id p15mr1763694wrt.48.1639518826046;
 Tue, 14 Dec 2021 13:53:46 -0800 (PST)
MIME-Version: 1.0
References: <83a56ef9-711e-a804-ed49-f64d864252a8@bootlin.com>
In-Reply-To: <83a56ef9-711e-a804-ed49-f64d864252a8@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 14 Dec 2021 15:53:35 -0600
Message-ID: 
 <CAJdd5GYdSL=y7iRJwyC0Cf8Cjie5r+2k4=MTZQyo0oYA_O_QOA@mail.gmail.com>
Subject: Re: [docs] Question about "hash-equivalence passthrough to the
 matching server"
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	BitBake developer list <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 21:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2261

On Tue, Dec 14, 2021 at 3:01 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Greetings,
>
> I'd need clarification about this section in Poky's
> meta-poky/conf/local.conf.sample file:
>
> # Yocto Project SState Mirror
> #
> # The Yocto Project has prebuilt artefacts available for its releases,
> you can enable
> # use of these by uncommenting the following lines. This will mean the
> build uses
> # the network to check for artefacts at the start of builds, which does
> slow it down
> # equally, it will also speed up the builds by not having to build
> things if they are
> # present in the cache. It assumes you can download something faster
> than you can build it
> # which will depend on your network.
> # Note: For this to work you also need hash-equivalence passthrough to
> the matching server
> #
> #BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> #SSTATE_MIRRORS ?= "file://.*
> http://sstate.yoctoproject.org/3.4/PATH;downloadfilename=PATH"
>
> How to set enable "hash-equivalence passthrough"?
> I haven't managed to find details in the source code yet...

You need to configure it for the hash server you are using. If you are
running locally (e.g. BB_HASHSERV = "auto"), then
BB_HASHSERVE_UPSTREAM will set the upstream. If you are running a
standalone hash server, you specify the upstream as a command line
argument when you start the server

>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2259): https://lists.yoctoproject.org/g/docs/message/2259
> Mute This Topic: https://lists.yoctoproject.org/mt/87730954/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

