Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.625.1582238339240314377
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 14:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iXOg0NKC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id q9so234907wmj.5
        for <docs@lists.yoctoproject.org>; Thu, 20 Feb 2020 14:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fyJHSCkt53LCu2+FqEtWYtm5F4Qn/76O3ZFpKMTjdtw=;
        b=iXOg0NKChOFY40Zf3kImszfIz1z4R282RQeJsGL8ZoNQ8IJRH17Jl/FNZjT5knI1Xg
         QF9rUJ9YWwhvdcW+tmNymvL9oCMYFnr7H3etv1Q9X7Oy7fgoUKtWfjbcp9L+KOLhlSsB
         kHbdaIwpGw2sVbdukKwWgcFha4oNUohh2GQKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fyJHSCkt53LCu2+FqEtWYtm5F4Qn/76O3ZFpKMTjdtw=;
        b=H1ygMYgfQdS6+h9UfxRYRsBd6KF0OnNlmvXlugLlGskSg071L1E/s/VdAd5vyutjz8
         z4pTqX8Eg23PKOtjQdYMTFnnTnNRq8tletIKyJNRpQiWx3vvXdFWymKxKp00EOaKchrN
         8xCl3NuV2WbgpPH1Z/nU1DaZyIZlYkUqeqzn9T5QPnk1AjdSNrB/CX1qcx3N6hTEuOIa
         qB1+r78TaJyzWHIapS0PgTUuInzxy7gFYEfJFOyujLVyoCeO0OZbRXRtEOuu2u0y9IU0
         9iVo+bn37eplnuqMMGpTmiVp1y8SeM0HPhKPuCw0mzIhcrV8xVeKieW0NcTrxCReHuHM
         73uQ==
X-Gm-Message-State: APjAAAWqtQnzBPnytAS5YvH9X1fZ36bVuWHow9YGiOYSwSCFXvr12yEx
	wJZPyGpyz/HkzZEFta1KMwTcAUDlIGU=
X-Google-Smtp-Source: APXvYqxGb8liCiERnNZtnvAAQhTr/3u9Y1Yappzrk0sLoVmZTDRphibeX1uAqJ5ulWAF26aMy3THjQ==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr6979866wmk.59.1582238336363;
        Thu, 20 Feb 2020 14:38:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c13sm1293449wrn.46.2020.02.20.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 14:38:55 -0800 (PST)
Message-ID: <3ff7dc4ed4873535637626f5d1fd890622dd0165.camel@linuxfoundation.org>
Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org, Michael Halstead
	 <mhalstead@linuxfoundation.org>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Date: Thu, 20 Feb 2020 22:38:54 +0000
In-Reply-To: <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
References: <15F53638120140E5.26907@lists.yoctoproject.org>
	 <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 20:42 +0000, Peter Kjellerstedt via
Lists.Yoctoproject.Org wrote:
> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> 
> > On Behalf Of Peter Kjellerstedt 
> > via Lists.Yoctoproject.Org <
> > peter.kjellerstedt=axis.com@lists.yoctoproject.org>
>  
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ^^^^^^^^^^
> Why did that happen? When I sent the same patches 10 days ago to 
> the same destination, my address came out normal without the via 
> (I resent the patches because they had not appeared in Patchwork).
> 
> The reason I ask is because I expect this gives me a separate 
> entry in Patchwork for this address compared to my normal entry, 
> which complicates things when I want to search for my open patches.
> So if possible I would like to avoid this in the future...

It comes down to the rules your company set for the domain you're
sending from. If the mailing list isn't allowed to forward your message
its forced to rewrite the From address to something which it can send
from.

Did something in your domain's DMARC settings change?

Cheers,

Richard

