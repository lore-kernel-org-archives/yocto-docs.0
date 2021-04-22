Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9895.1619082839861754588
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 02:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIFEtPO9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id w4so40299963wrt.5
        for <docs@lists.yoctoproject.org>; Thu, 22 Apr 2021 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PWvdQWUBzkX8Ak6aRTUXuDlzJGYjDosyW6LPgqijla4=;
        b=CIFEtPO9CVAu0rhDrnp/ai1K1Nu3wT5lmeRdl3SYTi1bCIgrnPDxf8fOjUcovkVCSv
         msQx8NF8VlBfoiBG+0/U//gMm7UgWtweUF7Zb1V2ZVgAqTUa6fpMl8C+Gkik+DyB5Hwa
         5wM/5igSRq+xIEfb8s89D4ktrCAU85ojC6qHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PWvdQWUBzkX8Ak6aRTUXuDlzJGYjDosyW6LPgqijla4=;
        b=IQqPNGObsxAGAmUslnQ4qHf+0rk/gMQzrB+8PgnGaxH+A6106ghPkXdG8oCr6oS7to
         hQlsvoNo5MBXomexffzvEcxGPEgdwdHDRQpD1VY2HMxsVQgAm4uBzr816aXZr1VWwq1E
         XjD0AnUAdaiZDRKHr8SFXGsGA92nNtRY+7JNs8zWRx9XWKP8fiWB/ASO7+7lxMqNy1++
         QWqxsrcAk243OCpNWvpfY31mkqod/DVEha0JKqhT627IF3Ne9d+U/HTW7li/HCJgJkRa
         TIboL7hnSqp14QYcN+2oN1POrQq7kIvtbTmI6qENodGCgLSKAN9EMCSpd+FFTj5THZMq
         soZg==
X-Gm-Message-State: AOAM532YW2kBJAGWxfo0CZZIE+gUJCLpzI4RwuXgZZm929BmyAhW1ffS
	sWjwf1f68H2Jj4BAqoUE9FnEZw==
X-Google-Smtp-Source: ABdhPJyR3IaXzDoiP+J9xiFJJ66WoTZcfzV9khLWqz9w7wRqDzKhjbjL+7uovscmLzh9bqbDJsTBLg==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr2983391wrq.28.1619082838376;
        Thu, 22 Apr 2021 02:13:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bd84:c44c:f28b:9534? ([2001:8b0:aba:5f3c:bd84:c44c:f28b:9534])
        by smtp.gmail.com with ESMTPSA id v189sm6278589wmg.9.2021.04.22.02.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 02:13:58 -0700 (PDT)
Message-ID: <7f0f5f4c9bb5bc35972dc6db560c30247c48099c.camel@linuxfoundation.org>
Subject: Re: [docs] Vector sources for the manual figures ?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Thu, 22 Apr 2021 10:13:54 +0100
In-Reply-To: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
References: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-20 at 18:10 +0200, Michael Opdenacker wrote:
> In the YP manual sources, all the figures are in PNG format. Except for
> screenshots, that's far from ideal for high resolution printing and viewing!
> 
> Don't we have vector sources of such diagrams anywhere, so that I can
> export them to SVG? Don't tell me they were lost during the migration to
> Egypt. I mean the migration to Sphinx ;-P

Unfortunately I don't think we do have the original sources for most of them.
There are some source files here:

http://git.yoctoproject.org/cgit.cgi/yocto-docs/tree/diagrams/poky-buildprocess

for the architecture diagram, added by me back in 2011 as I wanted to ensure
we did have the sources but Scott handled most of the others and I don't think 
Scott did this. Sadly we can't ask him now.

> In particular, I'm asking because I managed to find a way to see the
> figures in full-width in the epub output (using my KOBO reader to read
> the manuals when I'm not in front of my computer, but the figures are
> always too small and therefore unreadable). You just need to add
> ":width: 100%" to each image insertion, and this doesn't seem to disturb
> the HTML output which already looks correct.
> 
> I'll propose a patch soon, but the results would be even better with
> vector figures :)

Over time we may want to look at rebuilding them but other than the older
architecture diagram, I think we would have to rebuild.

I know there was an issue reported with a diagram recently and I ended up
editing a few pixels by hand!

Cheers,

Richard

