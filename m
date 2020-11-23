Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.40808.1606159931897395353
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 11:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bPKuJ+tn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id r3so1459599wrt.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BEPfUkJBkAbRAjsOsl8yXOsl83SxwKhJX7xuweyS5iE=;
        b=bPKuJ+tnUfoJ/eUL8R18ItVHA8OJgvaG8aHMC7XQnrtCE3iGy54dYZr7QuBVDqanoh
         QvS1SgaA68DCv9ThiXtjb52fvHKutV2WxBa62m+2dhh/O3VznlFBjOfmwH+9zuHV1z6g
         XQPNl+TvfCtFXkmljoikooOcv1t+Lv3oODkRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BEPfUkJBkAbRAjsOsl8yXOsl83SxwKhJX7xuweyS5iE=;
        b=SbXk7h7lnd6Uv4tj6ObanY5YfNyLwWufFGxwMUTO9iFEMJbgr0yqECKQS0NnEWAw0x
         G9c+WtxNuoptZ9M0M5rKac/Kn0O3uq2WxiyHPJPefp/DDQk8CbxFODwZUkqIJiUa8VzO
         Rs50mQ3O8+VfUERUs0kLRk65cahtFa/FnM2hYi6YDHaezsmiD+Q47yTbLzpUMOwOOUSD
         cJMww6ZkkuooGtQa1OSIu4kzMipC2aVJ0srdI6zmrsTrtwrpn5ppowqsg0zWDD+HCOzN
         6XRI8vlihpe4TfkCH2R+QyaF+M25bJ3hfDefFwAXW7YuH5gJNPxIzqxKX6onWPRxCI3x
         Dsaw==
X-Gm-Message-State: AOAM5328fNAbWGkL61G1Qk6lomDQwm58pXkZ5Mv/LcoH7TbDufcfDb0a
	8F6pd8g56xgNZ+zWgZ5SVWXcCg==
X-Google-Smtp-Source: ABdhPJwsB6MeYw7M1ZcNFFSNOOQaBA3ILXM/MgnzDMUe/DeS4QPYr9nev/eBrXtHcOCoeDvDWdU9hw==
X-Received: by 2002:adf:9124:: with SMTP id j33mr1237022wrj.376.1606159930403;
        Mon, 23 Nov 2020 11:32:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id a15sm21384594wrn.75.2020.11.23.11.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 11:32:09 -0800 (PST)
Message-ID: <858f33431e388f324d93bb75d5ac03f9f9c869f2.camel@linuxfoundation.org>
Subject: Re: [docs] Tags in the yocto-docs repository
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Cc: "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, Michael
	Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 23 Nov 2020 19:32:09 +0000
In-Reply-To: <CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
References: 
	<CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 19:30 +0000, Paul Barker wrote:
> Hey folks,
> 
> I've just noticed as I have the web interface open for the yocto-docs
> repository (https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/)
> that no tags have been created in this repo for recent releases. Is
> there any intentional reason for this or has it just fallen by the
> wayside in favor of other concerns? Is it something we should
> address?

Not intentional, we should have them.

I've added Vineela and Michael since they usually take care of this.

Cheers,

Richard

