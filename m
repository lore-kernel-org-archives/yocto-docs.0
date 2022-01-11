Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD68C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:16:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.5681.1641899817806289281
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GVFRpC/+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r28so3902697wrc.3
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 03:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=w0xKRPpLRdG15lj/St78NkLXyMA9paqKrCx94PywmxI=;
        b=GVFRpC/+LepTwvhegPgB0ohCA6U7CKwku1obf7Qx0JuhghQpCYdu3Zil7PwYlFkAy1
         XDqeNeQZc8t0YojZleR6TRR1ro5NcLOjPQCOzm19+RW25sAiIRWtOQkWTWAVnHVb+Cp4
         moYscbnDJQRrzUE4wTk6MiLaAz2ZCTn+54XXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w0xKRPpLRdG15lj/St78NkLXyMA9paqKrCx94PywmxI=;
        b=Gq1mVl0pIFJ2Up/Cw/KzHsTeDp0Njg8F1Q7WhMnTuOZi3gFRS8+JL3qbvoxFv2jbar
         cgMEuWiRE1cQ4OjZMpcg6pCbhYfOT73hh6qvvW38Pu0xnqXAbHG3+gOQfZjHRZ/r/Y/A
         WQ69+CRoIU/T3v3ZW0eXcMfqGtLy5TgUOQw+4WxeDBMr6siqkFr3cRRtZ5tsJ8sCP304
         DKZQqnUniDECeuG7AyNJEhlmJE18bdQFQKAkX5ZkjeRERhM/bGLEctFdavivoI/7l6a1
         JJMVc1MEuO5OD6XwwrTQ/QtrHNK+BG3GbeLuSN9EMgl81OQYdjz7uGtGp1lkSDy4AQl3
         o01Q==
X-Gm-Message-State: AOAM5336BZC1ZTMe3Gi5Cpv7Tc+xys7OnlwOM7JMK7XdwQqn7PLi50ij
	847BOn/NgJGnXL3zU2D8kzBt6A==
X-Google-Smtp-Source: 
 ABdhPJxtwvDf7qqX0VAmyvrNsl9JuF7j49LRdaWtBIGydAwyQSCIEx2OmWdzRgBoD8Y4mueR1LUdAQ==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr3430502wrf.279.1641899816011;
        Tue, 11 Jan 2022 03:16:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4?
 ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 f10sm1595879wmg.43.2022.01.11.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:16:55 -0800 (PST)
Message-ID: 
 <9f79c58393ea2b743ae6e4d7c0f00d92b4b88320.camel@linuxfoundation.org>
Subject: Re: [docs] No more nightly builds?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 11 Jan 2022 11:16:54 +0000
In-Reply-To: <0694d983-509f-61ea-ddaf-e97835ecf678@bootlin.com>
References: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
	 <a47ff8d8a5f6bd8cd0454b01d5291010aaca7d91.camel@linuxfoundation.org>
	 <87033aaa-0893-b2a9-96cc-d7ebd59bcccc@bootlin.com>
	 <3b82d9590897c50ad54ff22137cb7163b26267ce.camel@linuxfoundation.org>
	 <0694d983-509f-61ea-ddaf-e97835ecf678@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 11:16:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2378

On Tue, 2022-01-11 at 12:12 +0100, Michael Opdenacker wrote:
> On 1/11/22 12:09 PM, Richard Purdie wrote:
> > On Tue, 2022-01-11 at 12:01 +0100, Michael Opdenacker wrote:
> > > Hi Richard,
> > > 
> > > On 1/11/22 11:41 AM, Richard Purdie wrote:
> > > > On Tue, 2022-01-11 at 10:47 +0100, Michael Opdenacker wrote:
> > > > > Greetings,
> > > > > 
> > > > > Do we still have nightly builds? I cannot find them anywhere, but the
> > > > > documentation still refer to a broken location
> > > > > (https://autobuilder.yocto.io/pub/nightly/).
> > > > We do run them but they're "a-quick" six nights a week with an "a-full" on a
> > > > weekend. The results of all non-release builds go here:
> > > > 
> > > > https://autobuilder.yocto.io/pub/non-release/
> > > > 
> > > > The "nightly" builds don't produce shared artefacts any more, just test result
> > > > files and reports.
> > > 
> > > Right. So the documentation can stop referring to them as a way to get
> > > the latest code.
> > I think it should be replaced with something about "latest test results"?
> 
> Maybe, but then in the test manual, because the section referring to
> nightly builds about getting Yocto Project code
> (https://docs.yoctoproject.org/dev-manual/start.html#locating-yocto-project-source-files).

Right, in that context I agree it can be removed and probably wasn't that useful
anyway.

Cheers,

Richard


