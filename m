Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C77C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:51:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.10153.1639396290206539309
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 03:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PI+VDZ3G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so11429717wmb.0
        for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 03:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OI5rqE2tI1t/Kun5gdj4KKA6ypjWJgrFxDk3il+TFlw=;
        b=PI+VDZ3GUzqYneMlTTP8xANAhbVmsueY0k/wzCtuwNGdqBVOXvNYS/R9UGMRQvOPji
         0n96HTWdUIQDfKP/vGukpqgFSaC126hJ9jBxsQQEtty1MTBPu/MBQl2DCX5Bb4NkrnqN
         nDObrsl4/E/AMUfw1wk0L7XwhKCCDbfM2D3So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OI5rqE2tI1t/Kun5gdj4KKA6ypjWJgrFxDk3il+TFlw=;
        b=Gx7RpEfFFwgZDOUiFdfeeu619b6cGoaO6/lyCeZ5RcJKnm2vRQv0HwwY+v1sSY4n0x
         LgWhXQ39ScPSuxUOdBTDvicLCmhpZKGM6855xdBBa5jBTX7QeZ4UT4DnpVmyyWFpbK9Q
         PfYK0ukm9OVw1yfnhMMjor5xvAy1sn4MCvZsqUYJgexxDV2LsiO7t/nplt/88ptfKMwC
         WN72vgreMXs6s2myhSwRMQWs8vM2b1hK333v73GS3hmCQljBEi/G8IZW9JA122GdMRYB
         Ry8DqPK486YWvt7bGtuys4x/oDMsDQBYEe8ogSMtV5Q3M2g8OVYLTVqCAaROUtMoFAKD
         SRjA==
X-Gm-Message-State: AOAM533IcbVFtdRgjb1ZKRaMmQNTHxYJmKhgltN9asAxJ91AW3XoFslO
	xNtg/ojqmhwwolLtkHRko+lL+A==
X-Google-Smtp-Source: 
 ABdhPJwiFrEDJJWJT9/fx/iX7EwYvqbdfvYlkd4iUk5uG5CSyvo+Z7KyyFkXkcDyovIYgWtP5K94yw==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr36580146wmg.71.1639396288625;
        Mon, 13 Dec 2021 03:51:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b02:a00e:9008:375e?
 ([2001:8b0:aba:5f3c:9b02:a00e:9008:375e])
        by smtp.gmail.com with ESMTPSA id
 w15sm10443270wrk.77.2021.12.13.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:51:28 -0800 (PST)
Message-ID: 
 <c0fd1f79b143332949139c32294a41ffa3d54a7e.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <foss+yocto@0leil.net>, docs@lists.yoctoproject.org, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Date: Mon, 13 Dec 2021 11:51:26 +0000
In-Reply-To: <20211213095440.qwg6cczqbfdr7fdl@fedora>
References: <20211206150401.30444-1-foss+yocto@0leil.net>
	 <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
	 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
	 <20211213095440.qwg6cczqbfdr7fdl@fedora>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 11:51:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2242

On Mon, 2021-12-13 at 10:54 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On Wed, Dec 08, 2021 at 10:45:41AM +0000, Richard Purdie wrote:
> > On Wed, 2021-12-08 at 11:41 +0100, Michael Opdenacker wrote:
> > > Quentin, Peter,
> > > 
> > > Many thanks for the long patch and review !
> > > See my comments below...
> > > 
> > > On 12/6/21 4:04 PM, Quentin Schulz wrote:
> > > > -For automated deployment, a "master image" is installed onto the
> > > > +For automated deployment, a "golden image" is installed onto the
> > > 
> > > 
> > > I was about to suggest "reference image", but all things considered,
> > > "golden image" seems to work better.
> > 
> > I don't know if it is just me but "golden image" really doesn't work that well
> > for me. "controller" would be the terminology we use elsewhere, e.g. the
> > autobuilder. It says what it does...
> > 
> 
> I'll have to read a bit more carefully but as a non-native, golden and
> controller image both don't carry a meaning to me. Like, I don't
> understand what it's supposed to represent (same for master BTW).

In the case of this QA automation (the context where this is being used), the
context is that the controller controls or has authority over the QA tests that
are being run. As such, "controller" does say what it is doing.

> However, "golden image" in your favorite search engine returns something
> related to our field of work and you can more or less grasp the concept
> without spending too much time. Typing "controller image" returns images
> of game console controllers :)

I understand the concept of a golden image but to me, it isn't really a term in
use in this area of the ecosystem and isn't as descriptive as controller.

> In any case, two things:
>  1) I should try to figure out exactly what this image is for,

I think when you realise it is used as one side of control interface in the QA
tests, the term controller becomes more appropriate (and consistent with our
autobuilder testing too).

>  2) Maybe a more explicit definition would help non-native understand a
>  bit better without digging too deep,

Agreed. I'm still torn on whether we should remove this entirely.

> There's always something we can do better :)

Right, I just feel a little strongly that we don't want to inject new terms in
here that I don't think people will widely understand.

Cheers,

Richard






