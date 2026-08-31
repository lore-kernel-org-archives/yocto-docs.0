Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09387C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 13:18:21 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29284.1788182297167994996
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 06:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=asOMGQpA;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90e8372bba7so14350956d6.0
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788182296; x=1788787096; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/rbjEjMltDJvFV2QowvYHogm4bTQa0zrtYMrDAPvhes=;
        b=asOMGQpA9n4GF1DOHiPQUxbTkmxD8Zn90G9B1UreUY+F5FaKxojxpCynGSZ3Rh9Rq2
         CSaTYnaLmAmA3f1H9IOZv//5DSW9TclxFS4Dm8xh4liV+dgKfx4VmXAz8CXu+Ng31O6L
         F5s43fkyq8ZWEviU5U74scOhUhH6xlxoD+2LOczDMzjIlNH1I9Tpy1kxDEU21//Gmz96
         2oej/vEYEn+TxK+xytwug/Sg1sMqvxD/04euNEjQ0vkE4QFoHb8AVUWEeXOij0euXtwk
         g2qjblYFbWYEk/6oAZ8tkbiNS6JQUd8e8BVgGhyEZHcK6HGvFh+l1fEjE1hiaJZ6x2n4
         LfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182296; x=1788787096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rbjEjMltDJvFV2QowvYHogm4bTQa0zrtYMrDAPvhes=;
        b=X4rS0IB3Q11E4eIB6Fs5i+Ua21V71pXUnGdKlp5fMl8gOW9r+uuFswUAaAyaUWgMws
         sQX1NgaAQyzuSF6LGBsjzVR+QpmvvcFOMjd3mwB/GqOf+4wo3c0C+woNM80JgjYS751t
         NUvGyidmC8wDMLQv28bgXb2/jGpMY4k7QsnuL+d8UDvEuoDz2Z3LKIPpuadG3xwZ6x5+
         3MMO8QpffcUbFPxHgCynlv6VcYCDr+Ypwt4Vopmnd8Ralwx8+64zMEB6FogWIipAXsF7
         tyj+idchOmnzLjap+T8Se6NflfMQaKA6hqBGYG+7PwyeIyaTjGurq8+y3Yfe1i8PMA5C
         R4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwAuErTWwA7DmIC9v7wXBlXIHyy/uAOBLRfaOoMm4BNe3LC1k5UPpfIN4p/z23Kp0fizVjZ@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lBsvYOC8opoLv9+fMSkY8x5vZKEMPRkPAZ4g85M4wYkrHLxzie
	mds0ljt2plNMmt2Hh9bpnXlSO+izERGjwC2wNWeLNzJQGoOkGdgyF4iJ
X-Gm-Gg: AYBFou3hQE95FI3OqBDaiIWaOa15UMzvf/goKHUfCV0wcBurbgOioed2fX+Kh+Lli9M
	JwWrjiakDjZ+CucKset4EAKvRQ6F4uI2q5s/fHzYFJZuZkqv/wmqxS5Iz/Q8JDpg8EYTbBNQaGB
	hOCG/eCOaM+nZEPr+T6yUd5qPFkO9lLxOtU71/6S0BJmO5NkdWr3TZbrdEjmlsJvenry1dNyQxx
	gMjdm+EVCMOSw2ndRAu3pGBll1jP8XQbzx48jA9VnrZW1iCOWXo/tNI1DughQ7sBo635NdpSaud
	IYfKeq+uXZvMrR3giffDJsQZD20naiE7kzU/AGPocuYBL+Y78sAc78cguhh7demE+/+JwdnzKru
	NBtEVX0osdUHNBMXhEypzT9f4/OF5Or1ClEFl1u4RlXuFUpuEG/FhWuaoRadE1iUhAYlJ197FAp
	uU/ANXTFGXoh9Jf/hyq3wTiK5FHUtrGntU+faj4fOVjcrTT7i2YQJl44NQYFYGG1go3lcqEKCzv
	qbMr8jX8jiOiA71vj7Aupje3lADkAig1RjYA5ZD
X-Received: by 2002:a05:6214:2b84:b0:8ef:e3c9:533e with SMTP id 6a1803df08f44-90ce0e584f6mr359119996d6.9.1788182295770;
        Mon, 31 Aug 2026 06:18:15 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444e06dsm84459546d6.3.2026.08.31.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:18:14 -0700 (PDT)
Date: Mon, 31 Aug 2026 09:18:12 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <apV_FPBZBM1oej3t@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
 <ao9E-I2EAyMrtlIR@localhost.localdomain>
 <121fe43e-bdec-4f2b-9f54-e92dfa887e33@cherry.de>
 <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DL309JI7KO5S.31U2Y9LIHSH9Q@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 13:18:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10423

On Mon 2026-08-31 @ 11:01:44 AM, Antonin Godard wrote:
> Hi Quentin, Trevor,
> 
> After having thought about this a bit more, I think there are pros and cons to
> both approaches, but I'm leaning towards Quentin's approach. The other approach
> may feel "safe", and doesn't leave room to errors, but I'm afraid that 1. most
> contributors will forget about it and 2. it might make the process more painful
> for them.
> 
> So here what we should do:
> 
> - set `hightlight_language = "bitbake"` in conf.py.
> 
> - remove file-wide lexer enforcing (.. highlight:: directive at the top of the
>   file) (in a separate patch)
> 
> - use the appropriate lexer for each code-block that is _not_ bitbake code.
> 
> - fix any parsing error from the bitbake lexer (I did have some when trying it).
>   If this happens, use "none" and *add a identifiable comment* above it to
>   explain that there's an issue with the lexer. This way we can track them and
>   fix them when Pygments gets an update.
> 
> - document this way of proceeding in standards.md.

Excellent! It is fantastic having this nailed down.

> If you think of anything else we should do here, please share your thoughts :)
> 
> Trevor, if you want to send another version of your series, please rebase on
> *master-next* as it contains cleanups to the conf.py file at the moment (+ some
> possible additional code-blocks).
> 
> Thanks both for sharing your thoughts on this!
> 
> Antonin

