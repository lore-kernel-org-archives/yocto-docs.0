Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E679BCD5BC9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 14:24:16 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10173.1695133450737634941
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 07:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3IreXsH;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c008042211so38248651fa.2
        for <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695133449; x=1695738249; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mTPU1EI0R9bvpayLfuPROflgw4votyf7W8TdcXLlVYA=;
        b=Q3IreXsHdGOx0i8bwjZbLrLdOlgg2qvvsz7toBGTYNAwi9zjtJ/5yeIccYKI/BTVfj
         46LHiFKyqmvkkISSks0ubmu7iXGUngApQtxdLTU2/9LOqj5SZsLEi3UV5jSdUg+/TRLI
         jbywyynDOQ+FCizJSTABkr/JVUxi4K/qURRiALI9qKIu7Om87JnultfOB+1OUWjHkRhl
         nLCOhMPlgu73hGLKtxNCSOC8Yl+fwRsTKeDlgW/suJMuSIDf2R1cFZ3SGzdbDi/umMrx
         QkTTFtMZk/eqH3etU25A94ouOM4dZRkDnCwWwVk5DsHXfnSmXWLQPzVsd7ClrnPsh4Ik
         j0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695133449; x=1695738249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTPU1EI0R9bvpayLfuPROflgw4votyf7W8TdcXLlVYA=;
        b=YMb8iTMwk/ikdwV9jn2LqftYPm5pXYZd3BO3Dd2/pl2VhtQ0hfK/xRopXSBCkvoAq3
         qvsjqkXysMkyEmj6a5jClQWf1VeBHvFBWg9aWIu9KoFZk5zThGiEQ7Fy9wIILBS/mYjJ
         2QQSmDR3ocqFXkJH8WHGauThYgzAnXO0ROI3lKlZbmq1iWWPbJ8YfLMjh3jKuGS8MHTT
         8PBoqQ8VGmKROJQwmPZxCmW3gGgisFbiLaOq+hEc3bjJpCN320NBszYK7NdRl/1qqgOw
         JAm88Ui2xEKyJ1F9UgqjRkuG+TXvjnoT+2bX5wou+AuTjzEZ4Vy3dn+UOHKKMbWPKC5d
         KCKA==
X-Gm-Message-State: AOJu0YxM7ZxDHAMfZIVEqG7zmqTMHD1nnJPi3q91mWwrwBiwM3A8J/O7
	6tT62PYOs4dPWT7ini+Mw9etEgmOdZmn4DKW/mQ=
X-Google-Smtp-Source: AGHT+IExHeLWNY0dkQeLjXWJImKCkbUUSFvZMIxxi6XTrkeXoxOEUZ7Yx06CoxImK5vyhpaagd3zpNgLK2ebwnfDk+U=
X-Received: by 2002:a2e:9297:0:b0:2bc:fc2e:7671 with SMTP id
 d23-20020a2e9297000000b002bcfc2e7671mr9514089ljh.13.1695133448651; Tue, 19
 Sep 2023 07:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230919125757.1571746-1-rhi@pengutronix.de> <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
In-Reply-To: <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 16:23:57 +0200
Message-ID: <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
To: michael.opdenacker@bootlin.com
Cc: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 14:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4235

On Tue, 19 Sept 2023 at 16:07, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> I'd also like to more details about the "Inappropriate" reasons. For
> example, I don't have a clue what "native" would mean. Why would be
> patch be rejected upstream because it only applies to the x86 host platform?

For what it's worth I think the entire list of possible Inappropriate
reasons in the original wiki and by extension in this patch is
horrible, and should be completely deleted. The two valid reasons I
can think of:
- the issue is not yocto-specific, and should be fixed upstream but
the patch in its current form is not suitable for merging upstream,
and the author lacks sufficient expertise to developer a proper patch.
Instead the issue is handled via a bug report (include link). This
would be [upstream ticket <link>] with extended explanation in commit
message.
- the issue is specific to how yocto performs builds or sets things up
at runtime, and can be resolved only with a patch that is not however
relevant or appropriate for general upstream submission. This would be
[oe specific] also with extended explanation in commit messages.

Things like 'I'm not the author of the patch' or 'licensing fix' or
whatnot aren't valid reasons to mark Inappropriate. We should also say
clearly that adding Inappropriate patches is strongly discouraged, as
they add to maintenance burden, and can't be allowed to grow
indefinitely in their numbers.

Hope this helps with a v2.

Alex

