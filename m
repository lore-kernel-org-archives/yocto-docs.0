Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0046BCE79B3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:00:26 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.34075.1695204020801581703
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwasBsrG;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2bffa8578feso60426721fa.2
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695204019; x=1695808819; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ayTb/LDVjH0UxAITmyfvo/QEasIziSNxSkUd93nEeqY=;
        b=KwasBsrGZl9T/dardsUT/f4l2ugq6KaXfYIF1AMSi2qHgeElqMbYY+OGM/G83IHPQ9
         Htmdppr3k6QPDgK2EwC/Ad/+pU/md3Nuy8D5YEsN4nLEZHxF5MZ2udtyRpyNF7xtLWyI
         KIKozeVB+yttSWKfwWl0KKzKHPgdtNnpU78CnNHScHZ25Zb0KJvq1tdwikLwSlmk/yqM
         830Dr0AfgtbUFYNmrAM8I4lECOzjxYIKye6e3HLJt0RF6g94Xrx+BZnMYkweou76Wud3
         8Yn4yom3sulb5rmxp//s/+46N7AhjIFlj7rVz87RhA7e2ObnoETbSz6SNLhOeCH9GICR
         dKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204019; x=1695808819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayTb/LDVjH0UxAITmyfvo/QEasIziSNxSkUd93nEeqY=;
        b=X1rJ3Lkwv0PQVGRy97V5GyhKpCK7WqYqnqWzS9iWmWuIcaQT3NVmiImvErpv/qH9cn
         4SQzrGC9lbcmbd7/9/KhYeXMsZqugdEyaO/uzDYFUrVtJ102siadXcG+79n4pEmnw4pP
         0dHRRonxw/XVreg+kG5nArrgueIO3F0XCB1e1C/1XoyRIkmvuocpwl0QHWs/qrnA1Bxv
         5PImhAj5ZBNmavr/s8UWDXC459zpr5An9NMvlRF7r3tMSM6CY88gbkA3KB2M6JpN/M1H
         Yda0rsDQ2EnoTKJmC0XRO3zk2QJ/LFJ2g9LNl/cT9/Dtk48dq862oCM0Yod05tn1OxEC
         ZLnA==
X-Gm-Message-State: AOJu0Yw4h7mW7jZx8NagPGW5mqDI7gxANxLv9uDKhKg7p61e35W1J4fg
	W0vYAolbRN7K90Ox4EcqD+uvFef1G1qpM0Jnokk=
X-Google-Smtp-Source: AGHT+IG3ZI+maPq7j2AvyaLpgyyiVNoQ2M0NYLXy87/K3gTjCpXZQn1DNUvoK1XU6e5Hw7il4/ClElAOAvNWN2JolnE=
X-Received: by 2002:a05:651c:ca:b0:2bf:f17d:c834 with SMTP id
 10-20020a05651c00ca00b002bff17dc834mr1715745ljr.29.1695204018696; Wed, 20 Sep
 2023 03:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230919125757.1571746-1-rhi@pengutronix.de> <20230919125757.1571746-2-rhi@pengutronix.de>
 <d3358ebb-5918-aaab-1a86-4236ce9b8854@bootlin.com> <CANNYZj9sEW_cBLppDmfkk+Hoo628G3WTiH9SBL3TY6iWcd9Nvg@mail.gmail.com>
 <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com>
In-Reply-To: <4670f2e9-971a-3ced-3b5a-b551b1ba558f@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 12:00:07 +0200
Message-ID: <CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com>
Subject: Re: [docs] [RESEND] [PATCH] contributor-guide: add docs for
 Upstream-Status patch headers
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:00:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4262

On Wed, 20 Sept 2023 at 11:47, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
> This definitely makes sense. We could propose documentation changes are
> the reason strings are not specified in the code. However, isn't this
> something we should discuss first with a wider audience, for example
> using the openembedded-core mailing list?

I can't parse the second sentence :)
We can notify about these changes outside of the docs list, but
otherwise as long as the language makes room for other options (e.g.
saying that there can be other reasons, but they must be clearly
explained) I don't think this is particularly controversial.

We should also explain that Pending is something that should not be
misused as 'I can't be bother to submit upstream', and must have some
genuine obstacle to immediate upstream submission - just need to find
polite phrasing for that :)

Alex

