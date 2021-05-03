Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.32892.1620045687862092268
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 05:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JP4daOiq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d11so5380138wrw.8
        for <docs@lists.yoctoproject.org>; Mon, 03 May 2021 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=puXkuc3PwzQw1d0nd5oRcdRhnRpam9yhz1KUYVwBYUI=;
        b=JP4daOiq9rvI9rErDAhvvvavDelaU30cENuY3sIahdMNKpyml0CytyoJZyiqe4P4z4
         TX4EHm+D5XhohhxSDBzOj8bkY/F+6NQsZ3FDwpOcNhHKq1H4zYOs9vVYLx6jDz+jLFv9
         +IqFK/K49H8XWfayIlaxT2H3v3fRdyFKtWpag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=puXkuc3PwzQw1d0nd5oRcdRhnRpam9yhz1KUYVwBYUI=;
        b=f9xuJgIKUkmdco3gjj65oGQ4G/miiNbgswPzz2hqMKlmVcAbyI9TZTcwSQq2RZ3wMN
         nIli6/QNxq8AhmgIomOskTdvZjRW19L33/Ptj8MFIaKdXfWnvreVf3wQovLpYcvcz6gl
         E8DYIcJ4Jn3Hqvf+vSWgZCDVQ4Pbtd6je8ZiM8EFjHhMKBKjh+w6nXiw7kZbA3HrJ5Bs
         Cz5gQOwF8rosue9m2skiX9LVU5g+F9rLdBQAdXv1EmxHZ+Z1wOJTTA9ryx25NimYaO9C
         20K/LzxqHPwF6c0DgwxCxLEVJQatxzmJOo2TVnfEvBXYFOPn8dI4BjHdGn5pDiW+fTjX
         v7uQ==
X-Gm-Message-State: AOAM531TZlwoq/Ju4CyujaLyZ9+dpyigIqJSzTL5gvIR6tsfkv5lyjdq
	6B9wO9KDn1bwavyLczpa8Wm7vg==
X-Google-Smtp-Source: ABdhPJzbJAckQJgAmFPC5nfUHLetY3lYnA/iHzsgGwfP4Fpi1Wau+5I7olvZeWggCoLkqXnZOyk7LQ==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr24093608wrv.79.1620045686402;
        Mon, 03 May 2021 05:41:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id i13sm12513385wrs.12.2021.05.03.05.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:41:26 -0700 (PDT)
Message-ID: <bb2ca4f452f5f9c0897fd5518910598351848a83.camel@linuxfoundation.org>
Subject: Re: [docs] [master] Pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <foss@0leil.net>, docs@lists.yoctoproject.org
Date: Mon, 03 May 2021 13:41:25 +0100
In-Reply-To: <6224b355-782a-9c98-b1dc-7484a19a1fa3@bootlin.com>
References: <c85f57b7-42a4-9d2e-09a8-e97ab7de6ab1@bootlin.com>
	 <549040A0-1FB5-4E28-A812-4073A66E6948@0leil.net>
	 <a02682289c58c279707592fe71945addd62823ed.camel@linuxfoundation.org>
	 <6224b355-782a-9c98-b1dc-7484a19a1fa3@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-03 at 14:40 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 4/30/21 11:42 PM, Richard Purdie wrote:
> > Definitely not. I was trying to get some basic text pulled together on a couple of 
> > topics but keep getting distracted. I should probably put that somewhere else locally
> > and stop it leaking out. It was meant to be done and sent long before now...
> 
> 
> Oops, I should have paid attention to this too.
> 
> May I remove it from master-next so that I can submit the pull request
> again? I could keep a backup somewhere too.

I've merged it with it removed. It should/can be dropped from there and I'll
alter my scripts so I don't push there. Its just a bit of confusion from when
I was handling the docs patches...

Cheers,

Richard

