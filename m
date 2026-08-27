Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD038C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:34:14 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34373.1787830445741646131
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 04:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HKyJv1Gv;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9309d4ea213so168302085a.1
        for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830445; x=1788435245; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VFiekzVXaLEkFubRzg7A6oU5UfXRezzMKZor/Z407Rg=;
        b=HKyJv1GvfPbY/TQ/eoXq9AQSzfXE8eEtRU3Nz/AFy0ufAqjQcTl8Jx9ApPcC7qugKz
         cBaV730JB5X5R1g8a+Vnnk3/Xw+lCbKWR5+t2RWKXcWYZ6w8s9jazU7KG9NVkLeUrHOC
         XZ3wYvons5ExsKNRYVbkOGAE/jSNYeLCGy3xUi6FrZPJBUrpWPid5hR4UJUhDSQc8KkH
         YxjUhnjJ4NZx8jXIz5fA38q+z5vvwx/4xUszN48TABtCqQzs+D+QTCSxEgWOrj/A8yfR
         2Q3nfikhhiTXkTrq1Au1m5wvNRs/ee8/48ixjbmn4LErT/al/NFGhPWCnBuABuu8WbHQ
         8a/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830445; x=1788435245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFiekzVXaLEkFubRzg7A6oU5UfXRezzMKZor/Z407Rg=;
        b=PcINcn19Vaq/3wMvzXp0XheYvU5sLjDPNtKkY3rV+pN6yq6tKZFq5pF/HrffOj6dLT
         +SIel3eXuShXg8rBY6FYSyG2rkOMKOAmHvfW9g+e87RYpZoY+Tbanh2F5J/Nkzpo3aH+
         SIn2GIvCn8BGBax4YOHSg9RR8z+KkF9nrKdqDoiS0I8bu99uY11NkIOacM98QZNv4aTq
         55pCHUDPXG4yyf/hdDaNHsMeeJA9iiNnAtVROYJJ3sz7vkL4mX5/HEEwtuAMg3e8rfuw
         Xt/lgaJ+9ETMacQw9plYqG4Mm5djs748TXsah6yaL4iOg/D7yXjgGQl9j4kOrWTcBepk
         aalA==
X-Gm-Message-State: AFuF++nb4Q9gA2ljDpRdNsK3Y1h4Pa4tcPQdNZrAdLgvykFr+rMoz169
	oUuOApiliUGdadbQmkpCwcV+SJuMcD2YlwgGK9RsOV9z7csH+O7qE1sw
X-Gm-Gg: AR+sD11jof4w8uSc/wm1pQBOq/zPHys5SLTY/SfEqowk+wPGpqPsK5/M3YJWdfQ+aTv
	UGqEdm/d7NVBgCMs/wBEoDPvAqsrKQVOcoDyKL/sNnRXC6Fn2yBNBNiWg6PUHsUBKurnwbDxGmf
	uF8263sWWp1vju+/dfH2R97rE6bRHsZ2wvyKKWqpaw9sx4OCoC6vkwyGaO+I6bD46uj8lNV4bhN
	Tb5PKbSsdD2AgwMGOToJ1wGMMkqSuIFs3TizBioJWHoq3nJS3+tzp1QvTSk1B03mm0XXKlTQOpj
	8bpfqciG5s3dZxo9jxnb3T4KMIq32xudVse7WgFMtTCRl9uT5/yHPQ/onJ+ntRTfAXw475VQQDj
	f06wUSa2rUD8Xt1T8gKxZVE21tIHQDSjq02oO1TrIOw0RvykJjcFISnIL0D/4bKzIOGHYfnSenl
	a/W2eipJqoye40lI/pkfjDBF9yfUGbhoendam00buIvEnK4ESrvBy2d1+DskDicah+c44L+Jbp8
	Md90tWlTFb6FAgHiTUZUjhcDvCojw==
X-Received: by 2002:a05:620a:19a5:b0:930:a64c:1556 with SMTP id af79cd13be357-937803ebd1cmr1152671485a.25.1787830444662;
        Thu, 27 Aug 2026 04:34:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c50esm427222585a.37.2026.08.27.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:34:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 07:34:01 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <apAgqQXALqu6eX7W@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <DKZL9X7BV6TH.1WARGZV04JK2V@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DKZL9X7BV6TH.1WARGZV04JK2V@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 11:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10379

On Thu 2026-08-27 @ 10:38:58 AM, Antonin Godard wrote:
> Hi,
> 
> On Wed Aug 26, 2026 at 3:34 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> [...]
> > Not included
> > ------------
> >
> > Six blocks in ref-manual/ trip a defect in the released BitBake lexer,
> > fixed upstream but not yet in a release. They are a separate patch, held
> > until that release, so the rest is not blocked behind them.
> 
> Would it make sense to apply a patch to Pygments in OE-Core to fix these issues
> until a new version of Pygments is released?

It would be very easy for me to provide a patch that would fix these
things locally until (if) upstream pygments picks up my updates:

https://github.com/pygments/pygments/pull/3284

I had wanted to add such a patch when I first developed the bitbake
lexer for pygments but the last time I proposed adding a temporary,
local pygments update it was decided we should wait for upstream.
Therefore I stopped short of doing that here.

I would also like to add a lexer for some other smaller stuff such as
SCC files. This lexer is very unlikely to be picked up by the upstream
pygments project; their own documentation says so explicitly:

https://pygments.org/docs/contributing/#language-support

But I think it would be nice if we had a highlighting scheme for it.
I'm more than happy to write it, but it is a plugin we would have to
carry ourselves.

