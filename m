Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EEAC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:04:31 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.32229.1661263468207912476
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 07:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iEcdTTwr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id m2so3004027qvq.11
        for <docs@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=3D3ccWla03Q1j6PDVt6Z3kDGh8+kLsb6K/+ZIKWav90=;
        b=iEcdTTwrL7wmAPRlxbg32jjT3dJmOu9s2cKj8HqMMMzd4ONYdh/1A2DSXk1yL8b0Mo
         OzI64zYtjiO/s+1T4aeja3qFDUa5V1r/RrAMw/Sylg7HJebR5KjcRvw/0NHFCJBmceEN
         9rejU7eCdxQ2jOiQBHYpBkxcR/fsYKLZe8UAiEQBfpz9/dlUm4xr/G2902v9c/8/+PcT
         YVp+JGkXo/zyAmfj9EuTs05dgtLTcTrx8vVVGLim0gqMhmzlHzZfCYlOfQx6G4h4Z61c
         W/yZmBBgsLJZiV3jW4gLeLuNjfWW9DDs6Sdrah7UPJo5RjMG05ZK2T9PUt/5DAqoPdP4
         nejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3D3ccWla03Q1j6PDVt6Z3kDGh8+kLsb6K/+ZIKWav90=;
        b=Di1e4tUILv8BEJtlld0pf+HK3S8Ps7BTolqLXaqNigJfKYTXgfH4gMDjrKD7k4D9N/
         +GCFRCkkaBiPEXpoSHJS9Gv/Jxclqw3Tg6o7Bf39iHkgNLr9GPvMQv33ty2pvP+SLMfx
         iBQ7FXEfeTe/YS2/bahrTr66jfR8NBV+DQCHPmlyaxAcK5JNTAW8oLJ57YiH8mYuTnd4
         BhXAe0nc4EfsyF9SLNnR4SwLZiQrAK20wpA4elJG+uNIV2pLby0V9xsu1n/AU8je+3iq
         QBbWaqKfAkOOVhZqi/EUQzltRW0W7j9uVhcarMmTtSNkwOrHlCK7TRnXyHQWuqlCUJkR
         0o/Q==
X-Gm-Message-State: ACgBeo0mpn/eD2r20eoDIgwgTpGHLzp2bT0Uxyu8kF3WZAxl7pWFCPRR
	GBslnc0dQS7O0k+D5mHzl0Vj4g==
X-Google-Smtp-Source: 
 AA6agR5XaK34vePmhH9AT0dacKMrOEuXP64ixejfQYAE/HbiPYjqYSy+3TkbKDPoVhDAlskn0FiWyQ==
X-Received: by 2002:a05:6214:21e4:b0:496:e384:97fb with SMTP id
 p4-20020a05621421e400b00496e38497fbmr8509925qvj.127.1661263467206;
        Tue, 23 Aug 2022 07:04:27 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a440500b006bb5cdd4031sm8972736qkp.40.2022.08.23.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:04:26 -0700 (PDT)
Date: Tue, 23 Aug 2022 10:04:24 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add numa to machine features
Message-ID: <YwTeaG7XoxO8Qf4j@kudzu.us>
References: <20220822153807.3806687-1-jdmason@kudzu.us>
 <207d6c62-84c2-5c63-dd9d-aa866976826e@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <207d6c62-84c2-5c63-dd9d-aa866976826e@theobroma-systems.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Aug 2022 14:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3123

On Tue, Aug 23, 2022 at 10:11:08AM +0200, Quentin Schulz wrote:
> Hi Jon,
> 
> On 8/22/22 17:38, Jon Mason wrote:
> > numa is an existing machine feature, add it to the list so that users
> > are aware of it.
> > 
> 
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> 
> Added back in 2018 with 830880a6888270e047271137f43a643b218050d4, so it's a
> candidate for backport to dunfell and kirkstone I would assume.
> 
> I am now wondering if there's some list of supported MACHINE_FEATURES or if
> the list is THAT one in the docs?

I just happened to see numa in linux-yocto.inc and the 2 entries there
for MACHINE_FEATURES seemed very lacking.  I'm working on a patch for
that.

The docs list was the only thing I found approaching a canonical list of
MACHINE_FEATURES, but I do wonder how complete it is.

Thanks,
Jon

> 
> Cheers,
> Quentin
> 

