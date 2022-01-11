Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10C2C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 10:41:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.5384.1641897715120708095
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 02:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JOuPzjSG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q8so32005102wra.12
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 02:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qZrx/cHKKygH+G5hJjl7tSk0H3CSZqCjKZmznT2EKeM=;
        b=JOuPzjSG8btF+Ky80Vj28u3Sx8yiJJirOtbucbJxVNCnhQG+0XmcG5n3smRaz06655
         WHQ4YeNJJf2jgMQ/5QRDiVmO/jZaHOMi+lMcn1mEWa06zhvWruLIBAZLv4k0tV+5DFuv
         Mja6Bg7EZiA2LXrSXxy5LGsxHfTTMyq0ESkAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qZrx/cHKKygH+G5hJjl7tSk0H3CSZqCjKZmznT2EKeM=;
        b=3LfcytCM/TFaRZPrAHdNlG8Crn4zIrGBx0YltBVmCyzCYHOhafeJuwFlWmGGEdeEDb
         KBC6LxX1lE/qsWUlZfeuwihVh9HVdj2fRx2ACZr0sTTkp4PQL4cAzv6NCCtPNvErcd5B
         i3cJMpLLfad7XbQlM8Kogjypk8Ji2LwRIurcisixgIdczSXKuuTPiajzVU0jlvu5edAi
         q0ZnQxO0Fs1PotjDgDGFpPUU1S1YyRLrp2NCJKGk0e7fnBKW0cOkhMkTgaBKLpupSkV5
         le0WXjVrBizeS9sOUrmvg7DGjwNyhVggajUiDYNgFa+a7rn3v982KYLMdAPUbINJQie2
         LDPw==
X-Gm-Message-State: AOAM532CJhd+kkl+LDFWkAEINgtuaQSoWXpM7Eb/vzY6eVydKMmSroSp
	tdcBKFtR2XaEoVnigZBeOpJmhg==
X-Google-Smtp-Source: 
 ABdhPJyP6Cr6XDux/g/6aO8UM9jMzHCIqJSaMqd6JKTutGFcO6wENuAE/KIDln/IzjVOrXfZS21tEQ==
X-Received: by 2002:a5d:624b:: with SMTP id m11mr3250564wrv.66.1641897713476;
        Tue, 11 Jan 2022 02:41:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4?
 ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 l4sm8970069wrm.62.2022.01.11.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 02:41:53 -0800 (PST)
Message-ID: 
 <a47ff8d8a5f6bd8cd0454b01d5291010aaca7d91.camel@linuxfoundation.org>
Subject: Re: [docs] No more nightly builds?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 11 Jan 2022 10:41:52 +0000
In-Reply-To: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
References: <69f31ad6-7e08-29de-8dc7-8dc575eb134c@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2373

On Tue, 2022-01-11 at 10:47 +0100, Michael Opdenacker wrote:
> Greetings,
> 
> Do we still have nightly builds? I cannot find them anywhere, but the
> documentation still refer to a broken location
> (https://autobuilder.yocto.io/pub/nightly/).

We do run them but they're "a-quick" six nights a week with an "a-full" on a
weekend. The results of all non-release builds go here:

https://autobuilder.yocto.io/pub/non-release/

The "nightly" builds don't produce shared artefacts any more, just test result
files and reports.

Cheers,

Richard


