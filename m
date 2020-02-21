Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.9038.1582295524555283769
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 06:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hbwMz64X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id n10so2335362wrm.1
        for <docs@lists.yoctoproject.org>; Fri, 21 Feb 2020 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tYOpJuJSrwchs206tPmqAgqnN4UPz8pxSWEMhozUElY=;
        b=hbwMz64XvOjSXZBO3kaMKQ4RvyJoLdH6cdFzEt0J4vKtj5wfkFPQM7PebVsxNUmG/N
         eYscr7W/OXUt2Qu1cplmJwy01uNvsFfy9lYrYMhkRoujYamM8sLP6AM+DecbJfQSopWW
         R16ggqsjfeQ1Yik8CuiO2Gi1rot9b4u7/OnlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tYOpJuJSrwchs206tPmqAgqnN4UPz8pxSWEMhozUElY=;
        b=b9oaWDHB2yWlU5D+ADTwn6BDfdtGib1BvTVCzaOUa5v4Tb1cITSMbVp84o4X/2wezK
         cpZbJBfB7s82wOeR9RqMoVHJkF91yKMYUgTA28YgL1UkBBREcZWvYG1FYWCi60siz2m8
         upddSsvIbl1jem6q5JW4mVUCabboq6ISamE99QfKyBH3/Fb2HQVJ0ZFSMc+f1RjfHsun
         aoPCGVAtWwk3icbta1kDLvUgp06cLibc0i5bXLDBXkt/vGwGtcaz9ZKH+4kFvoaLHebk
         ONfv9Kn7irkpRWLSmceN6TUtAAM+AwftVINEYqSYSIyltytwhdpI4RdKWtEyCiI1+gNJ
         ahIg==
X-Gm-Message-State: APjAAAWEj5oJWlbPF/OaEOtIIKNrOcqLCrB4+4YeYnwwOJJ5l4uW1iOV
	TvPXJiTFJ32QS454cRl4R8lSZg==
X-Google-Smtp-Source: APXvYqzc5dwxVY43ro1+nR5g7/CyLDxPlg1WOIuTueSKOg7iQUNbQcSd8ebVGx3x8zLVw0ZcLezzfw==
X-Received: by 2002:a5d:5221:: with SMTP id i1mr45873865wra.44.1582295522960;
        Fri, 21 Feb 2020 06:32:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g17sm4471264wru.13.2020.02.21.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 06:32:02 -0800 (PST)
Message-ID: <226adb62a27e36861c83abb7c2a73131e69d1655.camel@linuxfoundation.org>
Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 21 Feb 2020 14:32:00 +0000
In-Reply-To: <e114646f12554c00a661215288fba132@XBOX03.axis.com>
References: <15F53638120140E5.26907@lists.yoctoproject.org>
	 <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
	 <3ff7dc4ed4873535637626f5d1fd890622dd0165.camel@linuxfoundation.org>
	 <e114646f12554c00a661215288fba132@XBOX03.axis.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-21 at 09:29 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 20 februari 2020 23:39
> > To: docs@lists.yoctoproject.org; Michael Halstead
> > <mhalstead@linuxfoundation.org>; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>
> > Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info
> > file
> > has moved from build/conf to build/cache
> > 
> > On Thu, 2020-02-20 at 20:42 +0000, Peter Kjellerstedt via
> > Lists.Yoctoproject.Org wrote:
> > > > -----Original Message-----
> > > > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org>
> > > > On Behalf Of Peter Kjellerstedt
> > > > via Lists.Yoctoproject.Org <
> > > > peter.kjellerstedt=axis.com@lists.yoctoproject.org>
> > > 
> > > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > ^^^^
> > > ^^^^^^^^^^
> > > Why did that happen? When I sent the same patches 10 days ago to
> > > the same destination, my address came out normal without the via
> > > (I resent the patches because they had not appeared in
> > > Patchwork).
> > > 
> > > The reason I ask is because I expect this gives me a separate
> > > entry in Patchwork for this address compared to my normal entry,
> > > which complicates things when I want to search for my open
> > > patches.
> > > So if possible I would like to avoid this in the future...
> > 
> > It comes down to the rules your company set for the domain you're
> > sending from. If the mailing list isn't allowed to forward your
> > message
> > its forced to rewrite the From address to something which it can
> > send
> > from.
> > 
> > Did something in your domain's DMARC settings change?
> > 
> > Cheers,
> > 
> > Richard
> 
> Not as far as I know. I am absolutely no expert on mail and DMARC, 
> so I googled DMARC and found:
> 
>   https://www.dmarcanalyzer.com/dmarc/dmarc-record-check/
> 
> When I check our domain (axis.com) there, I get the following:
> 
>   v=DMARC1; p=none; sp=none; pct=100; rua=mailto:
> dmarcreports@axis.com; ruf=mailto:dmarcreports@axis.com
> 
> And if I understand that correctly, it should not be a problem 
> for forwarding mails from me.
> 
> Any other ideas?

You can see what the server received:

https://lists.yoctoproject.org/g/docs/original/38

which is interesting to compare to:

https://lists.yoctoproject.org/g/docs/original/10

which looks like dkim was added to your domain and its marked as "fail"

 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=PiJ2ZuTp;

I then looked at another message from you:

https://lists.yoctoproject.org/g/docs/original/39

where dkim passes, spf fails.

then

https://lists.yoctoproject.org/g/docs/original/40

which is pass/pass.

https://lists.yoctoproject.org/g/docs/original/41

which is spf fail, dkim pass.

So there is a change in what you're sending and those pass/fails
changing like that look a little concerning. Quite what it means I'm
not sure. Did your IT department implement DKIM signatures, possibly
not quite correctly?

Cheers,

Richard



