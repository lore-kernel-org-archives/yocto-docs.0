Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE416C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 17:02:59 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.9249.1654707776490120645
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 10:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J89J5SKl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso4724801wml.0
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=cdrFfYkmsd6l97f1F2SpJ/uC2LFUfUpaMIV6YlU2h9c=;
        b=J89J5SKl0Rl1rkj3XKvOG8cFypg+arg3iOXWVTOdAuHPPEQyYL/kV7OVMv/P2VKemv
         vNNtMANkMLOspDBDNEDjJ/hCvnG75Cclf4KS2K+7C9CGo8bausv0NZp/X9gr4XHZutTr
         l5V1eQYyDRM0Zbav6vg0r1O6JBL7j62qqI//c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=cdrFfYkmsd6l97f1F2SpJ/uC2LFUfUpaMIV6YlU2h9c=;
        b=kZVGWo5iwI5lFbJsa0AHyDjkmMHQSfDyUSJfqNVEKi5eoNMMhafrGephhyApXMxl+9
         6N/WTvbgTpBXhVyQSmLvuleYvH9C+7ynNS/eP8JYqNZMh5+BorQiu607DAki333l3Poa
         9/zBhgYKkgiNEQETDHwk4TgBaeCAFapQe3bupB2+hE7MjzGgXyM1E0wZbRJvN8RbW3NH
         YThlq78lNIUmw5oHWLdwYOvYx8XDaFKnooy2nnZdq7zpSBQ1XljuXE5CiEXJUVpHj935
         FMejlWszzq+FXMgsk6KJAtDVIZzBOtS0VwY4kS3ZlTX5jfyvf6B+w/GPN3JZFkLjf9ok
         Axow==
X-Gm-Message-State: AOAM530Irs8QfrSMu/sRZQ3oH4rW/t3orcr0Ajwvu2nJXz6XLfN2p3o8
	dTOho8mI/VWmcDoQ28PyyJldIA==
X-Google-Smtp-Source: 
 ABdhPJxrk8l/WLvYyBAtKKJrdquUuyD3Kb8wvzkkQW/TxK3JqicPkuaDWbBP+eG8jfVEJAOPpxccdQ==
X-Received: by 2002:a05:600c:1e09:b0:39c:5351:789a with SMTP id
 ay9-20020a05600c1e0900b0039c5351789amr142833wmb.177.1654707774645;
        Wed, 08 Jun 2022 10:02:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2793:ec22:da5d:8e52?
 ([2001:8b0:aba:5f3c:2793:ec22:da5d:8e52])
        by smtp.gmail.com with ESMTPSA id
 w25-20020a7bc759000000b0039c5645c60fsm7658979wmk.3.2022.06.08.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:02:53 -0700 (PDT)
Message-ID: 
 <188ce60d87bc5adc5bbadd53aee44f306b7da45c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: releases: move hardknott and honister to
 outdated section
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
 <quentin.schulz@theobroma-systems.com>, Quentin Schulz
 <foss+yocto@0leil.net>,  docs@lists.yoctoproject.org, Michael Halstead
 <mhalstead@linuxfoundation.org>
Date: Wed, 08 Jun 2022 18:02:53 +0100
In-Reply-To: <23a1213a-0753-6b13-e0af-360bf695eb57@bootlin.com>
References: <20220603133353.506482-1-foss+yocto@0leil.net>
	 <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
	 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
	 <23a1213a-0753-6b13-e0af-360bf695eb57@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jun 2022 17:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2972

On Wed, 2022-06-08 at 18:46 +0200, Michael Opdenacker wrote:
> Richard, Quentin,
>=20
> On 6/7/22 12:22, Richard Purdie wrote:
> > On Tue, 2022-06-07 at 11:02 +0200, Quentin Schulz wrote:
> > > Richard, Michael(s),
> > >=20
> > > I have been working on automating this release page so we don't have =
to
> > > maintain it (I stumbled upon it by chance).
> > >=20
> > > The issue I'm having right now is that we are missing a handful of ta=
gs
> > > in yocto-docs which makes it non-straightforward to order the release=
s.
> > >=20
> > > +# list missing tags in yocto-docs
> > > +missing_tags =3D [
> > > +        'yocto-0.9',
> > > +        'yocto-1.0', 'yocto-1.0.1',
> > > +        'yocto-1.1', 'yocto-1.1.1',
> > > +        'yocto-1.2',
> > > +        'yocto-1.4.4', 'yocto-1.4.5',
> > > +        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
> > > +        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
> > > +        'yocto-1.7', 'yocto-1.7.1',
> > > +        'yocto-1.9',
> > > +        'yocto-2.5.3',
> > > +        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
> > > +        ]
> > >=20
> > > Those seems to be the only missing tags (didn't check really carefull=
y
> > > though, so might be missing one or two).
> > If someone can work out the commit for each of the tags we can
> > definitely tag them. We should be able to work that information out, it
> > is just a bit of a pain to do.
>=20
> I could pickup a commit whose date matches the date for each release, as=
=20
> found on http://downloads.yoctoproject.org/releases/yocto/.
> I wouldn't be 100% sure to pick up exactly the right commit, but would=
=20
> we care, since we are not going to use the tags to regenerate the old doc=
s?
>=20
> Then, I could create the tags and push them.
>=20
> Any better way? As far as I've seen the old release notes didn't mention=
=20
> the documentation sources.

There is a better way. Taking yocto 1.2 which denzil, you can see the
release tag here:

https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&id=3Dd20a24310eb43fed9=
a3f3e75752c9ad45a18cbe4

I appreciate it says denzil-7.0 which is a poky version but poky 7.0 is
yocto 1.2.

The last commit to docs before that commit is this one:

https://git.yoctoproject.org/poky/commit/?h=3Ddenzil&id=3D7e56770a6024e51e0=
a23ce0139b349a843200404

and that says in the commit message the corresponding docs revision is:

b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96

so yocto-1.2 was:

poky d20a24310eb43fed9a3f3e75752c9ad45a18cbe4
oe-core fd989e1bceef6df36619ba8944c8141abefd282e
yocto-docs b3fc2ec7c5aedb8ea0a2d502bdcd7e8f4092ed96

A bit of a pain but we can reverse engineer these.

Cheers,

Richard




