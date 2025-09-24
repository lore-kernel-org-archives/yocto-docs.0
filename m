Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33A8CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:52:10 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.23666.1758743525280928712
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 12:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MoApqr2k;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-799572d92b0so1197096d6.3
        for <docs@lists.yoctoproject.org>; Wed, 24 Sep 2025 12:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758743524; x=1759348324; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ahgjg3sO/SjrDxJmC3bILY+t21Xz4yC7sAA7OhRDr2I=;
        b=MoApqr2kh4oJGX6yISc4Dnh82ZSVMs8shx/AbDXbStZzX6jri12EldJeh13/Q6dF0R
         E0x95gd670TUVu1Vvl5b9nfmenhl4cMYkujnGRUbrfCj+r4gR/RvRZQyxdhHSkzkXzP2
         VKNJNITSJlcM7eJ20SJmoXmhUQCEq/00Qq/D6Gi+yur9VhE+XPhfFUb8ve2NiPl6joQX
         PiqIJF2DalgR5M07kn4mRZvcVRf5SSTo0YhMW+ixqX8vGyxK3Bju2LpQIsthE8s3ULaz
         FEg+OP2HukgMZH9hjy5rWnjEXqIyZJXKscPRf9/uuNprsk+RpEUP7wWN+PUbgP7sWKJI
         lcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758743524; x=1759348324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahgjg3sO/SjrDxJmC3bILY+t21Xz4yC7sAA7OhRDr2I=;
        b=p95ehupbxojvqBGmnF1eXKFuVU2XYCLUrYu37Itjy6URMpYNR7pe4X1uexyp5hgNcB
         iQVjCoNyH639BaxSpjGPjazjJMP1EX/Nd1QnXGtm/ipoQpDEexdlFVJD+SArhgvYzraL
         3mC+2cF92IvXAHaM2/nz/yiKjWf0GHo4tg3TVYkIRctutpD++YQTg/O4j/xVyXdW37LV
         t9PbsWYT3qFRA9S6rl4YiAJQ10rDlHoZdXrEX+2uk/gD8OtNeZLfGINtpcBpSPUMR5sn
         2DNMoPCdA5KF5x5gmtWjno0CQxgNHr4p8Y2+RwrjAcO5vwISd0Q9pN714D5/X+4TMxNm
         o2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVkEgm8yNwWcF1W6JMWH/uwqugT9srEOG5zq3BARADxI9jz9prEuLsHlBrgGo0d6vonTW8C@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwRb+dL8RhgO0zbuJURHSjgj7X2yQAZCAQECeeI6YS5ZmtW0Qvj
	pybuCK7fZ2olg8dluSuXxgQ/aYa2seHXa9fRfwPRWpgjwruS8uNuAzTDAxOqvDRUVys66nWbRqv
	mJtdClO6Ib37C0zBQDxp0GdRnendO++Q=
X-Gm-Gg: ASbGnctFn/aiwSlE+Ttj3Ep72rnODRTnFfMx4XkIbSuDl85Se+CnYRlJPrH0G+rrxFn
	VfAcX05mepDzydDJtO7gEURoFDsuuM1Sh+/1vXMSurZn1rA6x3HTJLrOn1CxGZ6wWjZOm7UQovI
	xNDlrnedMEZHMySclwsn1FwYiq/Yz3n7fk3/25yrrYe9Xww6mXl6s4i9XLzGwliXQIT7RSaxTB+
	s2HxaawrONwxurXzdbeh8sdbiStn0t2KEybM4Y4FAWTBSBkX35o0z2UPlhHAGWsts8nJ6IG89kY
	96mGi8oD4fyYOl6PxgQF/crQwsQnJukPr5sGrON/
X-Google-Smtp-Source: AGHT+IEm2y/PtPJ7CiFFhc5BPhWXsTy78tLh+8PvXOvMHxIExWJvv2k3Zdah7ADc4vAsrpIR/IaWQIWlruETlYuOzjM=
X-Received: by 2002:a05:6214:21c7:b0:7cb:4f0e:4950 with SMTP id
 6a1803df08f44-7fc3aa7209emr20810726d6.34.1758743524100; Wed, 24 Sep 2025
 12:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
 <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com> <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
 <54e542b206ab91899c967db38d001bb4b3a87e06.camel@pbarker.dev>
In-Reply-To: <54e542b206ab91899c967db38d001bb4b3a87e06.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Sep 2025 21:51:53 +0200
X-Gm-Features: AS18NWBE40ERDJ9XVmoxy_SBTGS5vo8YNIq5mrIveXq2uqK5RAbfsv4QKP2o54Q
Message-ID: <CANNYZj8VTDM4vtsJ0FjiO=F06_ggcS5BAyibS5rzy1t4YUbwOg@mail.gmail.com>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup info
To: Paul Barker <paul@pbarker.dev>
Cc: antonin.godard@bootlin.com, tim.orling@konsulko.com, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Sep 2025 19:52:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7590

On Wed, 24 Sept 2025 at 18:34, Paul Barker <paul@pbarker.dev> wrote:

> Is there also a plan to document how to create the conf.json files for use with
> bitbake-setup?
>
> I tried to use `bitbake-layers create-layers-setup ...` but that doesn't seem
> to be the right way to create them - the bitbake repository was not included in
> the generated json file.
>
> Apologies if I've missed something!

I don't think anything was missed. There are three still to be done items here:

- extending code in bitbake-layers so it can create a full
bitbake-setup config from an active build, rather than just the layers
bit (what it does now is intended for the oe-setup-layers tool, which
is a sort of precursor to bitbake-setup). I believe all the pieces can
be programmatically obtained: particularly active fragments and the
list of enabled layers.

- documenting how to use that;

- documenting how to write advanced bitbake-setup configurations by
hand and the full range of syntax and features.

Alex

