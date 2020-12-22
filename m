Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.10284.1608637239691055480
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 03:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HE/XCOJk;
 spf=pass (domain: linaro.org, ip: 209.85.218.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f54.google.com with SMTP id lt17so17848140ejb.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 03:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWZPq10WK302NjZQEVEez/hgeZIqrkjwydIiQrbz11M=;
        b=HE/XCOJkv64gmsYNO0SsBaJ/4lB2afzmIrFTJb7pwuBf4FYtVdVjtWBMOHFngOO1/q
         BOOobRqwdfEsZBQzJBRrn01jBle19rx6mpgMd+zczP0MVd6YDQLcrlAT81ma/IR6ioxR
         di4cL22FExPXmujdArm9lOssJbYEAQYMvZ8WNzFzYB4KGP7lYHh4Rq0MWuNgMvAE2CSb
         4056OANKDzMh6in/M3IdfjuULsE5ou6ewbCj5bUBe6SeKtRcAYNKYCgoCHq87C7pXiRc
         7DWPEcISHUm6SnacqIU+5RI2gYnDIg08niE8UbCefZe59lzvZbn39NCgrpRIr7qLz43C
         n+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWZPq10WK302NjZQEVEez/hgeZIqrkjwydIiQrbz11M=;
        b=InL0W2maqloOdJ6+L5MYtPKjuZ1gZYhAtZgDN7wY5S1TKGKwV68iRd4Tn1W3i96roc
         sKJ1Y8/2LJTDqkJxgrmRZ8k65eaQHFHn2HaAPyov1hJSd8NbUBbb2eIfiEDUP7hA21n6
         5YdVLviIZe1CeqyIVFazZc91j1q1N49k3UATeS8AcUNdhdjywmWK4qxIaIAyN3q4XtT+
         HTzqhIT5HCxaiy8pwuHuSid1U9n5jmamHPtK2SxD4EO4CADxKDogOL8X+Oc+SoUdN/es
         esDVJPwEPXj5dgjV9P975Ozvv7GrgN4izQJ6K/nNxHBZj9Yt+DMTMyuDPfm7KdCmnLWS
         h+Ew==
X-Gm-Message-State: AOAM532Z/0OIHGq/MecfP8FmNrmID/rtnjGDE5xIDqpHI7y9i5WHFA85
	VaIFCO79Jvtn2uJpK+Vu3set8INZwVAy208IZFxAPw==
X-Google-Smtp-Source: ABdhPJyDNDOPRwzjzv43JCbGWx6xTlLfzLuhhvc0oLs3nYkbvytmiHQOlUYUhcXlreCMb25AbU+/wYgPxwbIjSkUI74=
X-Received: by 2002:a17:907:4126:: with SMTP id mx6mr19215921ejb.91.1608637237929;
 Tue, 22 Dec 2020 03:40:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
 <2a491bf195731319b9fa3bca15b95f7ce8342af5.1608598606.git.paul.eggleton@linux.microsoft.com>
 <20201222093924.gdmvccls6xd7bme7@qschulz>
In-Reply-To: <20201222093924.gdmvccls6xd7bme7@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 22 Dec 2020 12:40:27 +0100
Message-ID: <CAP71Wjy-yTnQ=02bu_VXfbqSCuwBFSQ2=Y42zZ0LK1hezXv84w@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/5] variables: Add documentation for new kernel-fitimage vars
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 10:39 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Mon, Dec 21, 2020 at 05:06:03PM -0800, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> >
> > Add documentation for FIT_DESC, FIT_SIGN_INDIVIDUAL, UBOOT_MKIMAGE,
> > UBOOT_MKIMAGE_SIGN and UBOOT_MKIMAGE_SIGN_ARGS.
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >  documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 8f7f86e..607ebfe 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -2538,6 +2538,14 @@ system and gives an overview of their function and contents.
> >        For guidance on how to create your own file permissions settings
> >        table file, examine the existing ``fs-perms.txt``.
> >
> > +   :term:`FIT_DESC`
> > +      Specifies the description string encoded into a fitImage. The default
> > +      value is set by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
> > +      class as follows:
> > +      ::
>
> The two lines above have the same outcome as:
>
> class as follows::
>
> IIRC. I don't remember if a patch was sent by Robert recently nor if it
> was merged (does not seem so?) but we strive for consistency on this one
> by having all :\n:: migrated to :: at the end of a paragraph.
>
> c.f.: https://lists.yoctoproject.org/g/docs/message/557

We agreed to do it, I haven't seen any updates/response on that
thread. So as of now, it's not done..
As such, I don't think it's blocking for new patches.

>
> Thanks,
> Quentin
>
> 
>
