Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B201C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:25:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.10461.1647959122910788631
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FbSv5lBG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so2944844wmj.0
        for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5c0tQjxjyAxZlJuaCQKF1HaIqDnIc9D9bbNXmsUJWJo=;
        b=FbSv5lBG8LH4CJxMCi107Lxh9IDZGaYn/czz58yN9CKAr3CrCQWhKVWtQZyTAo+S5w
         xKY41+htSNroiezPW9Z+2wz755WcQXZPO5ojapyibJ/OFuMhICRoj8UsabgKQ8LNx5aE
         Xx8qIJqxss7YZif2KmuqpVrlDHB+0X91oVk2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5c0tQjxjyAxZlJuaCQKF1HaIqDnIc9D9bbNXmsUJWJo=;
        b=vuuawOzBZP96kf6URTw9yUQWP439D7eaJkHiuHkEuFjI7rHZDOnUF/9dfvdDlwnggR
         E5q5NHF9uFwDjeW15gPje+Pe2MJqjoqOqga979uUOXietw1ZwCSlkgW/YmGR7FhCgCKK
         /s1B1GHEmch7m+cfgTLoajfiXzoOwWZi1G5oTkYwS8E1IeyJnJTQBKK1s/97LMU4MiyT
         95Dd+tb5zAK77cJ8qqCbPuiiVNa6Jn+37Wa117AQ42ihedzg5uQhLu2tYNCefFydG8QY
         wp+P/SQTTY5TABmKpu3jlvWLhd/fJhkEBZcCLDb+FthniV6y2FGeJYMJIzwES0LJknQa
         9dnQ==
X-Gm-Message-State: AOAM532w/MPFRQ4Yzm1oFiwzUtQXQ24atYFe8nVYiDjvtlz2e0V91ymw
	UMZXtwlcjlhcL8xMlnwSdPEqaA==
X-Google-Smtp-Source: 
 ABdhPJzOT0a2hicB/Tj3WuWICYRTPA58zIvy3jIRxGNhnf0Vz7V9fV9mbDWUrZattqsfTvr07OpN0g==
X-Received: by 2002:a05:600c:4e93:b0:38c:92d9:c7bc with SMTP id
 f19-20020a05600c4e9300b0038c92d9c7bcmr4006444wmq.173.1647959121202;
        Tue, 22 Mar 2022 07:25:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4096:7441:f015:a6fe?
 ([2001:8b0:aba:5f3c:4096:7441:f015:a6fe])
        by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm4898151wrr.100.2022.03.22.07.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 07:25:20 -0700 (PDT)
Message-ID: 
 <9a19dcfedb95816a40a967bc87fa54f3da62fef3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 0/5 v2] Proposed docs version changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Date: Tue, 22 Mar 2022 14:25:17 +0000
In-Reply-To: <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
	 <CAP71WjxAtVJO2YvM3p4UM1TEYuqmM7TLpDo5kRytp+G=kQhSgA@mail.gmail.com>
	 <ea41470f551f80509c947bf074eee5b29777953e.camel@linuxfoundation.org>
	 <bc6e6ce9-2287-cfd8-a3c7-6d9f54ecc1f9@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2681

On Tue, 2022-03-22 at 14:58 +0100, Quentin Schulz wrote:
> Hi all,
> 
> On 3/21/22 23:06, Richard Purdie wrote:
> > On Mon, 2022-03-21 at 22:56 +0100, Nicolas Dechesne wrote:
> > > 
> > > Would it make sense to implement what you have in set_versions.py directly in
> > > Sphinx 'native' code ? e.g. directly in conf.py, or in a module loaded from
> > > conf.py (see how kernel does it at [1]) or yocto-vars extension, or as its own
> > > Sphinx extension?
> > > 
> > > poky.yaml only purpose is to be loaded by yocto-vars.py which is a local
> > > Sphinx extension we created.
> >  > Possibly, yes. I've done it like this as it was easier to validate it 
> was doing
> > the right things and also easier to apply in retrospect to previous docs
> > releases. What we want to do going forward is an open question and it does feel
> > like that script would be better off as a module that at least for master, the
> > docs code called into.
> > 
> > I think that would make most sense as a follow on to this series if/as/when
> > people have the time to work on it and test it accordingly. As it stands the
> > series was already quite painful to develop (I got hooked on Friday and had to
> > fix it on Saturday whilst I still had the pieces all in cache).
> > 
> 
> Agreed. I don't think this patch series makes the doc building situation 
> worse than it currently is so there's no reason to hold it off. Makes it 
> even easier on stable release maintainers so it's good :)
> 
> I just would like the behavior to be unchanged wrt versions listed in 
> the switchers.js, the rest is fine and can be modified later on.

Just to be clear, you mean adding gatesgarth and zeus back?
Or adding the current version and the current version series?

I'm going to assume we're talking about the first and I'll redo things to try
and do that. I've decided I'd better retest everything having done that with the
side be side comparison so it may take a while :/.


Cheers,

Richard



