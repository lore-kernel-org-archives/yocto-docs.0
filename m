Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.14642.1593008586016353405
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 07:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I/2OKo20;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h15so2476837wrq.8
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xSuDfyRwJQ7SyqLtAUitZ5xSia/g7u4nDn23zeWhQPA=;
        b=I/2OKo20ViZcn2xJuTNeekPdtrE/ZbLEyufI1P11YPLuPlMIl8+wPKYFgv5OYiqsnG
         mPZQrzr+CQ3EhaRvjXGTdL1pMxZA/EWkHd94FDWXAt+VzB0Fbj7nmdhBrRfnsWYiMNNT
         OmQPIpj53oObJFcVrLtFZsA6pNc0BqZHBapSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xSuDfyRwJQ7SyqLtAUitZ5xSia/g7u4nDn23zeWhQPA=;
        b=FTxfKZ/In+XDrkE0Hpo60Ft0IurPlcnnB5SE2uGq8i9p3KxazKYsTrvTH8X/h94MHm
         xTRhvWYbPbxavdxc4lkUQl9NwheAVgIzJ5jCR4P2Y3cLg96ZVO2pJSD0GnJIEx61YTWe
         kBm3OhdBsBtW9++dAfrf1g8MzWzhAwAQeSxxGZLE4zWAhDYrun7n9dh74/fCbCnN50l6
         pqRdbO2+IfVAOz9Hz3qniN13SpZ8DRqXq4FBrK8Q6kYhKgbhYr1694Fgww+VdLAgj4b/
         wapZmd0xc/HoSgNXUqHh7LG+9pE5ma9aElQp4yQgxh9FntfzBBgY81EIjRiCPdXbhl9W
         gowQ==
X-Gm-Message-State: AOAM530srf0KOd/8wKBakhPg7KP+7IZ00qF3JRNA4C+o29HtEkgwLakL
	i7xmGTPQ0AFR5Lx+ROOSBDZ4gQ==
X-Google-Smtp-Source: ABdhPJzflyQSDWRpsS4lhKcEfdEE22CZYzcdmdFGIdTb/AuYV9Xc/NT8nZieFAN3hkxCCI8NunDyNg==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr20283870wrw.204.1593008584475;
        Wed, 24 Jun 2020 07:23:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e5sm25583210wrs.33.2020.06.24.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:23:03 -0700 (PDT)
Message-ID: <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
Subject: Re: [docs] Modern style documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: marius.kriegerowski@protonmail.com, "docs@lists.yoctoproject.org"
	 <docs@lists.yoctoproject.org>
Date: Wed, 24 Jun 2020 15:23:02 +0100
In-Reply-To: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
References: 
	<brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
lists.yoctoproject.org wrote:
> 
> Dear Community,
> I would like to motivate a re-structuring of the documentation. The
> single page documenting mega manual is great as it carries all the
> information. But at the same time it is hard to navigate,
> overwhelming for early stage users and hard to pick up where started
> earlier on.
> Are there plans that break this single page documentation?
> 
> To be more constructive: I find it very convenient and I highly
> recommend a permanently shown navigation bar, highlighting where the
> current content is located. This allows to find information again,
> even if a user only has a vague idea where a piece of information was
> found last time, simply thanks to the iinherent structural pattern,
> not only the text describing the chapters. Let's take advantage of
> the humans being better at remembering shapes and patterns rather
> than text and content.
> 
> If this undertaking is already on it's way I'd be happy to join.

I did notice the discussion on irc.

FWIW we're in the middle of planning to migrate the documentation from
its current format in docbook over to sphinx. I think that should give
us more options for what you describe with navigation in amongst
various other advantages.

Help with the migration would be much appreciated and we'll keep this
need in mind as we work through the details of this.

I do think we'll end up with some kind of combination of both formats
since some people do need something searchable/scrollable but I realise
others need the navigation interface more, there is a place/need for
both.

Cheers,

Richard

