Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E89EC433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 13:30:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.8339.1634909414020149186
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 06:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=MqJWSclb;
 spf=pass (domain: foundries.io, ip: 209.85.221.42,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-wr1-f42.google.com with SMTP id d3so912528wrh.8
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZ10TWO4+8//0XnK/tXJMyaQ4d8V48lnj1cNqfu0m6o=;
        b=MqJWSclba37OOjqoiWvlMFuqAxqknV+/u1F7dvy6FvoeDz87RLbXIVnV42zsQ6HeeS
         0nrc8l6TYMO5PnD5K/buFse1IHlMMjoY4UG9uY98BkOZoVOMnMx+Svxfx4WEVdDYBg9Q
         LmpJvONRTn+2wdp1j0zBi16UcTSpCtHkA5AGmhXXCLhOOS/0mPNoSon89WzuT8gf26Qa
         sHex3/nBKsohT+pLiH+TOI0dfcLi/+rvSpegZgz8cFVlvlzG0rotPJqlkoMeQYrLFeRu
         xhqpmld2P4GG1Aq2mlHIra9ggOEwhEMXXOFEnnKVLOPwsQGly4hMqnaF3VN+3AhCQ1Ss
         elCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZ10TWO4+8//0XnK/tXJMyaQ4d8V48lnj1cNqfu0m6o=;
        b=iqygVppsEExEsSQOiImbVl2ngjaUJ5MbcPsxOd72zE80vrb68sLpx+1tARQSd0YhWE
         MSsrSopDBvTr47chIKWG6/tL9MofopT9DnfLbIwcAwLqlCG9gcqpuScPI/q87AwfUibE
         hy4TkHpxDilmbxWs7Uw+1xZefTXQGy6laJbs2moOWhLVnM+QM8uEDPeYkRKW3SPf7JS+
         o1xSyvJAbshdLRUnuvw45Y2FZlxKJSztK1tR6frQpEoBVhHd6YpG/oQm2lHQyYF97jrz
         ohIFwbzfXecxmF/XI8a6Zxqw/6FiN7seTOO8RemOL4ekRxY+R8lFWwffWt+kGhaJHkHe
         13wA==
X-Gm-Message-State: AOAM530s8nYNq9LgYAECsRuMpbUu6OyohgFA5ILuT/BA4BObZ4SGQdqS
	bUXe2sdKWgl6s7yoHtBowIXNJ5NLHp+pwJt6kD158g==
X-Google-Smtp-Source: 
 ABdhPJxgTrma1tXEogRGzLLynURs25frhO7UvU21+Ado696nfR/Mi6ZXXIQVmAEBI2M8y4YBP/egsrlMHOgijOc3SZM=
X-Received: by 2002:adf:e80a:: with SMTP id
 o10mr15215630wrm.322.1634909412194;
 Fri, 22 Oct 2021 06:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211021181604.4077605-1-daiane.angolini@foundries.io>
 <a2d5ad1e-9c33-0a03-12fd-0e2f59ce9674@bootlin.com>
In-Reply-To: <a2d5ad1e-9c33-0a03-12fd-0e2f59ce9674@bootlin.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Fri, 22 Oct 2021 10:30:01 -0300
Message-ID: 
 <CA+HEL79Y0h-DW7QQx-7VMrv96=zXkF44jjHSVYjCmaXiMrJS8w@mail.gmail.com>
Subject: Re: [docs] [docs v2] ref-manual: Update how to set a useradd password
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 13:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2039

On Fri, Oct 22, 2021 at 4:25 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Daiane,
>
> Thank you for the patch update!
>
> On 10/21/21 8:16 PM, Daiane Angolini wrote:
> > Partial fix for [YOCTO 14605]
> >
> > Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> > ---
> > changes since v2:
> > - changing suggested encrypt algoritm (512->256)
> > - resultant -> resulting
> > - closing quote around ${PASSW}
> >
> >  documentation/ref-manual/classes.rst | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index 79af45ada..8747c4b08 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
> >         "
> >
> >  Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
> > -passwords::
> > +passwords. First on host, create the password hash::
> > +
> > +   mkpasswd -m sha256crypt tester01
> > +
> > +The resulting hash is set to a variable and used in ``useradd`` command parameters.
> > +Remember to escape the character ``$``::
> >
> >     inherit extrausers
> > +   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"
>
>
> Shouldn't you update the hashed password too? The above is still the
> output of "mkpasswd -m sha512crypt tester01".

I was never sure on pasting the hash to the documentation. In fact I
would really prefer to find a way to fake a hash

Because I think it's important that the reader create a hash.

What do you think if, for example, I use something such as:

PASSWD = "\$X\$ABC123\$Along-Hash"

I don't know, I don't like the hash copied and pasted in the example.

Daiane

>
> All the rest looks good.
>
> Thanks,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

