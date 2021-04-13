Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.2490.1618342938267457324
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 12:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TvjL1cdx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a4so17593012wrr.2
        for <docs@lists.yoctoproject.org>; Tue, 13 Apr 2021 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V62mbf/3QwUhTt6XKMsXC/kZ2aL4/VCY0KBsSTzQCOQ=;
        b=TvjL1cdxsHikU8c5IaOJWwEk4TqFYPZXfLaI2qqO3qG3BUTgdw5L+mXAz18IRmOYGd
         INUp862N26IHnD9uM/xzabLT5danWf1Q1epQmcRozRIhKk0m1sxe4GqUr9RaPxxBSkbN
         ld1giwdvH1haNWG+D7fit9VN3ewHm5KHdkba0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V62mbf/3QwUhTt6XKMsXC/kZ2aL4/VCY0KBsSTzQCOQ=;
        b=fl/trgnixy0CsxQjxFauy24E6ZnNPXaJABeluwynoA/HkA8FqcZNdH8J1tnF94hRaw
         euYz9bWbwj9FfTxcbk0gS0UB/VWGtas+/h2LlClT5QTry46mJA1MJ7EpVMpF8wxk791G
         sJELt8ijx7Rhq23AqlaTW7yGErkAk1iZCTKGPX4wDy7WzMwcTPjQce1yGwZBow1feFFP
         jNhpC7kyfyfHVxcH46yPOswNybBM1MJWrgGe44Qk9qPjBW/gZbTA0SE5qHr5+Z1LhjfV
         6c61kEOVvdQE/kfmJFNW2GzliBGempX5W8wjMiZc0RpxZQkkM8cJl8S+/wmeApJFV3Vg
         w7kA==
X-Gm-Message-State: AOAM530eItMrOuE3bha7QekeZSuyrjyHbutuONFOS1InfeTvZ1Pw3nIH
	1v9J6zWHi+Hp0EZRRojhsMe+qOOI2wHhMw==
X-Google-Smtp-Source: ABdhPJz8HAOZMDBCtCeRlM9XlrCgIAxhzvNnNpJxtp5VYdUH5W2pz8Egwq43e8jnu+s4vOMuIlXVsw==
X-Received: by 2002:a05:6000:12cb:: with SMTP id l11mr18339453wrx.267.1618342936910;
        Tue, 13 Apr 2021 12:42:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:92c8:89c8:3615:b078? ([2001:8b0:aba:5f3c:92c8:89c8:3615:b078])
        by smtp.gmail.com with ESMTPSA id c16sm25434919wrs.81.2021.04.13.12.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:42:16 -0700 (PDT)
Message-ID: <874e8b4d36e7febe5198c7ce04d692633c699aea.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, "Robert P. J. Day"
	 <rpjday@crashcourse.ca>
Cc: Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Date: Tue, 13 Apr 2021 20:42:15 +0100
In-Reply-To: <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
References: 
	<DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
	 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
	 <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
	 <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-13 at 20:39 +0200, Michael Opdenacker wrote:
> Janne, Robert,
> 
> On 4/13/21 11:32 AM, Robert P. J. Day wrote:
> > 
> >   while this is undeniably useful information, the same tip could be
> > added to pretty much every variable in the variable glossary, so i'm
> > not sure we want to start doing that; i think it would be far more
> > useful to make this a general hint somewhere.
> > 
> >   i also recall, from years gone by, that chris larson had a cool
> > utility named "bb" that would search in a *proper* way for the values
> > of variables by actually digging into the data dictionary, rather than
> > the clearly hackier way of grep'ing through the output of "bitbake
> > -e".
> 
> 
> Thanks for your contribution and review (respectively).
> 
> Do others have opinions about such a change? It would help to make a
> decision...
> 
> Thanks in advance for jumping in...

I think information on looking at the value of any variable should be 
documented centrally/generically rather than on each entry.

As Robert mentions, there was a nice bb util that used to make it easier,
there is also an open bug for writing such a util with the tinfoil API
which would be the modern way to do it. That shouldn't be a huge task 
but nobody has taken it up yet...

Cheers,

Richard

