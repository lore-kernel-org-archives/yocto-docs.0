Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.8121.1616168070300537247
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 08:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gc96I4vU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso7546333wmq.1
        for <docs@lists.yoctoproject.org>; Fri, 19 Mar 2021 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tOY9FAOggjpUNccFwF040F6PZu6s/U/DpoY8A7nNfVI=;
        b=gc96I4vU7qtI3fkv+nvfN6oi+ssWAA7+WRBGmo9u+BCtKuDojfzVtAO2REnXdOwZZ0
         +js7vtS8G5EJLoXwjHsO4+hZHk4YBXJhZApX876PuwBIgLfYe3S4cXc74HLFtjzaylFq
         ZfTwIjyLz8KlcI6psBLyYIxBkvL+pUwcgk61Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tOY9FAOggjpUNccFwF040F6PZu6s/U/DpoY8A7nNfVI=;
        b=A/XaI3FjkKOhUnnbtVgYS8dr8tGUScI4HpI88RH9C/S3Z4brgml7OAMqReo1K1hccc
         dAv7pX5hH9Zg522Y8p5TlB4Dc1ka75AVS9msypEUZeGOLX4Fp7UZ4ZrUZP+RxqCR2lPr
         mxayO+kUDk15YesbgTDwCgfduThe8yBZvp6ifLupEtPkbz/uGGwEWKO4pnoVO9oxwLbN
         O56mVKwxcQg5GpHsgNLSDhdrgpFnQsaAY0JfCLq2OajxdyoMXw30IEFsApUvtFrvkVq7
         WONR0CTHtzomGnm7WT5RtZCZqP22XYYnhoBce/fLwhv+uxJtPMdw3cb3Kd3VWJznRi9U
         +1Hg==
X-Gm-Message-State: AOAM530YlZ39h/b2Cy4mpkgcwywop9gGH2MVJApdjKmQIS2PaBJTsfrK
	VuclJ8KOVAdt9xHqWckKWtHKpQ==
X-Google-Smtp-Source: ABdhPJzjQkK3HlVgveVVjirOCeaT3ngP8VYDNCtxUgYPzUlAyNcgKr+2WC9gw201AJeCGZzbxEt7Kw==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4407690wma.134.1616168068705;
        Fri, 19 Mar 2021 08:34:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id l4sm8139358wrt.60.2021.03.19.08.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 08:34:28 -0700 (PDT)
Message-ID: <3d828cd45f59e3a7cf2f8966fd3cefd2bb24bb89.camel@linuxfoundation.org>
Subject: Re: [docs] Inconsistent use of "cd ~/poky" and "cd poky" in the manuals
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Fri, 19 Mar 2021 15:34:25 +0000
In-Reply-To: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com>
References: <9c893145-b926-10ca-35f0-ce4348110d49@bootlin.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-03-19 at 16:32 +0100, Michael Opdenacker wrote:
> On the other hand, my second idea was to stop assuming that poky was
> cloned from the home directory, and propose a patch that replaces
> "~/poky/" by "poky/" everywhere, assuming that people using the Yocto
> Project know how to use their brains anyway and understand where they're
> storing their data ;-)
> 
> What would be your preference? Has this already been discussed?

I've never spotted that :)

I'd think changing to poky/ would be more consistent, we don't require
it to be in ~ but its just an opinion...

Cheers,

Richard

