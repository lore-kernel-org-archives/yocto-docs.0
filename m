Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.3008.1592345271106589326
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 15:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hXNMiyWd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id b6so217328wrs.11
        for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2020 15:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GNGS2tMHCGHakoUMv0etS6tTHxlLbsbTBjWbc/FsPQg=;
        b=hXNMiyWdZ+kkWNEJ+9GUU4uQsYlz/cAFQPICzwq6LJVwBpm37/KJS7ftSXhYRXAoac
         5LnZpeqjW0aZR66NcFMHabnJf4SwkmUg3U0NpZaNcNZfvHZ2c7JcCoVvlrhuhD+xoeTR
         u6v1YGrpAE87lXu4Tas53y9DRW2nVP8S38/Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GNGS2tMHCGHakoUMv0etS6tTHxlLbsbTBjWbc/FsPQg=;
        b=Z1Yd4igNc7bgHX3L3UU++bjno7sxvTwBLpSx7QYxguoqsl2fhmYycNR0ixRBYKiEAq
         fzsFNZDnUTdjnJjc+ntS6Pkzx0nWlllYT2r9mPoKnoBcXeFkUGgVwur6+7vplsOaafJp
         IlwNTOPhALWba5IcXZaYxuqRw3aqnYnJ5MulSw5nppkFkOL6ERDPL5qKKypsgEZ1Z0m6
         4GQKou4nufU0M0kdeqRF0vlvbX4YRCL7uD4JW1U9s3ZoJzPOXl6V87rcdJE8pGXlRIcL
         aRKc/2kE9t9RfhS62FSPbuRCUlTMCTwtxTzKbkSsH+W2MHiUSiqcdzeh9q67aN5Y0M6X
         DPDw==
X-Gm-Message-State: AOAM531mNk+xqVDf+f0OlzkLbnu3AKMVXSF8EFriY73Yz1owXh1aCvX1
	ptyp3Y16jRHBgGWHPifHNkW8Fg==
X-Google-Smtp-Source: ABdhPJzeSiYt5go/Kq7KrLR//Ax4/qvKtuM6b3P2f5+9NpW838ETEPV2JdgbgUOGC+Md0S85S8TjbA==
X-Received: by 2002:adf:a306:: with SMTP id c6mr5106168wrb.122.1592345269621;
        Tue, 16 Jun 2020 15:07:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h7sm6004736wml.24.2020.06.16.15.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 15:07:48 -0700 (PDT)
Message-ID: <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Morton <Mark.Morton@windriver.com>, docs@lists.yoctoproject.org
Date: Tue, 16 Jun 2020 23:07:47 +0100
In-Reply-To: <20200616211450.8079-1-mark.morton@windriver.com>
References: <20200616211450.8079-1-mark.morton@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-16 at 14:14 -0700, Mark Morton wrote:
> Signed-off-by: Mark Morton <mark.morton@windriver.com>
> ---
>  documentation/Makefile                        |   2 +-
>  .../test-manual/figures/ab-test-cluster.png   | Bin 0 -> 18684 bytes
>  .../test-manual/figures/test-manual-title.png | Bin 0 -> 15382 bytes
>  .../test-manual/test-manual-customization.xsl |  27 +
>  .../test-manual/test-manual-intro.xml         | 634 +++++++++++
>  .../test-manual/test-manual-style.css         | 989 ++++++++++++++++++
>  .../test-manual/test-manual-test-process.xml  | 109 ++
>  .../test-manual-understand-autobuilder.xml    | 312 ++++++
>  documentation/test-manual/test-manual.xml     | 103 ++
>  9 files changed, 2175 insertions(+), 1 deletion(-)
>  create mode 100644 documentation/test-manual/figures/ab-test-cluster.png
>  create mode 100644 documentation/test-manual/figures/test-manual-title.png
>  create mode 100644 documentation/test-manual/test-manual-customization.xsl
>  create mode 100644 documentation/test-manual/test-manual-intro.xml
>  create mode 100644 documentation/test-manual/test-manual-style.css
>  create mode 100644 documentation/test-manual/test-manual-test-process.xml
>  create mode 100644 documentation/test-manual/test-manual-understand-autobuilder.xml
>  create mode 100755 documentation/test-manual/test-manual.xml

Thanks Mark, its great to have this here!

I've queued it in master-next. The only issue was the patch didn't
apply cleanly, the Makefile change was trying to change something which
wasn't there. I've made it do what I think it was meant to but you'd
better check I have that part of the change correct.

Cheers,

Richard


