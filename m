Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.1070.1626884454270438427
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 09:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PskbsKkx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso3750130wmh.4
        for <docs@lists.yoctoproject.org>; Wed, 21 Jul 2021 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8Hrou4sZy+Lvwl/fa8IWQ/h61bfZLFhjYVSpO5386N8=;
        b=PskbsKkxT34R8VSzvP3TyKytN5UcHzhvx3e7n3SSiFEJsFP8WB4CLSpye8XZ1KUlBI
         qHS3O78cF1cVU16OPpf8df+g05VdLSNIvVsJqDxT1Foc8/HRyRGJoyHDgZBHe2r4bXJC
         hSa+Is51W46cxMS1AKgF24TFkE022vbUguNVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8Hrou4sZy+Lvwl/fa8IWQ/h61bfZLFhjYVSpO5386N8=;
        b=r0gWaQ1jO0EDPtGSE6BvsNxpFg11MMI40OHQHfnjadkBL7i6nNcU04YtcR53a53ofD
         0H1CrkJGwHTyhArB/reDJihjXIOH+QNe1fksx2R3mjFvzYULE93cqBovQ+nO3Py2BzhQ
         /Ij07i41UU07J/iQw+pGOU0nKeIqZaJlUu9zXbMWF3GjeuQF8zMT9xkEJNewlODOJqsZ
         bLW3EK6IoFR32Lhwr/2RH8qAx1IRZK7YCayK41HYRAr/CUsWEk7IXgTV4pr7HNE9oPae
         afBrtmzzN9aZK6/PEq0fyCaX8ykSAbiV/FuztCDMKsE66HCNiZV9M70bjvm9uCDXBj8a
         GZZg==
X-Gm-Message-State: AOAM530WaDvUnfhTCaYCd6O+IeM1xHrwpjELTCHLeEhFum5EYKH/NONt
	2vEmkIEs7LT2jyzhwxTw1csJ5A==
X-Google-Smtp-Source: ABdhPJxujif90Ki+l+F1LtcqnKRM4Zy90HvVyRKvINIG4wX7M5y65vKfAtYeMfXVyQ5lJ23dFAoh3g==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr5009905wml.30.1626884452690;
        Wed, 21 Jul 2021 09:20:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4a:a3b0:9d05:9957? ([2001:8b0:aba:5f3c:ca4a:a3b0:9d05:9957])
        by smtp.gmail.com with ESMTPSA id w3sm27189101wrt.55.2021.07.21.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:20:52 -0700 (PDT)
Message-ID: <db9ccfa4d7a7c41b6f926366918a71c76c37ce7c.camel@linuxfoundation.org>
Subject: Re: [docs] "metadata": plural or singular or both?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Wed, 21 Jul 2021 17:20:49 +0100
In-Reply-To: <8b294bc7-ab17-3dab-2cf6-ef2af316ca00@bootlin.com>
References: <8b294bc7-ab17-3dab-2cf6-ef2af316ca00@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Michael,

On Wed, 2021-07-21 at 18:11 +0200, Michael Opdenacker wrote:
> I'm currently reading BitBake's documentation, and I'm always
> uncomfortable when I read "Metadata is", while I know that in English
> and in Latin, "data" is the plural of "datum". However, many people seem
> to use "data" as singular.
> 
> I also find confusing that actually "metadata" is both used:
> 
>   * in plural form as in: "Split metadata into layers and allow layers
>     to enhance or override other layers."
>   * in singular form as in: "Metadata is stored in recipe (|.bb|) and
>     related recipe “append” (|.bbappend|) files"
> 
> How do you feel about this? I'm especially interested in the feedback
> from native English speakers, which I'm not.

Personally, I'd read both of those sentences above as being correct and
they sound fine to me as a native speaker. There are other things in the
manual that probably grate on me a bit but not that!

Cheers,

Richard

