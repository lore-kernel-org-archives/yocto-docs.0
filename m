Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B011C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 15:48:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.11084.1634831312373407558
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 08:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=RCyoPnch;
 spf=pass (domain: foundries.io, ip: 209.85.128.50,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-wm1-f50.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so223597wme.0
        for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXiidSUCK10cjNJKByfwkLAt1PHuDqPKBc+VOSx4ip4=;
        b=RCyoPnchaKIPSemr/BZxfme9oU3OAHqgnlPuFoVulj7bY11AEfooVSYzMr28Fvnqhv
         IKV2U6fzcTS7e/RM1eJQuU7fPQKhN8u7Oz+tS+4TA6zALnfMdXDNepbcu6xcrz49tGuy
         3gqGuRto1kSp1lJSAmCA4romD+dXQNgqx9tfGfSU1Ryi7Y1XA40MPXsvJpnl149OADek
         qRj0CUiQsZ3ytFYfRhdIUaC8vEwc988cZLveOBdOLbbel3q01Ehed7k5euf3isDxWB3E
         MyfZOAmIcBJyWM3Tryaw+re33iDAZ+x7dl2GYjbjB88cdArWVjYqYIp7NTtThafadtg0
         nShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXiidSUCK10cjNJKByfwkLAt1PHuDqPKBc+VOSx4ip4=;
        b=jfy3Dd4LgACiwBPHjGuJbnONf1doAmWbCvh0pxruuzN3iRNdKYTrjdOstMizfH1R/3
         HCPTNAI3i56Q+5uBbog7YUog+XXnrFHi2NRNHca750hIG5Y05xz59uYv4RqCd6i8I7sD
         3BD+O/K5uhJXN7X1h4OmFuN4w2uz5lkI+AhhoAszw+qPUMYFYkwnmYXWEywXI7Wj2Jp+
         8lpB9PNehaiKC+STsn7vHAqDzhBp3RAQDOrpXcCfdVZ4zKtae7c8clth9a3a8RMcdUIB
         /aKneq1G1bXXX67RGGmbm07UygRMOS5hcAdUgeIX7xWPQEUsS2bI6MDlRVqV1DF3spAm
         sjlg==
X-Gm-Message-State: AOAM533RfQ5eLdeQBTYdx4bjmsmKs/k/3fVEeZXU3rIcyl/HjQqUC9LL
	ZvYc2yM7zGr8aAxlj0h0sGu9dP0N9PJhkBcsZdw9rg==
X-Google-Smtp-Source: 
 ABdhPJy/O6Ch3QyvtFWWRD5v1AfdtHLbVdQU1veIT4MRDfx2IRRHL21DZrlYRcJVmzNbV/mJpeqk57PWGbtDS1EEj4g=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr22407532wmb.101.1634831310780;
 Thu, 21 Oct 2021 08:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211020170549.526108-1-daiane.angolini@foundries.io>
 <16B00E4412FB3143.5910@lists.yoctoproject.org>
 <73eda9d8-01b2-36d4-3f21-906971b76f52@bootlin.com>
In-Reply-To: <73eda9d8-01b2-36d4-3f21-906971b76f52@bootlin.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Thu, 21 Oct 2021 12:48:19 -0300
Message-ID: 
 <CA+HEL78MgeFc-mwWXqsWbN32F-d6L5U3k-iRjDoMxpmWdSHotQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: Update how to set a useradd password
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 15:48:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2027

On Thu, Oct 21, 2021 at 10:32 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
>
> On 10/21/21 3:19 PM, Michael Opdenacker wrote:
> >
> > And when I tried to log in with user "alice" and the password, I got:
> > "crypt method not supported by libcrypt? (SHA512)"
> >
> > Not sure our instructions are enough here...
>
>
> Actually, if I generate the password with "mkpasswd -m sha256crypt bob",
> everything works fine. Not sure libcrypt in Poky's "core-image-minimal"
> is sufficient.
>
> What about using sha256crypt instead?

One of my sources of doubt on the initial patch is exactly that there
is a whole world around how to create a password.

And the main purpose of the patch is to inform one that a clear text
password is not supported any longer.

So, from my perspective, it's ok to use your command instead.


>
> If you don't have time right now, I'll be happy to propose a V2 of your
> patch if you are interested.

Let me work on this today! I think I can handle this. Thanks for the offer =D

Daiane
> Cheers,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

