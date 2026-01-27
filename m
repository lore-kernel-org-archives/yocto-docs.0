Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6BDD2D8F5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:38:58 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7600.1769510329277274030
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dOn0TwBn;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8947404b367so68129946d6.3
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769510328; cv=none;
        d=google.com; s=arc-20240605;
        b=Lq9GzwcP53LkUi2BIPVf6vFuWA3OzqA9Jz2mg6WZdvXQiI4SLRV8dYn15a3593SMD6
         3SLy0/KvHc8KWyILMoE+eStNv+kwvyfVxuBe5ss/e8LsdVdS5SVjfyKLULI9NnNP5J/X
         uZfN3ezCFXC+sQnb+TRbcutqfQ/nTgjWqSVJCVzMQsMgv6tgwPDsXuykc7HPnhvPnHdD
         S5kmPX2y5Jdah8Ro1Y7w/fzUp9VQkGu6RWQUOKMUBhutCZo4HaqN7ibqIQOaiIrwXG/x
         3CoLUI2gKiCVuW2TPTIfzdIilV1qKH0eNfNUc+DgTK/FFCZIn8UQIeOTxSctMyLb9Ed3
         6cDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4v4eSQ8jgTzNdM3sbXh8YrUEq+2TIvFlzsH+VpZCLXc=;
        fh=FktKngxNgwRiOrQEtl8/u6lCxWE9UOoZhy7PP2iwHJM=;
        b=kfEy9yGGf/mUtkVAl5p0Th2/fantgGzC0qY9WeMlUSti7PFppqtg+7YYqo1Fn38zrg
         ShZ0X4FSbjfQGyppAUesNRfK4CT4337aHJ6e9vKJZiCGHRiroEXYtpk8zFobaf2QE9G0
         JA8Dpev3B4wcxvttbRU+kKnByjU7Ty19h/tGJ7Hc0vP+gpjlX7PdsghiUv9m3mEE3xNS
         VAesZFrbGmgLPVkFR4vYiogWQJ6/nLs3jbnhTP8J2eoSPcxytxeVPOUgX4ebe+BjhVYg
         eJlp3Sfv0Xnnd5Le3n85l/f5eoWSRHzFc0ZeToB1aNG5F0vKDov4/a2aaB5coo14j/th
         h/EA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510328; x=1770115128; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4v4eSQ8jgTzNdM3sbXh8YrUEq+2TIvFlzsH+VpZCLXc=;
        b=dOn0TwBnHn75uvdfbkK8gXznDh6FAyEE8LyXXQ1Rs9+hQN+a8qGLfa6P3CRhkkBiV4
         tEUgCKbdnmOSGoBKqC27icj704WEKAWp5QvL9fFUwdcwYzf+6w95DioO9NbnR6QdFQUE
         Ds1A+JD9OR15M+BdUujy2EGDRFhUPMrNJOHWjARf7uM/nD8rkHSnn3ByDobSsy+nqCFH
         +veQGydU1Jxak0lxJk+wlnxDvzYfldZzUji3n44ktll335zsf3buwHqUHD1oGWC6oErf
         AtoECl8GpungyvG5JCoRUZD/8F/TX3sAcaHzccrrh64Sq5UI9dobzZhOif70Ey36BJNX
         a1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510328; x=1770115128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v4eSQ8jgTzNdM3sbXh8YrUEq+2TIvFlzsH+VpZCLXc=;
        b=SexkXd/Qj3CTo1n9dKLbsitZ79JKRMetUC1Q7lnCRajUCkFI2Dj1XUffC34rW+YyKk
         ofPX01ChP7LSiXYslhzjJepB3RK6VoC7lBGC4j6Y5roRDzoX13KzRAW5IKMphyinH3xz
         sxGtgIJNuop+Xa9zJjaaFhRBdX5i2icuEBSjBBqzNG/xGYnIlvwNAUeI4EM4uJVW2h4A
         YPxITo2T7DCS5XVcBGunE3/4gtpi0YtXv/I9+kAOPhIasWlwUAbf4IUiqnhxywpKEoXh
         kOJg8FUUvCCaNvAAqYctoCZgE4AsP0KCnzDZA2CsC91ymlZQ+QJYT/pOR75x+/AlhNaz
         e0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVym4XIVFRdK2cEyu1RJiBTKXCrgIiMSzCAHycgrE7vXILmgHtQnj/amA8FxiiEhuVuTMJ4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yyt5pmfsZCZIKDccArFtMc88rxIvleB6qEI7YkSu9zqwXlVSIRu
	ct+Pi0nK/mVRO/fz+XpZ4O3W0H6TFuzmUAMyr8YBsjlPbz4yBuqbekTNh5r4OYCuP1hErGVPkBK
	qC7Vfhq8JaAQk66pVgNqXPGg04BzK6g4=
X-Gm-Gg: AZuq6aLhTjzxcnB8L32xejSjo5js/Vy4ztUxFlpxnaJUCf8xr/NKC+38GQwogaXzQkn
	RZ1cTAAbzPwT3HKjrR6JKaAjHrMMo/BwzDBrT2CfmWxTTOUPDeYWkZkoues+ydoksKwiqaohaR6
	gnfiTaKIGtmp8DR1s9mkIlnXEx54UvabgW/gjg0Ul04T+aTol0ak+X6Zjx1o5pi3idboEL1pAap
	95c+rM9V2Q1NMFM/0TS6X/V8IABCelAxBCk4GIc6erwBCEKucDk43JLAcz/gfVqwOXbhejzghx/
	2F06gREReBthEqnrOEa9jPYAtyr62g==
X-Received: by 2002:ad4:5f8a:0:b0:88a:525a:8db8 with SMTP id
 6a1803df08f44-894cc8fdb0fmr14037396d6.35.1769510328192; Tue, 27 Jan 2026
 02:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-2-daiane.angolini@foundries.io> <DFZAUTK11Y5A.1PPDDZRLH02PU@bootlin.com>
In-Reply-To: <DFZAUTK11Y5A.1PPDDZRLH02PU@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:38:37 +0100
X-Gm-Features: AZwV_Qh9wDAh7ZfkBuP_MVSxUgfx_u2EDJp2g2Upfs4EyoJabjIAqLHSjjZVZFQ
Message-ID: <CANNYZj_DhwvpzBcG0Vi7E9aYqx7b30uDUxJFkmdE686f1+Zkog@mail.gmail.com>
Subject: Re: [docs][PATCH 2/5] bitbake-setup: Change the output to match the
 terminology in the docs
To: antonin.godard@bootlin.com
Cc: daiane.angolini@foundries.io, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8725

On Tue, 27 Jan 2026 at 11:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> > -    logger.plain("\nAvailable bitbake configurations:")
> > +    logger.plain("\nAvailable Variants:")

To be honest, I am no longer sure introducing 'variants' as a term is
an improvement. Someone well familiar with the terms will get it,
someone running the tool for the first time will be baffled. 'bitbake
confugurations' is more familiar and straightforward.

Alex

