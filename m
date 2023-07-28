Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B57EB64DD
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 22:29:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.44446.1690583339534117215
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 15:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NerdjE4b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so28773015e9.1
        for <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690583338; x=1691188138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BSjiSQQLVG+USmW9Yf98S7H7rghWlG1xrG0xn8Tn57M=;
        b=NerdjE4buavoDiW4uFXAr5D1RBBz1lNkfi2faULbljTIWn9UqlLmOOBb2oMvSpJ8Cf
         GZVgTtoJJL6Ens/pfcKSuTytSQgTmbZzx2kYe6BR7TSEq2rJsG/e4iOyG2Dc7c3DwtAM
         2ALWKnr040QHfeHw+TwBvDZXpLS+4MwXg77cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690583338; x=1691188138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSjiSQQLVG+USmW9Yf98S7H7rghWlG1xrG0xn8Tn57M=;
        b=FKniCBbmZ8JO3kYNiEf8zQbgNHetn5vSX+64ONvAQW74e9riozFbFNBueXmOfN4oVu
         h5GQQR7BuWzjtuKPubns35OKwhZhZfK8nrmyZOLfXps8EUd0f85qFiRDti2PkObK3IJz
         +2xtdTuiBwh2no9j6gNW3nOnmRY/ibe8OyDDVMGuOjBPwpWj//Plklaw3mkBkxxYohws
         aK5bjpyqoe727OtgS1BFGeed4QruF6NYOvmrzAtBg5AjqY1qptFKtxToNErlzPe4MD81
         5ZMB1pUVysetCzDNFFcYSj7u0I8pqmimTcpQTJOsu4UiJrZ0oZlreNd8vUJGfK4xB+r+
         U6nA==
X-Gm-Message-State: ABy/qLaidasYu+nGHQnegYPYY2aWh06jJImi6IjIob+1X5MNQTDhdoUg
	tJPHjbzrm+lqy2Qa5nKTpMkP3A==
X-Google-Smtp-Source: APBJJlFhSdeFaW0Q7ON+pKBS6uqtubGP5MZ66zp0BMlPZdhMZWctzH59VKcKxESuxxlKeYEmUgjcJw==
X-Received: by 2002:a05:600c:210b:b0:3fb:fb88:974b with SMTP id u11-20020a05600c210b00b003fbfb88974bmr2789862wml.6.1690583337887;
        Fri, 28 Jul 2023 15:28:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f929:4921:3439:ee63? ([2001:8b0:aba:5f3c:f929:4921:3439:ee63])
        by smtp.gmail.com with ESMTPSA id k3-20020a05600c0b4300b003fc015ae1e1sm5177418wmr.3.2023.07.28.15.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 15:28:57 -0700 (PDT)
Message-ID: <d2220020c5bacc6086be6417c43f6555d7283749.camel@linuxfoundation.org>
Subject: Re: [docs] Updating the list of sanity tested distros?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, "yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 28 Jul 2023 23:28:56 +0100
In-Reply-To: <1fdd238e-b14b-6f85-db68-07eeea3e2726@bootlin.com>
References: <1fdd238e-b14b-6f85-db68-07eeea3e2726@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 22:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4085

On Fri, 2023-07-28 at 20:41 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Greetings,
>=20
> As far as I understand, the list of distros that the Yocto Project=20
> supports (or should claim it supports) is the intersection of the list=
=20
> of sanity tested distros (SANITY_TESTED_DISTROS in=20
> meta-poky/conf/distro/poky.conf) and the distribution versions that are=
=20
> still publicly supported by their vendors (as checked on Wikipedia).=20
> There's no point in claiming to support a distribution for which package=
=20
> updates are no longer available.
>=20
> Currently for master, this intersection is only:
>=20
>   * Ubuntu 20.04 (LTS)
>   * Ubuntu 22.04 (LTS)
>   * Fedora 37
>   * Debian GNU/Linux 11.x (Bullseye)
>   * OpenSUSE Leap 15.4
>=20
> Here are a few obvious absents here:
>=20
>   * AlmaLinux: version 8.7 and 9.1 are still in SANITY_TESTED_DISTROS
>     but they are obsolete. I see an AlmaLinux9 worker on
>     https://autobuilder.yoctoproject.org/typhoon/#/workers, but I don't
>     know whether it's 9.1 or 9.2 (not obsolete unlike 9.1).
>   * Fedora 38: important as Fedora 37 ends in November. I see a Fedora38
>     worker, but there are still failed jobs, even though the majority
>     are successful. When is a distro version ready to be added to
>     SANITY_TESTED_DISTROS?.
>   * Debian 12: we also have such a worker, with a mix of successful and
>     failed builds. Is this version eligible too?
>   * OpenSuse Leap 15.5, as OpenSuse Leap 15.4 expires in November too. I
>     see a worker, but with only failed builds.
>=20
> I'd say that the most urgent one is AlmaLinux 9.2 as otherwise we don't=
=20
> support AlmaLinux any more. The next ones for the end of the year are=20
> Fedora 38 and OpenSuse Leap 15.5.
>=20
> Would you have any thoughts?
>=20
> I was about to send a documentation update to declare that master (and=
=20
> probably Mickledore and Kirkstone) only support 5 different distribution=
=20
> versions, but a longer list would look better...

We keep seeming to discuss this but it is really quite simple, we
document what we test on.

We are currently testing on alma8 and alma9. I don't know which version
of alma9 but I'd suspect the most recent one and we can check. We can
list those until the workers are retired.

With regard to the failed builds, the question is whether the failed
builds are due to the patches under test or some underlying issue with
those systems. They would not be in general use in the pool if they
weren't able to build master so it is fine to document all of those
there for master. I'm sure the failures are due to failures in patches
under test at this point.

The exclusion list for older releases can be and is different as some
workers are not enabled for some releases. You can see the mappings
here:

https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py#n160

i.e. mickledore is matching master so far and kirkstone isn't using
fedora38 yet (for example).

Cheers,

Richard


