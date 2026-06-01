Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525DCCD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 08:36:11 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23923.1780302966347293675
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 01:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pIBD5M85;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5176096116fso480101cf.0
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 01:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302965; cv=none;
        d=google.com; s=arc-20240605;
        b=EPL0T81sy3Fb8tuXQvPzpwM/XHReqqVsmWOZ4JgJdheeAnSaQpwJgEFc8jXM8JV0G9
         I/DDK60a4Dz27nrC6dk2VYxiF1EF49CWcITLi+rK5WuVUTqdzcfWmQVu/QtEpdEqJF1h
         GMJWwTaaW07kJZUJhRZRQavyDblzfcvcDGdRcC56EQICqmPkhn9wMXBXMLT9qb1kqy5l
         iV1IGK1l/j+P6VM45Fto+fQPesXvei1Xur0ivAaK2637NYVpRCgrnjPRtoSfQ29YPthQ
         ayrTFURLDYfplbiF2CQ9Be7CA1W5lDryIA6lv2u6h6IpaQs8tKz3JVUGxtHXhs9035t0
         oTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nya4qOLBPWuY/eAHVM/3IK0Zr9EPupFTo/Sd/6Svt6U=;
        fh=iVcuLodzTPD+xroTZ1mqjYJshOTYIf7w1HiRxOMsWwk=;
        b=bJ1GYCSr87q7a2zpf7qRwYQ+0a8tnl3fBrjtr0jaTHwwnW6KPyMvxBZjIfxjwhxkPC
         wgAK8XBgAZRpdED9baMcCNlBx0ele5nxtKXV35FsvvhTCgS1XJsPByQUpuxtkAfyr2nP
         Ehv6mT6YkOGpelz8LnMiG4gF3asYPIuzJ7fgxp0MJaa/NynNc2EbhPVHZiyzLe8TGjdK
         ji0gtY/4C0WIlzyzw2Ks+S3YFhakshE2zJ7JCXoU8bgrDmA9WDMOvDM/MW5p2MVx1ofA
         UbznNLudx2JRq0zgVvA1rlKJYIZLi7yP8I9bHDV5mmniGFuRiXE2PqSLqsHUZyr0jMf0
         VxMA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302965; x=1780907765; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nya4qOLBPWuY/eAHVM/3IK0Zr9EPupFTo/Sd/6Svt6U=;
        b=pIBD5M85ypLQqkt1Uh7sbnQpjdSOCTWkcwcp7rwtdqG26g79XfZX0YdJl9AR7Arh+e
         6bGeXvZWvPbEvi3yNQG4pnNovJRjDiCdCsmZ66loomahE6BBtVD67v5uZlX0xfMFuE2q
         BZ21BGqY234wIPeQSMkdUWiHTpVTsXQzWGpNEJzO4A+41SPIkbOVRuKyHf4n5LDL6VMw
         A1RimkZ8VeYqnjTO2vfHuatxlWlPm8U/fbvSI0gY4wEvSS3cXIZKbUxhSSBoRs6RJbU0
         FXgDUzcnKzoEPi1mN0FDrZvU4MXRVhlNm09PzF1MpP5Uq4gfjDjcF4Nl3zDKv3kzr+KU
         zNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302965; x=1780907765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nya4qOLBPWuY/eAHVM/3IK0Zr9EPupFTo/Sd/6Svt6U=;
        b=H8R7KNpa0kdDUptI6HEKRo0Nh7XM1O1S9O2uEsnugr2IVeZow60jUqtWvxgkQSZ7ZQ
         I9j8PD+wRl0WreeS/e/rR2Yf6wlT/NNEDUh8mOtEt4kMqQN48HzCeLj5dck7dhvt4/DV
         hXMtmfUAE3NmVcmwfmlL3Z+uLeQeY6z5LFxM0+tXS9WMTGmegmy6qls9XzRv08R6AG5S
         ZSLifU1fLdPX6aLVYfz1uSA8D1gGxD+axGGykFPBJ9vKc26KRGNgfZNlqlX0+broCQqB
         z/FUGMOq76FwnoJhPR+bFXYcYgZLkC88HpCvJmuwOMcmSJ8T3wSPwsVygGbT0Yyh3kHk
         BcEw==
X-Forwarded-Encrypted: i=1; AFNElJ9654cIb8dWv93iHA6b+fGtT1NEq7hV9MKC70deiz9d1YgEoV/jalYlXlZPvCSmXEwFwfmA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzeBFMq+40thFGZnkO0lefAvz76lr4i+E50RCho99Au6utTw/rO
	B/EtDRMfJ9NzKuouzcD3O2tnXBuyR0Td8HrUPyPW7I21TgGY/96HkQ4Iw3jSZ5S2J9EnuQMYVMl
	Tenb4316h5ZVZeq9p5Iyvby8TuDfjYVo=
X-Gm-Gg: Acq92OEe5a1ByznXamd4SWmd2Ln9kDqd5iCHFhc0xjeP+RQb9Lgtm9rM1qIe9UF6+xD
	SET/GjMGnaWJrnfGeQ0lTDJl+Z8stBGjkUxodBvghWgdOHzZG1G12beirZSoytOU9bvY8OO/rvr
	fmKW/BUExl652XK14As6xtp9H88ZaNSNCKRMtbHedTt8O5ZYWejG2c4phkJiqW38dGzeh80CBTW
	JWJX/MGw+KRw3EzvZ/Zrt5b2mo+WmpTDLSGJI17jrZQRLIFMxQOUHF0a6qbXbHSKEsgdxK6bO4N
	tQEdRmugxQwf+FBbuPkDnaiPDjhuSlyVZclCBVbDSSiJv0WLgivn
X-Received: by 2002:ad4:4ee3:0:b0:8cc:e14:9594 with SMTP id
 6a1803df08f44-8ccefdc5725mr166037176d6.33.1780302964878; Mon, 01 Jun 2026
 01:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-notes-v1-0-a251ef1c5af4@toradex.com>
 <20260529-bb-setup-notes-v1-2-a251ef1c5af4@toradex.com> <DIXISSZ5047B.PSMH6SMC4CF8@bootlin.com>
In-Reply-To: <DIXISSZ5047B.PSMH6SMC4CF8@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 10:35:53 +0200
X-Gm-Features: AVHnY4J5ujaMfZliNCBdP9-RwoBGG40N0BQf_BtIaag8ECKXpfHslV_cQLy9400
Message-ID: <CANNYZj-CovuQxxi6XUo62LxKs-sMjEUzFoLC3UsfWmuGFJTqBw@mail.gmail.com>
Subject: Re: [docs] [bitbake-devel] [PATCH 2/2] bitbake-setup: write notes for
 generated build configs
To: antonin.godard@bootlin.com
Cc: ernestvanhoecke@gmail.com, bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 08:36:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9548

On Mon, 1 Jun 2026 at 09:05, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> Suggestion: call the field "conf-notes" so it matches the resulting filename?

I disagree. It's meant for general-purpose freeform notes about the
configuration; that they also get written into conf-notes.txt is an
implementation detail. It's also more consistent, as there's already
"description" which gets written into conf-summary.txt.

Alex

