Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7C6D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:37:35 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5476.1768912650217998467
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 04:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5uKEdOI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c5349ba802so493902885a.1
        for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 04:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768912649; cv=none;
        d=google.com; s=arc-20240605;
        b=IFH5V+WyiPF4SwJSj0cZQbYtDjd17iEgCCTZK8hBU8UcBWVgNyZZVrjHO8VxxNKRr7
         pEZI/J7++DAiwQNjvOrWNbwDE7eeSFd0xOr2xspbNabj6tDUmOmtSVewWxXsimBiMUPq
         hyL6RM6XqQ9E1PAfeV04a4YdvrO3WLVpED5ZaJ9N83q2C+W1nZ9fAFfctJCEMifsPoX0
         itFA3dpLqj2slgoiZrdAFZQiTt/HLdxt6wrHiYXaXCEB8510qNJ6rkgnsWb8Xk2vYJG3
         /EM6yy16syGJpTn36VGYiQoKbyxUrcfJhpXe1whkVlFV4Y/3A2oneDNKDFDMFggVtCXW
         phpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v7k9KPYDs1mwiNIRnWB0md4RgBEDadW2oOhiWlRBrRI=;
        fh=SJm7xgLG+FBHpcYmWUv3UQTJKgcJ0Zo60ufnwyTeYTQ=;
        b=h9GWA9QGUgaJyBJx2I6dmHv8s234RMyn9YuuOv/XZ8JEEunxLy/R0fqaflYIVCfXKD
         qmPnxXrA8iTBtzAbUEXjPjZN/Tn6ZvxxzFdONHbDhedtzc2l1ztdT25O2wq1AO15oW/H
         esbmqeWqDkDFYWuEaiCiw8CkZ/UTQnqJYtvLwy1reM7xVQRhVHnCkv/Nsnf0SJWsUcP/
         pIRfd5Q2+OxcyspghTkH7Bg9Fa0bpYsZVR+njWFMw8zE0Hl7KksZPLhchs6k9wXgxjvO
         5WPjcc2xUH6agXZLEoijyHPOxT3I1jO3CHdMXDg05pguVWe8/4k7f4y1CuvLnZDNEPim
         pekg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912649; x=1769517449; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7k9KPYDs1mwiNIRnWB0md4RgBEDadW2oOhiWlRBrRI=;
        b=i5uKEdOInMC6OsgZ94ssnydXG+8rwMgsZu3NCVHLt2nYhACzq4i/sjxJe1X/Wf+6/A
         a8/F3EuQz0gcv0Ooea5O95h/ioFEF7r8UYt1yVcEwqWigjd8WuiOizIxrGe5X+9spFOF
         dFfyybEZHGpxK68rjjFrprQZbpGtL+UtFm8S2VTdTDdJjSkgNTlhSl/WPB3w1PgR27JA
         bVwupdm/3LodK0Yjoq4BgQNbaikax872VXD86rRWXIDR+MQh7GC3/IJWGDqoHt5C2INM
         XquH1onh1+8ruyL2EK+buLTGHxgmu+GfXAin69Jdk24+pAGRc5usIvLMyxWmMYxHfRmD
         1O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912649; x=1769517449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7k9KPYDs1mwiNIRnWB0md4RgBEDadW2oOhiWlRBrRI=;
        b=QZG5uqW+pCXCXCjBnil84iJbPRrOVHwhEWV4hNnUUjci7HpXkaxNLYwO83MiHjqIXY
         0gRK9EAHe0jQ4nlgTBuVLprj4mLR4WTWxiJcz6o9w6hfa0/YJekBA2n0fPO6zwZn9nmR
         SnwJZQdb00aBq43rbHJR1Vzs5dU9Vr118AgXoDhCffIqlN6fXvneyQ7L3hc8FzT3XQoU
         kGGMez41+TwBLp0/Oia5lPn1x3TLTswZ0o3VN/jO/EkivenPBYCw/RRwtuN+TyIi3fSo
         dNUAgFmtziWnBm5PNqEEPaMc/IxGxw3GtH1JXg2vWrvWwMXZZ520wHYLANwAIw3HynsS
         JxEA==
X-Forwarded-Encrypted: i=1; AJvYcCUdsBx55T1KyUQAv1bMtYI5hhKHdZ7VuvUNrFNU3pqQ0KeYe8JjVLc02wPQ7CYlBNuaQAGr@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy1sqANwtZQ7/HOFvo5vmdIEESI8mwe34SO2dE00BRr1SfLweev
	FX8qHx9scVAd+waHGlKFO1ht+Y9ZVNN6x862K4C8iVwwwEVsfLMkor0Nm5dMkUuHW+D11DnbXdY
	L7NmAbMMqDFwRwBXyzcQAchGT7BvSfTY=
X-Gm-Gg: AY/fxX7AYHmbng/hcsqO8fHeYrZBVf/dMpKfjSC+EawKjsG2EagBQmbSj0BBCRP86Az
	KSEH5uJ5iFsm7jWSDilv36R1TknICCbznztXphb02cmXPWT5boIdhgPc/jXg7FTyhCFkdY4xZir
	HSRWeSYHt04UofjXoxtUpkhGypEa1eqjwHQl/7kG0MsQN1B01ak2SVRKCzXLV9rrG/yACXazu6a
	WYRqSxOeKdLaxfS8B2eoWMDVRQUrh3IXp/e3FoA7XD5sssrJAN8yEcydfAEdeRwL+o8RXX/APHU
	tyKNiIiGUkWVNVfKSDkmjz3JgUoyBg==
X-Received: by 2002:a05:620a:44c1:b0:89e:99b3:2eaa with SMTP id
 af79cd13be357-8c6a66d665amr1932590985a.8.1768912649091; Tue, 20 Jan 2026
 04:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20260120-bitbake-setup-choose-builtin-v2-0-ade604ff2351@bootlin.com>
 <20260120-bitbake-setup-choose-builtin-v2-1-ade604ff2351@bootlin.com>
In-Reply-To: <20260120-bitbake-setup-choose-builtin-v2-1-ade604ff2351@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Jan 2026 13:37:17 +0100
X-Gm-Features: AZwV_QjobJh2RLsQbOakjU1gjp_0jDuzLaJTapbL9N783IfOQzUxADsUaXzCbrI
Message-ID: <CANNYZj9pmrFRNoLt9od1yVfDiR=5xZafPrYSaXPe1bsDoayOJw@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v2 1/2] bin/bitbake-setup: add
 descriptions for fragment choices
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 12:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8591

On Tue, 20 Jan 2026 at 09:57, Antonin Godard via
lists.openembedded.org
<antonin.godard=bootlin.com@lists.openembedded.org> wrote:
>  bin/bitbake-setup                                  | 21 ++++++++++++-----
>  .../bitbake-user-manual-environment-setup.rst      | 26 ++++++++++++++++++++--
>  setup-schema/bitbake-setup.schema.json             | 21 ++++++++++++++++-

Oh, one more thing: adjust lib/bb/tests/setup.py to use the new
format. Even better if you can tweak it to use both old and new in
test configs. And it needs to pass of course :D

Alex

