Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.2174.1601418615775007263
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Sep 2020 15:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gWZxHbUz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k15so7151867wrn.10
        for <docs@lists.yoctoproject.org>; Tue, 29 Sep 2020 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=crFL4K58I2UiKqRhH1B5jsDrVh64Uqf3B9iMdA7nlxA=;
        b=gWZxHbUzp5KE5bXqe2mYbXO+H7sld25+l7WCmimmEy++3XsXpVeWltsmDMZ3g/3AMH
         /qfksLIZX7qgGnG0P2YIBQT4r+jLmw3jG/dva4/LbI3YOf7ToGGbFAVx+Ogv08q0IR4q
         l5USaXdr4fJEWYY64dyb2NjpiwEt60eIp2wQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=crFL4K58I2UiKqRhH1B5jsDrVh64Uqf3B9iMdA7nlxA=;
        b=mSTzxTPz3+bDgyT2WNvoqkciMEoeN3ysdwP2JZLZdj23gJnWww82BuLShcekcnslJl
         i5B+5l1IVFPP3VQ/wEF67JfVpJFMcuAdMCs7RMkGAkjaz5eXwgxjoGiiVVF685l2uin5
         wI/RcCcBcIclZO/TVTc2nR/OtP9BTWp8eZAPYOcxjo+Eo34jHvZv+KG9a1T7hR29hM1l
         WwYQ8/wkTVKfDTS96a5D2EHxSEGTLs/6p9h3rub1e3Dq05JO2Nsd6FrQBP7BzNvAxkXg
         X2dFu+UR8Zxmq/i1bM41sCexOijLm6XFkYt6h81YtUHX4dFoUzzb6+tJWXRjvb0YdNSk
         sEPw==
X-Gm-Message-State: AOAM533GdTqWB/lGHtrS5OOIfNdEA53i/G+W16iy/jj1P+yrA+sdWAvu
	HYKGHA0cXbHedsX+tbPrFeDtLw==
X-Google-Smtp-Source: ABdhPJx9CWptlifIayMtHE8u/CGtgAlP8iAVRP6jxdnh8KBLKeEQ2ABeuucRCOXZwQ3Bg6xTuPj1xg==
X-Received: by 2002:adf:c5c3:: with SMTP id v3mr6835149wrg.205.1601418614132;
        Tue, 29 Sep 2020 15:30:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id p9sm6798962wma.42.2020.09.29.15.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:30:09 -0700 (PDT)
Message-ID: <2980b80ca25a8f4e08124048d6200932ecff7ba2.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Jamaluddin, Khairul Rohaizzat"
 <khairul.rohaizzat.jamaluddin@intel.com>,  "docs@lists.yoctoproject.org"
 <docs@lists.yoctoproject.org>
Date: Tue, 29 Sep 2020 23:30:08 +0100
In-Reply-To: <DM5PR11MB1993C7F06445E9E4E8A8F684DE350@DM5PR11MB1993.namprd11.prod.outlook.com>
References: 
	<1600687615-18331-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
	 <DM5PR11MB1993C7F06445E9E4E8A8F684DE350@DM5PR11MB1993.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 02:39 +0000, Jamaluddin, Khairul Rohaizzat wrote:
> Hi,
> 
> Does anyone have any updates on this patch? Does it pass for merge?

Sorry, there was some confusion over who was merging patches. Its in
now, thanks!

Cheers,

Richard

