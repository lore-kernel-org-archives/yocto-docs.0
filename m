Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.49185.1606202693708088758
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 23:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n4P2SjBj;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id s8so18341041yba.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 23:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfU3YEooyL+4EOERmob/ojP1U02LRqljw4cB8pBdNuY=;
        b=n4P2SjBjsZIc7WR1sYP/IKvR3uk5M3DIYeKSoZqR7eGpPe79LS/pFEDINRgALBzmkv
         ZyYxhtPrikxUTAb5zyBLrdhziH2JTSqRUJhYN3Hn0k4pbZ5yj1Ae4G+hJGCyZFHZwGe4
         OvArDcLAqPxM/fVTv3upKb4oPCNLs0IWwDhtwPjnBkTqJj62fyp8fqCfvAdADWhR82th
         VIwQjBDrDZlIcKag38mWHQQbh9OMLXBVOOuEHaBA1Y+qlNX2AH9Qv2Z2YLG5Iz8DBxAE
         AiFYj3gMLMADq3weVymUHZmfQgbkADLPpQ/lVfwh735xxBwkXiMUGvYPVnCN+tYEeJAf
         yICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfU3YEooyL+4EOERmob/ojP1U02LRqljw4cB8pBdNuY=;
        b=JjuyBj1QZfViteDif7+77ldKghnVscWRpSIEtfCdi3KduFIWqbNcHFLmx9aXE5krDY
         HYru/E90Z++1RsUh43iH8YJg8Je0SRsLApxWyrbayK76Z8rTGe5PvaZt1Sr+wr/ZeHpP
         vHYRDtHSOreZLdfWQPQbqcxCOeg7tBkGqTTVTv6XtjAjCuA0N2Go8au919BaI8v4QAOw
         q5rDSFHBcqzaiT3lDz1+JSFf7zTcocMznXKah75ceEMAnUiEInOsiyfCdYmCNW7KiAks
         VUOgmd7GUop5sv9BudtEx5fD1TV+GjreM6nXeqBwljHYzuHiRLnX9JU0+b4kzvsNm6EF
         8AVA==
X-Gm-Message-State: AOAM530PSWEIbSW3+40ItmPU98hvoEryRTQ/gxrYcJSHqWiP1vSRBHxm
	RjSkIPquIdn/rQKMTJWlPjuztZUlXWp+QdYENsIS2w==
X-Google-Smtp-Source: ABdhPJzfWz1qLTZtNp4HuJltFFL4W43/hhXlrQtf6aI4Mjoxa7MaH/WwsjxbvX62F3Rm7z/ht7fDWccXVHG9Zm8BYbY=
X-Received: by 2002:a25:abae:: with SMTP id v43mr4964117ybi.397.1606202692836;
 Mon, 23 Nov 2020 23:24:52 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
 <858f33431e388f324d93bb75d5ac03f9f9c869f2.camel@linuxfoundation.org> <CADfgfoabPkBrKCBVO10_ACVfieExuC0-KQwyqG9pZHDUvWu5UQ@mail.gmail.com>
In-Reply-To: <CADfgfoabPkBrKCBVO10_ACVfieExuC0-KQwyqG9pZHDUvWu5UQ@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 24 Nov 2020 08:24:44 +0100
Message-ID: <CAP71WjwtJhcxV3k+_NrKjbK0KfeCwtTZQukOsiDLV=aS-yM4hw@mail.gmail.com>
Subject: Re: [docs] Tags in the yocto-docs repository
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, 
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 9:17 PM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> The most recent tag was 3.0.1 last year. I will add a tag for yocto-3.2/gatesgarth-24.0.0. Shall I add tags for the releases in between as well? I can determine the best commits to tag based on the date in the git log.

ouch.. I would have thought we include the yocto-docs commit in the
release announcement, but looks like we don't! Perhaps we should add
it in the future, Vineela?

I think we should add all tags. You can find the exact commit from
yocto-docs with:
cd poky
git log <REL TAG> -1 -- documentation

e.g.

$ git log yocto-3.1.3 -1 -- documentation/
commit f2ae38a055f54640a968c4a8d5074f044202380e
Author: Steve Sakoman <steve@sakoman.com>
Date:   Tue Sep 15 04:11:08 2020 -1000

    Documenation: Prepared for the 3.1.3 release

    (From yocto-docs rev: 1a69e2c029a3cc755734c8c18584141cc3309695)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


>
> On Mon, Nov 23, 2020 at 11:32 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Mon, 2020-11-23 at 19:30 +0000, Paul Barker wrote:
>> > Hey folks,
>> >
>> > I've just noticed as I have the web interface open for the yocto-docs
>> > repository (https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/)
>> > that no tags have been created in this repo for recent releases. Is
>> > there any intentional reason for this or has it just fallen by the
>> > wayside in favor of other concerns? Is it something we should
>> > address?
>>
>> Not intentional, we should have them.
>>
>> I've added Vineela and Michael since they usually take care of this.
>>
>> Cheers,
>>
>> Richard
>>
>
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
> 
>
