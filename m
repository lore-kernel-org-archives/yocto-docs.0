Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.5998.1623235095519915152
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 03:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YgoPuRwF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id o127so3687989wmo.4
        for <docs@lists.yoctoproject.org>; Wed, 09 Jun 2021 03:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=R9RQRhCxpewuVH7AxwPVuq2R9XsY6CtD2X91HCUN8Ss=;
        b=YgoPuRwF5fejfGtCgufWdyFFhrGJrqfwVp0Lr2SZUyKQeHcP2ImAzQ09XpndLrvTtS
         kKNWMnQkSmxgWf0CKzs3zPfhgPkJmQKUnIFBQWZWhF+f2gu4L0rNkBMNAF1tksl0Yckf
         kRHQaE8nPn2CaOEed2nveGcdk6LvhIUwYZ9Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R9RQRhCxpewuVH7AxwPVuq2R9XsY6CtD2X91HCUN8Ss=;
        b=jtYL8B1ZPzFFSHll2KaSLyLmHX5IzALTUKjz1lRZMArwx88j5iJblB9xYS7UidetHI
         ibKDVwR2Au7X4fKJNxGkrmyT40EMze0LMrHccvUJ5C6zRW0WU+hoY+7CLq9TrIV0tdFA
         8wavjJljztgXxoD+ldYtIerTUJa4xyf9R/kn97Iyp/2tO1GQpYZAqt59/dZmKJI+pFEx
         kT/Bws/ZujXZ5GqMPy7EIn4RhTZtO40qV0dl0YKeY5pMqVZzPzVFTfwif7NUrGe07GV5
         xfRxPl/P4HwKjbtJc2X8b+nfR3OkM0hHspiRxZKVJ7zGcICLuXQrnOAKYbIrn71cctv+
         NDrg==
X-Gm-Message-State: AOAM531ZzdmbEXLBErCm34SliWC7UqvBeFoxffq6K+7xWoSJ8SvNHzWL
	DE9qfcTK/Vlxdy3zajUOULZnbA==
X-Google-Smtp-Source: ABdhPJxHObnZmuIpv9Ykqo23jN/mbYnnvadyrfVTNOaW01SrAVCjI7IsH7504tNvZrwSvWOTlKvhbQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr27105693wmk.97.1623235093622;
        Wed, 09 Jun 2021 03:38:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6f8:4296:455a:d852? ([2001:8b0:aba:5f3c:d6f8:4296:455a:d852])
        by smtp.gmail.com with ESMTPSA id e17sm26198103wre.79.2021.06.09.03.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 03:38:13 -0700 (PDT)
Message-ID: <299b4ab741e279343bb71e5a059e34b0bcc0bd33.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 09 Jun 2021 11:38:11 +0100
In-Reply-To: <20210609093457.3jgih5vydfcv5nbe@qschulz>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
	 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
	 <20210609091143.vvykg2irov6wcbdu@qschulz>
	 <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
	 <20210609093457.3jgih5vydfcv5nbe@qschulz>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-09 at 11:34 +0200, Quentin Schulz wrote:
> > 
> > (oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds)
> > 
> 
> So this means you need to test the world build in order to test your
> layer or recipes? Or is there a way to only test a specific recipe?

You could test world which is what the test does.

You could subclass the test and change "targets" to a different target.

You can also change sstate_targets which would allow you to "pre-cache" some
set of recipes before the test, meaning they were excluded from reproducibility
testing. An in practice example would be setting sstate_targets to "core-image-sato", 
then targets to "core-image-sato-sdk" would test the delta between the two for 
reproducibility from what I remember.


> If not, it's anyway worth repeating ourselves :)
> 
> We should provide dirt-simple, easy-to-follow instructions so that it's
> easy to get people behind the idea that reproducible is a must and
> should be tested before it's too late :)

I didn't mention much of the above as it becomes far from simple.

People will want "just my layer" and we have no way to know what that
means in the general case. The tests are easy to form into your own needs
though.

Cheers,

Richard

