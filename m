Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD355C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:09:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.5614.1641899357554775901
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gyTqc7Fq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so1176765wmo.5
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lJfAC/8apopENVTCQ5LlLuPoNH6W4voaP5BXgziO14Q=;
        b=gyTqc7FqAOV5ZR9tBBjK81kkRlxrjihtJ5+JiJZ6fPIUQBd4Ig+T1k95HGz52R394k
         gX/WBwYI6LsBVKSFsd3tY0cf9s9+KydGBHHbFkr5D+hGKAWtkCaLMz0f5DQKN/kjvKuo
         ziYxlkTwUiBKtnx6SgFmU5KSl2MTziBk3UeCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lJfAC/8apopENVTCQ5LlLuPoNH6W4voaP5BXgziO14Q=;
        b=HEtQfwia96oRzG9pyVWi2Fl9UCwllQ33IXw1uW3AcJ8eKZ5XF/+1YlJnbO/+UqJNPB
         WGz7SmFPMeU2EWiLAbXXU5Q/rX99KRxbNGeeQafUczH2sKhQ8LQs4F3kJLBgTyowjHuI
         UmtebWmuhfVyKgntzLrZ9bRxw9sPlwZ47vQddO/gcYfouki+MTIjfAc17j8+cirXEWvV
         HhOa5xBeukGjU+AdLCkrt+8E/yhG6SXpvZNhkWwgo+lvtqT6dGD3eZMmUo/NZ5rT1Ota
         tg54VVSCm0fMgU+hXE96WZmkYv1oMLO1gm80K+7nWs8h9yM8n/JhDpmgk3AjP8J+VVU2
         C1Qw==
X-Gm-Message-State: AOAM5310b0Lz0OuqFt29aSLXh8Ion4tNBxcopyILJKrUAyGVLQY3c4l0
	PjjTrPpGpBCkjI9kgn53RHy95A==
X-Google-Smtp-Source: 
 ABdhPJxkq4i5eBs186gS+5E7tya6/D6LTEjbDA4FvsKpcvqMF+ZpOxxMwqA9PIbFjVV7n0FX85DTGA==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr1986396wmq.175.1641899356076;
        Tue, 11 Jan 2022 03:09:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4?
 ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 h4sm9081408wrf.93.2022.01.11.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:09:15 -0800 (PST)
Message-ID: 
 <3b82d9590897c50ad54ff22137cb7163b26267ce.camel@linuxfoundation.org>
Subject: Re: [docs] No more nightly builds?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 11 Jan 2022 11:09:15 +0000
In-Reply-To: <87033aaa-0893-b2a9-96cc-d7ebd59bcccc@bootlin.com>
References: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
	 <a47ff8d8a5f6bd8cd0454b01d5291010aaca7d91.camel@linuxfoundation.org>
	 <87033aaa-0893-b2a9-96cc-d7ebd59bcccc@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 11:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2376

On Tue, 2022-01-11 at 12:01 +0100, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 1/11/22 11:41 AM, Richard Purdie wrote:
> > On Tue, 2022-01-11 at 10:47 +0100, Michael Opdenacker wrote:
> > > Greetings,
> > > 
> > > Do we still have nightly builds? I cannot find them anywhere, but the
> > > documentation still refer to a broken location
> > > (https://autobuilder.yocto.io/pub/nightly/).
> > We do run them but they're "a-quick" six nights a week with an "a-full" on a
> > weekend. The results of all non-release builds go here:
> > 
> > https://autobuilder.yocto.io/pub/non-release/
> > 
> > The "nightly" builds don't produce shared artefacts any more, just test result
> > files and reports.
> 
> 
> Right. So the documentation can stop referring to them as a way to get
> the latest code.

I think it should be replaced with something about "latest test results"?

Cheers,

Richard


