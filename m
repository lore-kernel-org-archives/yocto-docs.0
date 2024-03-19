Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D1CC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 10:50:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.12303.1710845414915556303
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 03:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=URqdoRtT;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d24a727f78so62615231fa.0
        for <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710845413; x=1711450213; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l/pXiXX/tltSlOV7dD8Y6A9v3EdPT6mImhsrx2WkRDU=;
        b=URqdoRtT9es2CdS+iRnfNdvuXVa3ZIVpA5mJUWQsR5y0rDAQoBGtO78YS7Ts+7+t6a
         oNPPJ312e6aPG0JKxRgMu+P2m1ZJ2B13znmd2q59MRcdoHkJqaQmDDbpLJaLr6oR5BxS
         4aijwSnY0e6IuLSBmu5tc2D8S7QBhOxpi1UaS0bCn/lehxxcULm2S25Nh2b5YvsZtGE+
         pQc/TiJK7t5//mBQ7O8kS5eEv7UfFsEyMnfgX6HEcISFta9TFbSJcEAELUsNajHcBam0
         BjqsBdtSJfH2G3e283/SWJda1eHQNntwtQNWfn/jShlE2FSD7HpBtzUXzTLtrYfc6Eny
         Mp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845413; x=1711450213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/pXiXX/tltSlOV7dD8Y6A9v3EdPT6mImhsrx2WkRDU=;
        b=D47upiCqizvc9wiemyTpGzrJNb4v6oCqYGB7cRnvAiEJptCRfF5SZvMUUq5DpTFOow
         YfhhI/0y1ocLrLfj9p+omDQ31ntN3SbYZmnAGvFJ6B/EeNwbvQo6Yb3fYHBsOA/HZUIh
         OtKxZYfdInRaXkeUGP889c4s5/mVedlGLc4mu42WAfze6aUdfg0ixiZQeeZtiXDCDAFM
         KomqVZ/cV/blb5Wq9Shff8kI9yOoL5bIYPqmV73M4Y/82XyaCJqQ6dox5tQVDI25aMmO
         HHdnNZJGQ4jokG6PT2jaC5/7b3sOpYGHJRGca2HVrg7OBrp1GP7cUz0Frpf+yp7sM8/V
         Bu5A==
X-Forwarded-Encrypted: i=1; AJvYcCV5QzNNbiiGihvwJ2HuzOZUK5XYVg8fTXTrYT3V/29mDkf7A707A2yCJFzb6t9a7JzKE3CZ5Lot0HB4fqLZuOX+4mrddc3COJaMgbc=
X-Gm-Message-State: AOJu0YzZwfZ5XXFTIlyRdPyJEkNOa/ETBmWwHMT4K39PyEEop9DaW2CE
	hRdJXwNSLSAI2IMHzFSFJBM5NpRC3d2CfzhEO+5Gg8iqqCOcozjdb8cRucmR3vWPgFt+06BpwsC
	2p7eNFZrmZYf8nGVSlcTUbf/3mGloCeZ+
X-Google-Smtp-Source: AGHT+IGMTa8hFhpuMi46ZjhtkLdhfBM/5tZKu4fMI+psLndmrq7YOaSooir/oGsumuryLn2SOmDAJg8Mbx+S1e+2d0Q=
X-Received: by 2002:a2e:9784:0:b0:2d4:5343:616e with SMTP id
 y4-20020a2e9784000000b002d45343616emr9388709lji.11.1710845412740; Tue, 19 Mar
 2024 03:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240318150211.1192651-1-alex@linutronix.de> <97f79f51-0fff-4c81-85bc-faf3468259cb@bootlin.com>
In-Reply-To: <97f79f51-0fff-4c81-85bc-faf3468259cb@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Mar 2024 11:50:02 +0100
Message-ID: <CANNYZj_Q4YBQ4KkkCiiQ76-HbpoMwtGbsYVhGHNHdTf98J64Yg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/3] dev-manual: improve descriptions of 'bitbake
 -S printdiff'
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 10:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4994

On Tue, 19 Mar 2024 at 10:27, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
> > -      (e.g. in the shared state cache) and then run ``bitbake-diffsigs``
> > -      over the matches to determine the stamps and delta where these two
> > -      stamp trees diverge.
> > +      BitBake to try to establish the most recent signature match it can
>
>
> s/it can/it can find/ ?
> IMHO it would clarify the sentence.
> If you agree, I can make the change directly, no need for a new submission.

I think 'it can' can simply be dropped from both paragraphs without
loss of meaning?

Alex

