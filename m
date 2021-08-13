Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.37897.1628867618341283855
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 08:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CmTf6boR;
 spf=pass (domain: konsulko.com, ip: 209.85.222.176, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f176.google.com with SMTP id t3so11081775qkg.11
        for <docs@lists.yoctoproject.org>; Fri, 13 Aug 2021 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V7ehsspKSec96GQJMRSbrD1aQWfbygAbStf4K/cQmNE=;
        b=CmTf6boRT9gwyMrhiutjzhmRDvn77n9O1k3GlAPohauXh4Iq/myWZd1s7tcv9fcrAs
         qvr8FOYrY68morWs09VflGmPG1G9o6CWtTJ1oSU1aQeidb5/KDaKDtpxLXt7Q8B8kmYG
         WysHRnSQVJHzlhUIt6RnCiVr67WUCVXTEIz+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V7ehsspKSec96GQJMRSbrD1aQWfbygAbStf4K/cQmNE=;
        b=BA4KhcgT+Gvr5ofv9wWF7s0b6zN/IgEAf8kqrIw9yJZ5pxXuljXcdwfPukrUrXUGUh
         K8Vb+pY6wMAu92G0EIHxjkJvcB6ol30oUKmsCx3FF9VQcpJumbbVpvdimj83g/Y9ILQp
         ZKE29GTpABPjdtgom2I4HGWI5+jXA9QgmD++0cKymUqFsv7pDS8tQ6IpyGY7Peoibe4E
         g6na6MALIhlGy95mJBWNZOBTUCXbXclV+yXtgN/grD6d7j/K5fEUP8S3jn1tka7di6wL
         Gb4oFIdvrQ2Shqqes+IhV3JeKXjlVNfRYC6HQGMO2BwnaZG4Fgb7W2aQ0fNqqLaMO8xv
         FWBQ==
X-Gm-Message-State: AOAM532x/VbtySOzigSIAFcT+ZLMKmOg5udYuyrU5GmyJTtqGJk3ARKn
	geSczVwy2z5GYjPXEhAWPDVWvKcFR05RUzKb
X-Google-Smtp-Source: ABdhPJx7hQiawbtWb+xcKxnQzdqG0WcERdY90haSSOONrIgOapKDADZAggXI8amELzHmO4XJGrN3zg==
X-Received: by 2002:a05:620a:1998:: with SMTP id bm24mr2660281qkb.171.1628867617409;
        Fri, 13 Aug 2021 08:13:37 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-587f-642f-0e55-2e70.res6.spectrum.com. [2603:6081:7b01:cbda:587f:642f:e55:2e70])
        by smtp.gmail.com with ESMTPSA id n10sm884409qtk.89.2021.08.13.08.13.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 08:13:36 -0700 (PDT)
Date: Fri, 13 Aug 2021 11:13:35 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] common-tasks: Add an example of using bbappends to add a file
Message-ID: <20210813151335.GH858@bill-the-cat>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-3-trini@konsulko.com>
 <20210813082740.ptt5tcfchhapfm67@fedora>
MIME-Version: 1.0
In-Reply-To: <20210813082740.ptt5tcfchhapfm67@fedora>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 10:27:40AM +0200, Quentin Schulz wrote:
> Hi Tom,
> 
> On Thu, Aug 12, 2021 at 12:10:27PM -0400, Tom Rini wrote:
[snip]
> > +   FILES:${PN}:rpi += "${sysconfdir}/X11/xorg.conf ${sysconfdir}/X11/xorg.conf.d/*"
> > +
> 
> Highly suspect this is wrong. It should be FILES:${PN}:append:rpi
> instead, otherwise it's completely overriding FILES:${PN} for rpi (even
> if the operator that is following is +=).

Right, so, this is not fatally wrong, re-reading the main recipe and
building it.  But it's also not a best practices example, so not what
should be put in to the documentation.  I'll go and get meta-raspberrypi
fixed to follow best practices and once that's merged I'll v2 this last
part, along with the rest of the feedback.

-- 
Tom
