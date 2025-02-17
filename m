Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C998C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:40:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.58417.1739814044641110793
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 09:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JYf6qJ2y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so2791087f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739814043; x=1740418843; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=plLpeufaKUj2dywmM82mEnEjpr8bZyjCga3ilq9HdyY=;
        b=JYf6qJ2yH3Bp8gvtCoKWDJjo3Z+ShgXEGfeRC+dxfDeETXgxYLEF8tVUc9tANWDoa3
         vWk0qoMuZqUM0JYN86UmBoE1QLzIsEtYP0xGc77uBf7XjhICSsj0QorJoqDQUURYIUHB
         dt35dNeW7TcMW32neXf7sqLtUJ0MkyrDwJEUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814043; x=1740418843;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plLpeufaKUj2dywmM82mEnEjpr8bZyjCga3ilq9HdyY=;
        b=CsoYGf3rolcGYsfOu8ArKtYLQyj9MlpEd/XOEFyi2dziHdjfXdfeRCdp0w63xKqSSx
         i/TP/VuwevA+5JRBUPdyftF8NdZg5NHojuEAzk7tnfjY6qv0gCgODdX+BRy9eOHxQzO5
         ko00F9dngD4Yd/xGos1GKdYiSCvzKEmqWEZtp9Gft7L7hJmUgZRe7x2qvHVMRFdLwoB+
         DJ9s5lL1H4ty/S8Zc8lcG7I80EHkALERPoSej0ACfErLxqdIHEQzWfk/n9Q2MESd0Bk6
         BWQ8so7rU0ocnmhdlZ2xQtU/d0PVjdtb8y41aVYRkBB2BwaOCoSFgpuOj3gOZn4UnA5x
         D+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKHCdhMlw9edVbqcx9WvsHeP96xs4plxO7A85MxVyaQH2XKr1ZSVTXp/NKlxorGbXOV8GZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwVZHbzvhjEuTdQtPkx5bf1y39vkGyoi7RtIqwKxOK9hkqp5NI/
	sPfUwgEOeq+74sjiPHXRARf8Zcb8ZNN+5PbDOkU8q+rwfb9IHw/vDpKRfU20bWk=
X-Gm-Gg: ASbGnctOCZNRc8ZFMiToM0YdT1QDkB4QFR3iP8z/AO4nESxm9/2nbz1d5EPGfg+jHAn
	DY8escUR16zaFoFVLqwKlAD6JHQwc4IsTReQ9k+ViK5lIV0k7S27kaxgX/XYcEfG+hfmSoDff8q
	68HBpcM1342KkLiIcuR/snYQBhq+27UoSBBfBtyWbjrw+uZiReeAtPceOkFuJltDtaCpAszQcaN
	ofSlZQRfTdsteXEfpeiz1ejhHyKIsa96plT1lmInTFHrnfUkccJWC2fm/4diUeb/8TUdA9s49tr
	4cNv+4MAU7gwl5vQM3dvXHqU4Id2tU6BNIIr6KS+zNEavugLdYylLEE8hz4Kjc3uR3Rfj62k8jW
	P0u/8
X-Google-Smtp-Source: AGHT+IGJTZpLrtyKlOhuknEoobKyDBH4yXo2A/LXzxbe2xDN9tM5OGTTH5jCt7uMsjxoLInWiZZ4lw==
X-Received: by 2002:adf:e80e:0:b0:38d:d4d4:d381 with SMTP id ffacd0b85a97d-38f33f38841mr8837959f8f.15.1739814042953;
        Mon, 17 Feb 2025 09:40:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc? ([2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fa38sm13070858f8f.98.2025.02.17.09.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:40:42 -0800 (PST)
Message-ID: <575c5c0ad169dc8f9c93a2c89b221605bdde8abb.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on
 AI generated code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC
 <tsc@lists.yoctoproject.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2025 17:40:41 +0000
In-Reply-To: <4f94b895-6470-4e4a-a84c-1eff294d869b@cherry.de>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
	 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
	 <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
	 <4f94b895-6470-4e4a-a84c-1eff294d869b@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 17:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6402

On Mon, 2025-02-17 at 18:10 +0100, Quentin Schulz wrote:
> On 2/17/25 3:30 PM, Richard Purdie wrote:
> > On Mon, 2025-02-17 at 12:20 +0100, Quentin Schulz wrote:
> > >=20
> > > This is exactly the content of the link provided above. I'm not sure =
we
> > > should duplicate it? E.g. it could be updated and we could then have
> > > conflicting instructions there. Should we say which one takes precede=
nce
> > > when there can be a conflict?
> >=20
> > It was deliberately duplicated so that if it changes we know what it
> > said previously. This version here is definitive.
> >=20
>=20
> Which version is definitive? The Guidance page from LF without a date
> nor a version? Ours? What if the LF changes the content and we don't?
> Which one takes precedence?

By replicating the text we are showing the thing which we are basing
the policy off and indicating the text that takes precedence (the
quoted text). Our policy and documentation should not be at the mercy
of changes by any third party.

We therefore want to indicate we took the LF document as a basis and
built upon it, recording what we based it upon. If the LF document
changes, we (the TSCs) would have to revisit things to decide if we
want to adopt those changes.

Clearer?

Cheers,

Richard





