Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22786E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 23:34:51 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.3.1735083288038174212
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 15:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4yxLEA/;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3047818ac17so30530041fa.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 15:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735083285; x=1735688085; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAH0qz2KQlzyLPzCG6bcT8qvgrp5aGxvmwGACyhTw2M=;
        b=P4yxLEA/iUDcTAkq8Pe3x9MEPpIsWkFoOVg7kbRsBFlw+fUAoRU0b5J8KHHsNb2ltW
         ndk3YUzMgancr5yQl1BrIG2nTlfcAKbrSpXzCfr6c8fOWle3Hut+63rmMdRzA47SZd+z
         ThwivcXTlaSxoxRAyN0ryA8KKO9REfZTdsW9MktBAkn4/BCYJ1r5WRsqrxME032ZJMZO
         lk+LU6sVXxLg949XIm76RHMyLhq1DOemYH10n9mYXOuHI5L1kQy0Y3wivaBMJffAq0Z/
         cGUqp2KRdJ61vq6F424eNA/Lw/vqLIQwTA41DEdZB5tHIfMnfiYlhNrIU7sf+YLFE8Ft
         yOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735083285; x=1735688085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAH0qz2KQlzyLPzCG6bcT8qvgrp5aGxvmwGACyhTw2M=;
        b=QCZBXGFq4oXn/DbiO9Sy1K+eGUxH5M/6mBLXe2F6AVriyXpYj/2iCdDMAX+zWnLQIU
         VMw9fixRKxyn0ENTQ0RG9lRQfppvqQC0Fv0QcuB0pg7hOH3TpG2K6inrnMDon0MP96qs
         b3cmso3B8j5481d6tw/6QXpUMcSacenCsX5hvMJ9fOsepTKcRV75cWWiokFKcYk4UoF7
         yLxzasqlkRzy4HJySl7llh8I16wpQdjknGVs7jTIVQzwDrx5TC5MoWfsIKp/z7nznBjM
         QPpTDa4+TjXRa39/ClUTtQ7dyMQCjE1mw7K4Ca3nCQ5R1XPdKT9wA1b/QEgJJLbCDJoj
         fL0w==
X-Forwarded-Encrypted: i=1; AJvYcCXM7BRivNzVrXiu/AMXR00ql3qcC20igzeJuCfibEokhBGDu83ecX2PhfV5BcmtmrJQxfkG@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YygefQvv6FKNsrphEYAeoXOcFite/eXcWzhhy7GhUwBfh/y1wyo
	3PKmIF6MAd3uacvHOunsMWkY86Mxhz55Aew6U8CcJytxEkJlJbQj9Q6VvuN6vw/euYngqzVcpCW
	xYdlSO8woBshT/JIYhDat8VW8ziI=
X-Gm-Gg: ASbGncvY1reh6qiWJwyir0fteJmFy7ObbxQ1WEceQ5e1eG+mdECl7iiGDBn4tVlWWeq
	PqeMDSUwdMB6r9XBJnrxvbZ2jq0zMx6fu1f4wIZwpnKPz0+sgfeUBk90QsvyS/7xrL2cqzjQ=
X-Google-Smtp-Source: AGHT+IENIt0vLkoJ69jSvbRkLICxqkHbHl9efouN62W2HA5MVHoIKWaDAgihPD5cVjdN2f4hLw/sTdCWDHUovtdHs9s=
X-Received: by 2002:a05:651c:150b:b0:302:1c90:58f5 with SMTP id
 38308e7fff4ca-3046851fa66mr57103631fa.1.1735083285082; Tue, 24 Dec 2024
 15:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20241224221625.4092917-1-javier.tia@linaro.org>
 <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
 <d507bfc4-a4ab-45e8-adee-6503896fc045@app.fastmail.com> <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
In-Reply-To: <42f3567668e35a5398dbbeefc408d71e90292463.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Dec 2024 00:34:33 +0100
Message-ID: <CA+chaQcQN96LXQGKuP_MR1AO+ROvWZrAyMCci=F8E1xJWOQA-Q@mail.gmail.com>
Subject: Re: [docs] [PATCH] Set max supported Python version
To: richard.purdie@linuxfoundation.org
Cc: Javier Tia <javier.tia@linaro.org>, docs@lists.yoctoproject.org, 
	Mikko Rapeli <mikko.rapeli@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 23:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6029

FWIW: I'm using gentoo with 3.13.1 and I'm not seeing these issues
since pseudo was updated.

On Wed, Dec 25, 2024 at 12:22=E2=80=AFAM Richard Purdie via
lists.yoctoproject.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
>
> On Tue, 2024-12-24 at 17:13 -0600, Javier Tia wrote:
> > On Tue, Dec 24, 2024, at 4:54 PM, Richard Purdie wrote:
> > > On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via
> > > lists.yoctoproject.org wrote:
> > > > When Bitbake is used with Python 3.13, it generates numerous
> > > > build
> > > > issues that do not occur with Python 3.12. The documentation is
> > > > clear
> > > > for the supported Linux distributions, but not for the supported
> > > > Python
> > > > versions.
> > > >
> > > > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > >
> > > Can you be specific about which version of bitbake you saw the
> > > issues
> > > with? I was hoping we had resolved most of the issues with 3.13, at
> > > least in master. We do aim to work with new versions of python but
> > > it
> > > obviously takes time to catch up and for fixes to make older
> > > versions.
> >
> > With Bitbake from poky master (284a08b6e40761f) and BitBake from the
> > latest master (c9906bb289dcfd9). Python 3.13.1.
> >
> > Issues:
> >
> > - "ERROR: ParseError in None: Not all recipes parsed, parser thread
> > killed/died? Exciting." I noticed it was solved in Yocto Bugzilla,
> > but I reopened the bug because I believe it is still not fixed.
> >
> > - The problem mentioned on
> > https://wiki.yoctoproject.org/wiki/Pseudo_Abort with several poky
> > recipes (base-files, update-rc.d, qemu, and u-boot) and other recipes
> > from other layers.
> >
> > Please let me know if more information is needed.
>
> We have a fedora41 worker in the autobuilder cluster which has:
>
> fedora41-vk-1:~$ python3 --version
> Python 3.13.0
>
> As you can see here:
>
> https://valkyrie.yoctoproject.org/#/workers/54
>
> is it running builds successfully. There is therefore some difference
> in your environment and I'm not sure it is python 3.13 that is the
> cause of the problems you're seeing.
>
> Are there any tracebacks in bitbake-cookerdaemon.log? Which distro is
> this?
>
> The pseudo aborts are likely a different problem with a missing libc
> intercept or similar issue and secondary to the other problem.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6028): https://lists.yoctoproject.org/g/docs/message/=
6028
> Mute This Topic: https://lists.yoctoproject.org/mt/110278405/3617156
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [martin.jansa@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

