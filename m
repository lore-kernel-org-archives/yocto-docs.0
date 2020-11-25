Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.5083.1606301069320200852
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 02:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D0LcRyNP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id p8so1417644wrx.5
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 02:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3zWHOrpFGKHIfhjCjfDHuGas1dPVffVZV6GJ3V9YOWE=;
        b=D0LcRyNPTfomM9p1grk6UMEhmo+cjHzt3eq9/xms351mcxq9vPcYJWr89ubC+2RJuI
         mGMDDr72jLjrG/+cL+lz3JhyNlY0+THLTrJGthtktKJS3rcdujh7sLs1AiXH3XhqKVLi
         0Qrp4PuXn5OwbxINaMgf2bRkc2LlXR2j4lZ/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3zWHOrpFGKHIfhjCjfDHuGas1dPVffVZV6GJ3V9YOWE=;
        b=BvQUWWEAT4cPnrY6Q3vKNM1qLd2m4ZIGPO/MnzkvwZnihuv8tD+TA1N23dOR2buIpT
         RzX3KFkAu2FTPOEbBG2N37bol6zAr9wobWmEue99MyaNJb+CChRSea5YnNeq8LM+vQU4
         ktQxouGNVhtY/yfXvVyd//KXusrbMqkQgHvWDFS8+3wAdXgGdcttN61SbbaB8B5Bm1bG
         PjsHQQ9GJYyODNuorxkp9NYHvWpdDJIASyyZqg3Hq0XxuJXp6RBoi4ZPBtG+2Qt8ECfc
         SJ0/M8FWgDCbm3piUR1PccR1X7K+SutOP58BSkNnYWWpPtymbqLZJvJP39nZwHHnnfpk
         BddA==
X-Gm-Message-State: AOAM531mcW6SK3ESdzmcMSWJrEehDB3lxEYwLO1yuIMWPNocS9T/cszD
	7gRd69cM2kmfIdUGQk6YttLDfg==
X-Google-Smtp-Source: ABdhPJzjwTs7H9Ymu8qj+wOI4n91unF21o/4J4h8tu0NAuNWMXo7oiAqHMoAVW5M34pMIpy+97uPZg==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr3363736wrp.176.1606301067775;
        Wed, 25 Nov 2020 02:44:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id o5sm3824230wmh.8.2020.11.25.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:44:24 -0800 (PST)
Message-ID: <0a344c6120beffe78e6bcfe1d290923474be4416.camel@linuxfoundation.org>
Subject: Re: [docs] RFC: remove backquotes in section titles
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 25 Nov 2020 10:44:23 +0000
In-Reply-To: <CAP71WjycS2eV0FZ0sVADhfRMAoHUdKafaCAgZq0W-nRQ2F-zoA@mail.gmail.com>
References: 
	<CAP71WjycS2eV0FZ0sVADhfRMAoHUdKafaCAgZq0W-nRQ2F-zoA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-25 at 09:16 +0100, Nicolas Dechesne wrote:
> hi,
> 
> In several places we use backquotes in section titles, such as here:
> https://docs.yoctoproject.org/ref-manual/ref-tasks.html
> 
> I don't quite like the html output generated, especially the mix of
> fonts and sizes. Note that the rendering is very close to what we had
> previously with Docbook docs as well, see
> https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#normal-recipe-build-tasks
> 
> I am tempted to propose that we remove the backquotes.. this is
> especially more important with Sphinx now that we tend to rely on
> section titles for references, and it makes the :ref: more difficult
> to write and mentally parse...
> 
> It's a non trivial change.. so I wanted to get feedback before even
> trying it (or at least adding on the todo list).

I wondered about that during the conversion. It would seem to make
sense to me FWIW...

Cheers,

Richard

