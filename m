Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4506.1626936028794268474
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 23:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UhgxwC0p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id f10-20020a05600c4e8ab029023e8d74d693so2295068wmq.3
        for <docs@lists.yoctoproject.org>; Wed, 21 Jul 2021 23:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2K2iCpVFFpCe37gRahE9LQ0GovINvn8N1L++u3HhVqc=;
        b=UhgxwC0pzIXrukXHlms904Xh3zU41zKWMZTOrEo+WfDIcSH+lkDPAfIwylkandGYpE
         QS4CeNiB2+j9hIFdprA/ACH+O31tYzxL9642DkpxR3KdZ+l3QDon6E37i9lbjaFLXKsY
         7eGuQQW5Uwa1219IRMZfWgsQ/kbOPAfJoVSII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2K2iCpVFFpCe37gRahE9LQ0GovINvn8N1L++u3HhVqc=;
        b=YeIzHKv1vzH+hSdwFGtgu3m/9W17EkdYL8/3qcaNm7jrM+IdWJoYPK/Os7UH5aBwvl
         ks8l/qepNEEl79xPr3sKgsK5blu9YrrU3RlExAb5ed+ZiQvcqx8ebjJrmo7b3ldhwFZc
         ATsKWMCHYYQfauNOD6Cxy8fNyEiQBEzu5EGeAQO9AWZJRcW0f8OzdcHAnkzjC6bJqpwA
         g2bsYduZ68j/nhS0N+nlastJRly6VtNJ3YYsLGcapx642x/qviQSXltcDkwH0mRSxgUw
         zvnPdCiK+ocnwHUYOT9Wq4ixvsu6xIFNtI/iIfrs/jvH7vSKrtSZXT3G6XV/Lkx9E21g
         wi2Q==
X-Gm-Message-State: AOAM533GuO3ZOBfyyExY9r/qhduk61orEt+RNnqOyc4mDOGyZ8SfOQB8
	95UBtSIVRU7fKJeKbOXKLpo0bA==
X-Google-Smtp-Source: ABdhPJzYqsOt9vf0C834R3xdISMvSYze9pu1+H7u2Fo8YGMvizffSbJ9ljrzSO9scWrCfsMiFdGHfQ==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr7398866wml.177.1626936027042;
        Wed, 21 Jul 2021 23:40:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id n5sm1728414wmd.4.2021.07.21.23.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 23:40:26 -0700 (PDT)
Message-ID: <9aebdc2ca149587d39cd23628c392423148f22ba.camel@linuxfoundation.org>
Subject: Re: [docs] "metadata": plural or singular or both?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Thu, 22 Jul 2021 07:40:23 +0100
In-Reply-To: <dddfda36-0837-51a8-39ad-3b49eceb4e84@bootlin.com>
References: <8b294bc7-ab17-3dab-2cf6-ef2af316ca00@bootlin.com>
	 <db9ccfa4d7a7c41b6f926366918a71c76c37ce7c.camel@linuxfoundation.org>
	 <dddfda36-0837-51a8-39ad-3b49eceb4e84@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-21 at 19:04 +0200, Michael Opdenacker wrote:
> Hi,
> 
> On 7/21/21 6:20 PM, Richard Purdie wrote:
> > Hi Michael,
> > 
> > On Wed, 2021-07-21 at 18:11 +0200, Michael Opdenacker wrote:
> > > I'm currently reading BitBake's documentation, and I'm always
> > > uncomfortable when I read "Metadata is", while I know that in English
> > > and in Latin, "data" is the plural of "datum". However, many people seem
> > > to use "data" as singular.
> > > 
> > > I also find confusing that actually "metadata" is both used:
> > > 
> > >   * in plural form as in: "Split metadata into layers and allow layers
> > >     to enhance or override other layers."
> > >   * in singular form as in: "Metadata is stored in recipe (|.bb|) and
> > >     related recipe “append” (|.bbappend|) files"
> > > 
> > > How do you feel about this? I'm especially interested in the feedback
> > > from native English speakers, which I'm not.
> > Personally, I'd read both of those sentences above as being correct and
> > they sound fine to me as a native speaker. There are other things in the
> > manual that probably grate on me a bit but not that!
> 
> Thank you for your feedback.
> 
> Here's a more troubling sentence:
> "BitBake executes tasks according to provided metadata that builds up
> the tasks"
> 
> Here, "metadata" is obviously plural because otherwise you would say "a
> provided metadata", but it still conjugated as if it was singular.
> Doesn't this sentence grate a bit?

That one doesn't sound right. You could say it is missing a "the", as in
"according to the provided metadata that builds up" but I don't really like
the phrasing there even with that fix, the "that" sounds wrong.

Cheers,

Richard



