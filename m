Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFFEECD6C1
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 16:25:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23090.1770827098456775983
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 08:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iGr2/YB3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso19985815e9.2
        for <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770827096; x=1771431896; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=96rGbZEn9wDZc69Gtutfvj80G7TE0BE5n8/zw7fYSVs=;
        b=iGr2/YB3AHgBaYchbJ6eeYOvq52S2OB/A9cZDsgaXogo+ZtApEnBhTBeHftnbrgzjM
         lwFMJ0fC+8uGouOzXTlIKPajkJshMcIGE468+uDCAUzCwCFqrdhooVxclB1fGBUki6NA
         ga2lo5GmbdasjKU4N7R/02PBTDFJmnfJAThQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770827096; x=1771431896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96rGbZEn9wDZc69Gtutfvj80G7TE0BE5n8/zw7fYSVs=;
        b=vWaTqUWnZsqdgkauMIYhMnrBv/MpeB2cutp/43EfoAVzCw5yMRx5vkFNl8Go0l0Odb
         RH17ZJgjNHQgkdoCUYNBbzK7AvxfYp5127AgQtLpQTLLlx0+apQ98J5fS1PEVn7swBGg
         7uTPpNJ8JkoujL0dh4+hMFaT+gBOUdP7bf8CXMnP6FX3VsOgvuzuih1pW5giPRlsDVUl
         wqaJhyn25GE0+5FKueuNWi85H/VXTSwlDPy9yVf5mIRPhmgPOVknjgNKL33Ty61HESPr
         XY1Y7X9uXQB/vvMuMJGxcD2BqZLOzOY3JWn3mlqQhrQpbmlxfMURecSeh5MzJeJuwYP0
         EFjA==
X-Forwarded-Encrypted: i=1; AJvYcCXsiQPROWjEo9uQtJcRYvehHwGmjXW9tMht6I+PUfGJ9TRrE8Zf1KtIjkEA4lFFcFt5A9u5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw6jcoCJcjmjgPpPMHlKzoCUNjiroTdyR3Bo3zxMsURmY1aotfj
	xne4lHahgMWL13UCTLHyKKY1HsNxY4uqFvLgRgffb6vGvCf7PqwRJwSvlLAxTSvfB7s=
X-Gm-Gg: AZuq6aKINqvbZMawP3quMRvjrLLbWI8AmDrje8BvWW+lqs4ghRd2zkj7ZNWke2+h2mG
	OivD2/PVdRN8qb+pmVORDhrwwIQC7Az4U8FJ+4phDUnydRHQDggD9TOmxrRw8CtU6RR/T5IrOJF
	cKL4dikJdo005pZwoeddmMz4Z7dFfarBx0HGVlDI4/lYpo9Xt22907UC2jGRalessTijA2VisjX
	bLCizjy5154uvMxUqVznulbONJylHXyY3f/Wj5CjHXjLF15HOjPj7LLzuJrG3uIol9zfG+xR/5G
	1gyhiCst3kk87jgmMXY5ttObh6TFDICjJqvgk0d3Sd7scDjtTRJxov3qitaRe5fBzpx9riE2rTy
	u01wMApOFqBzW/fzc5tdopnR4IDfxRM3716qFPU8JPpi9UDlB1FuxZDGMZWv12zpg5jAFIwbPjU
	8I/cVmQuAHRKALz6CU/tZnL300B0Gye6T5wjT9o0Uv0VBOXRWMEX7QgieZDIjmhwszyN67c51ci
	mBGnL0NtoJu
X-Received: by 2002:a05:600c:3509:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4832021e93cmr281994765e9.25.1770827096578;
        Wed, 11 Feb 2026 08:24:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cfe:c2d7:e79b:dfdf? ([2001:8b0:aba:5f3c:cfe:c2d7:e79b:dfdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd20519sm89055225e9.15.2026.02.11.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:24:56 -0800 (PST)
Message-ID: <b6fb6b4f14528eb57b02fed6afc6d347bb28b59e.camel@linuxfoundation.org>
Subject: Re: [PATCH] migration-guides/migration-5.3.rst: add note on *FLAGS
 behavior change
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Feb 2026 16:24:51 +0000
In-Reply-To: <20260211-note-on-flags-var-v1-1-81bdce729333@bootlin.com>
References: <20260211-note-on-flags-var-v1-1-81bdce729333@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 16:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8888

On Wed, 2026-02-11 at 14:53 +0100, Antonin Godard wrote:
> Add a note on how existing *FLAGS +=3D assignments can lead to unexpected
> behavior in the 5.3 release notes.
>=20
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> =C2=A0documentation/migration-guides/migration-5.3.rst | 42 +++++++++++++=
+++++++++++
> =C2=A01 file changed, 42 insertions(+)

This looks good to me, thanks. It has been a source of confusion for a
few people!

Cheers,

Richard

