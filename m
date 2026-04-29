Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C9AFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:11:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12274.1777471900919135998
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 07:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i6/hPmJv;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so147736135e9.2
        for <docs@lists.yoctoproject.org>; Wed, 29 Apr 2026 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777471899; x=1778076699; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsaQNVoq4S6+n5sskorI9xNspPcsNDC+qNkAlpahskQ=;
        b=i6/hPmJva7vISvgTAMtD8+5O1HTE3IX27WNFV2pOmRSHuiedzN+Eu8X4YBxwVrlDOm
         vEln306Fi37/VvEGc4F9z5D3TbRBDWnq7EeRrb/Q+3H/zdsntWKS8iOeQQ+rzidQXqoh
         XX/WTrK4qMXrld1oruaI+TuzOl0mA0hjJdiGGmMbj+Z8bDsWYjXNZvkuQQBC/iUHSYYO
         XhaR0sS36BuKoXi4s7BbBWe/2WlwNbuINT1LY6Ol+v0u8hAx6o2li/uPhfJL+Oo/5Cwg
         q6fXEtIT+lMT6YrWRdD6bC/D93OvuwzQVAQutyvaTf7/pcwWmiDDGveIsaYeIPyDbR1J
         HVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471899; x=1778076699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsaQNVoq4S6+n5sskorI9xNspPcsNDC+qNkAlpahskQ=;
        b=LJlI5efre7l9myWGY3mxaSB1P0Z/S0mZXPfhxVoUkqwS18pKs8MUYklQQvuZQZRkb0
         pR2Vemk6xVuqetCBHUFZnu/gCWtMPngamu/oFzDHmYCRA49tiPl1tF1L4Q7n9vFlk+R9
         jBzdV9QfCmFTKouUjHnHrNCTOXCa3XusyT7YHCIVKAeJo7vpTpgmDgpBk//986bfZJ+P
         Y7b3ZupxRcMy/RWvnlhQZ0Tg1XhjeE4Y/aKQBnyhDsNH2CKS9AXXrUVUueiRZSjn3j7B
         c4p8hfR1iaLl5tVor46jjASYjXXh4qCsvdV1EUv7VrfdOmz2w4mFjCwufFbKee5gIxWC
         Ki4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LdcU+uHmXHq1F/2NcMKWDPm8xNaG9zo26D2GlUSLnYnFUWLZ0qmCXRdL6nc2dhxkX0QUU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzWZ04Ol/2SAWhlL6vN+CakYbcEwKg/4729BJ0DK/fTlTBaOQwQ
	q6KooY++EU3cC8qbWAvbwrJBfD5X0GHbls9U1+MQdGJOsvNCga3fLLZx
X-Gm-Gg: AeBDieu0miQ7S9lpQU0H0HZ2TpkpXV33mas0nAct+humfchWcv7C5aFBBjySHcrXKqy
	SnoAQ5wDTH/2gBeK72j7zeW2QAYNpVdE0gRJ+sDZwx4+K9JcRrGUHx0o+l6GLclyGEpYzkxRN9u
	ONiRjJfKDcbh61x0Htm2yfxWM6YsAcwBx1qaZ0DsYr0mSq7XMQe8aaVixro7eBiULkeYuFAIX7P
	9sAUHv3r3DOBoN5m7VddzlzvgzTJT6NS1riKriMoSTKJ6qJpQaZ1SGhXI/aWbSiyA28UyVM/k3S
	3Q/VI5ZVxD/kfgN02HCr7UpkW7IQTqpZUhVwMVV3AZ3gaeIOhXEGfSpAiW/3vRSwr2jdB39EXzC
	2gBMVSkqrH1SSErQbzlpJjFGcyu1zKc1ywU3Kc92UtSOLVC78A3OM7GcbehWbdyMjiQ/nqLOJzY
	SiAPIn3q5wqGpX+bH0B6dBKZcA86HztVu3xrEz/Y4Zd4N5a37Q+4PuF5ALyYGmj3ldZ+cnxBssT
	fOa0Zqkptj9ASUF2rl/Q+c/wIMSB7i2GsGYazH21ShNGwJItVE=
X-Received: by 2002:a05:600c:5247:b0:489:e696:836f with SMTP id 5b1f17b1804b1-48a7b519485mr69695185e9.10.1777471895031;
        Wed, 29 Apr 2026 07:11:35 -0700 (PDT)
Received: from thinkpad ([2a02:8070:d188:380:590d:4498:b2ca:2c58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057f8sm19643125e9.14.2026.04.29.07.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:11:33 -0700 (PDT)
Date: Wed, 29 Apr 2026 16:11:31 +0200
From: Dawid Bijak <bijak.dawid@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [bitbake-devel] [docs] [PATCH 1/1] doc:
 bitbake-user-manual-metadata: fix inherit_defer documentation
Message-ID: <qwehgszst3cphuw4jqsj2u36333p2lpo6cytkdcx22prjmxrdx@acnraxmxwfl5>
References: <20260424062327.820993-1-bijak.dawid@gmail.com>
 <20260424062327.820993-2-bijak.dawid@gmail.com>
 <c25e0e9a-8809-4ac6-90ee-3687972e03af@cherry.de>
 <ljbjkwt32h72aziah2gepb6k5rfxygfrhkfysmulj5scnca5pu@o4vikz4hfmh3>
 <eeab5758b01722f5474855d21f718ea2d5cabff8.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeab5758b01722f5474855d21f718ea2d5cabff8.camel@linuxfoundation.org>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Apr 2026 14:11:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9385

Hi,

On Tue, Apr 28, 2026 at 09:42:28PM +0100, Richard Purdie wrote:
> On Mon, 2026-04-27 at 20:14 +0200, Dawid Bijak via lists.openembedded.org wrote:
> > Hi Quentin,
> > Thanks for your response.
> > I'm afraid I don't quite follow your point about PACKAGECONFIG.contains.
> > I'm not sure what you're referring to exactly.
> > But, as far as I can tell, the inherit statement works fine with inline python expressions. 
> > I think, it evaluates the expression in place, much like := would.
> > 
> > For example, on current master I tried the following:
> > �COND = ""
> > �COND:append = " x"
> > �inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
> > This inherits foo. 
> > 
> > However, if I move the :append below the inherit directive:
> > �COND = ""
> > �inherit ${@bb.utils.contains('COND', 'x', 'foo', 'bar', d)}
> > �COND:append = " x"
> > it inherits bar.
> 
> It works, as long as you are sure that COND won't be changed after the
> inherit. When mutliple files altering the variables are involved, that
> is often unclear. I think the doc's intent is therefore to recommend
> anything with variable accesses is therefore deferred, unless the user
> is sure they know what they're doing.

Richard, thanks for chiming in. Your explanation reassures me that my understanding 
of inherit_defer was correct.

In summary, I believe the 3 issues with the current documentation that I identified 
in the cover letter are still valid, and my patch still applies.

Greets,
Dawid


