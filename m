Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5F3C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:38:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.24906.1639481906004041985
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C+CE2YSJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id t9so31875292wrx.7
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7Ns2jHNt7GoF2DfmZWtkPdHlnM2addjoP/2YJTmcFcQ=;
        b=C+CE2YSJBU4e1iaEUU3bCNqcMt5n9W0g3xh66PTK7OtSv3XH1oSMxCAtQIRvNzkHNO
         K0BYlidpYhYdAXleDVw1sqXh33QRipOSrCHpWQZzuzpPC7MmPLAMZECmPkB63hLb2KKf
         IfVQuLr32/at8gc8neQvWxfh0MfPEEoDHHdLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7Ns2jHNt7GoF2DfmZWtkPdHlnM2addjoP/2YJTmcFcQ=;
        b=bCnIRywji0Xtb8HZMWQXpG2CDFfhcGLcrSL1gESq+xIUfB4U9p41rNeK7OnJnsqyVK
         upuzqvvgX2Ri0r1ALgxwUv3+T36PGsjJivKQ/ywepi62J9q8l3xzkPO4Zx1M20/1ts/H
         +MFaAXcH4FHGcvsu90qsZl2ZYIKwZKH5A+89+MQFtDACyug8i3Uuocw1xpo5w0u/dZFb
         1WuAk/0ZccG3FYTEhYWURuA42+p79L5kUgQBAlHFh+TPnlbp+TvN8f+1lvX98ja9MGUQ
         oSKE0n6c7fNU2+gIhl2iZfuG0TPB++wKO9BcK/+q0dnmOijIIxzTWPm/vIxEtSRDGnvV
         Vr4g==
X-Gm-Message-State: AOAM5328yQGrsPnrbQ+RZJVPQmGc+v4EpfKSAlp6PwumKtiHTlEZsjY0
	oidYVkKG8XeVuQSUHwX5PiXDHg==
X-Google-Smtp-Source: 
 ABdhPJwdWVtghW866XOwJd6mT2aepTvIsAHH6bKKRHAD2OnM1dNibVejcIUyD/kaqSrBGpjE49nRWQ==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr5111013wrt.83.1639481904584;
        Tue, 14 Dec 2021 03:38:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62?
 ([2001:8b0:aba:5f3c:aeee:ee3b:3dbf:6d62])
        by smtp.gmail.com with ESMTPSA id
 o12sm2059280wmq.12.2021.12.14.03.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 03:38:24 -0800 (PST)
Message-ID: 
 <12d5685b2a25ef997f8aff353d93c5515dca608a.camel@linuxfoundation.org>
Subject: Re: [docs] [Openembedded-architecture] proposal: allow
 Upstream-Status: Inactive-Upstream in patches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, YP docs mailing list
 <docs@lists.yoctoproject.org>
Date: Tue, 14 Dec 2021 11:38:21 +0000
In-Reply-To: 
 <CAAnfSTt4ryodSOjJvVb0vSKCiurPUCt3D92uCd9GjBB9Mx6+=w@mail.gmail.com>
References: 
	<CANNYZj-jYhoRu8S6C=CmhiP7L+zgdG97fj4MmRQ-wRco2xWxZQ@mail.gmail.com>
	 <AM9PR09MB46424D01CC5A6F489074FA04A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <ce0b166097c52942fefb8b93849ebff88a1e1ca9.camel@linuxfoundation.org>
	 <1822eb65-af18-f149-7a6f-6f985bc6e72c@bootlin.com>
	 <CANNYZj-_Uke6GqZwqziTdA48tWGwHvw=Wm_BGjvJKaS+5oqjQA@mail.gmail.com>
	 <CAAnfSTt4ryodSOjJvVb0vSKCiurPUCt3D92uCd9GjBB9Mx6+=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2254

On Tue, 2021-12-14 at 11:27 +0000, Ross Burton wrote:
> On Tue, 14 Dec 2021 at 10:38, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > 
> > On Tue, 14 Dec 2021 at 11:30, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:
> > > 
> > > Are you suggesting to expand the official Yocto Project docs on this topic?
> > > Actually, I only see
> > > https://docs.yoctoproject.org/dev-manual/common-tasks.html#patching-code
> > > which explains the use of patches. There is much more content indeed in
> > > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > 
> > 
> > I would suggest you link to the wiki, but please do not copy any content, as it will certainly become mismatched.
> 
> I'd actually suggest the proper documentation is improved, and the
> wiki page retired.  Wikis are great for getting something written
> down, but if the proper documentation can have a chapter, then that's
> even better.

I was thinking something similar, I think we should document this in the proper
documentation and then the wiki can refer to it. Wikis are good to a point and
great at pulling info together but not a substitute for the docs.

Cheers,

Richard


