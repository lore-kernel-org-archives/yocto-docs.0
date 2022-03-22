Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA1CC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:29:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.10453.1647959356499748239
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IfpNZ8kR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id i186so1865191wma.3
        for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xMou7BrYVMb0I5EqwmVrL+R/9YzyvrnFyOl2/L1Ffr4=;
        b=IfpNZ8kRffbYiOh+1Lsnz7mf7BEfYi5b7kzeg54AK/hcrgn18UwEEah8cCwZ2Udi+Q
         7Tx9fyFHfFUbLss6Gq74Odqn6+cakbD5i5clEAWKr3e3P1xJlUOGg+AN7D/91sMeJUXO
         gSp2kaIzy8ciVtUxyD+P/Ghu/HCszrGFes5Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xMou7BrYVMb0I5EqwmVrL+R/9YzyvrnFyOl2/L1Ffr4=;
        b=ayqEhs4LvE8AMDgTLTG0iZO1Ho2VDmXOYU/VfUvpznv0pQYSf0k/dao6U+uIxqTcty
         qJTi8dE/f0sMuxYPlcnQcyqRGvpHzCWlLIjh1JvJq6Fg3uD7gv+5pUjetP25r+GcBzmj
         +4YI6VQ0Zg679l54NK2p+s+5aLo5TzO99Py7dhigG2o4lZVmHsez65nB2tYx+RCqbz/e
         YpB4sObxdFPBKtxjSHx6xQYOd46HBFRYSZfbjyy/FXAXjHNiDDLMU24q4jGSMkvoMDkY
         I2571351FGZ3CbT/xXvdCdJGb5iUc6Wzw/FzAeSj7W8LHX8QdyaYci4L6cvOSBewfNWE
         +1wg==
X-Gm-Message-State: AOAM531Yai6n7oGulBSCe1+tC2BNS/QU7i4P9gIuJ4SIaxwLpbtiMCJE
	LSUIOww1IeJt6abhIc2bo6wIqQ==
X-Google-Smtp-Source: 
 ABdhPJxsdvFX+AHK2HbRcTQL86LowFVWJihWPQgNnBIdtdXaFinJ51FF9bwg8O2YfMu/9vCGYTM4EA==
X-Received: by 2002:a05:6000:15cb:b0:203:d94c:d764 with SMTP id
 y11-20020a05600015cb00b00203d94cd764mr22444024wry.210.1647959354947;
        Tue, 22 Mar 2022 07:29:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4096:7441:f015:a6fe?
 ([2001:8b0:aba:5f3c:4096:7441:f015:a6fe])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a5d6c6c000000b00203ec2b1255sm15521828wrz.60.2022.03.22.07.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 07:29:14 -0700 (PDT)
Message-ID: 
 <1f6b8d1b12be2053fc0e3306a9bbc66b6fdc3434.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/1][transition] Makefile: Use switchers
 generated from master
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Tue, 22 Mar 2022 14:29:13 +0000
In-Reply-To: <a890c15d-a92a-cc01-a9c5-c4d89d31de6e@theobroma-systems.com>
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
	 <b23f24f6-29b9-320b-b949-48b7bbebd375@theobroma-systems.com>
	 <6157cab4302631ca624837e94ac98181f81a2dd3.camel@linuxfoundation.org>
	 <a890c15d-a92a-cc01-a9c5-c4d89d31de6e@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 14:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2682

On Tue, 2022-03-22 at 14:34 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On 3/21/22 18:33, Richard Purdie wrote:
> > On Mon, 2022-03-21 at 18:28 +0100, Quentin Schulz wrote:
> > > Hi Richard,
> > > 
> > > On 3/19/22 16:28, Richard Purdie wrote:
> > > > This allows an improved and custmomised switcher for each release
> > > > showing the current doc version, the latest in that series and the
> > > > latest releases for the project overall.
> > > > 
> > > 
> > > Not sure to understand the reason for this patch?
> > 
> > For every other docs branch we can run set_versions.py once and have the correct
> > information in switchers.js. For transitions, we have multiple runs of the
> > documentation generation and we want to customise switchers.js in each case.
> > This is so we can show the current version, and the current release series
> > latest version which allows the switcher to work properly.  To do that, it is
> > easiest just to fix the transitions branch to handle that.
> > 
> 
> Makes perfect sense, would have loved to have this in the commit log :)

I did try and say that, just not very clearly. I've added to the commit log as
it hasn't merged yet.

Cheers,

Richard


