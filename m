Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAECDCCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 13:09:32 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17238.1762261767606292085
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 05:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Evg9yY10;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8801f4e308dso50106616d6.0
        for <docs@lists.yoctoproject.org>; Tue, 04 Nov 2025 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762261766; x=1762866566; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nEHRy8XeKQR62j9KgWjgUQtGsolNa/CVbnCx4/9vzWg=;
        b=Evg9yY10U9f5gfQGZYStldyU/Yy0QifY+Q3cdMlPG9++WquskyQv9SbxhNthWSx41H
         PTcg6vn+bOfjy9X/mOMic7V4AWQArvaa5ly1zk+Fz6V/QXLsir88FA3WQLLQmAT5o+dq
         fhgJlkIyaJ5VsFnTJ1IfqBm8H5HhwcfX+9FV1QB2wOZXL18KHZ56Oku0janQvSqxjuwc
         QVlX93V7oeu4CDvVf3RHeWgIeAop605ED6VqeZUMDa3b7oTwfbZ42QHYyNTuF0Dlwj+y
         +f1nwVjlLOLH5KZOuNhvMulDF138n3e4Ojtu4AXzg3+jQ6fPnr2UwSN98O+Y6bxROiaf
         Ei8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261766; x=1762866566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEHRy8XeKQR62j9KgWjgUQtGsolNa/CVbnCx4/9vzWg=;
        b=JOdme8vQ3wwOu7EMKhiHT/HYiOk0m6gSf2o6+zu+VF492rhUD/vZ9MdRpdNzqL1XCe
         QeHRC4qEz60L6XlWmsdgmWKsUI4ej9r/1zO7XQ+S9mEzcXt3gjKHICdpZ6M3+x73Er12
         7jXgl0Xf3uRzZyZ9Fru3Slich3tzu8OuHI0C34q8yIa0c9aD8C52lRp9jiZbXE56/EYt
         iTx8/I81+jXYo9R67Fd7om6BdrhHGFLX4MSenOhk+aVLX0Nowv0EYYc1p18up6iKLceN
         jTL0QbaBWM4/Tq3zIE7UDqWSp8k4SoyaUh/mTx7ahjIofR4WVZ9AkQlH48uqxPaJOUXt
         2BIA==
X-Gm-Message-State: AOJu0YwVPkgsEbBfG+BxZZe3pfhQa3Etg0mTXvW3pVNew9Mw4zIElHSH
	ai6JL5OkJMzWSQWUyrd0YDG+7+Hp9zJoz1BwGKZk2hhpPkpk7wGtzj/qwyET2y/uB+4NO+yCvJf
	Uqy0wl5kctZvnCzf6zGSYv5XKbuPQEUQ=
X-Gm-Gg: ASbGncve4Oj/WKiCcl20sueOcQdB+M8CVE07se+wFLPYe8Rge9nTtdhJFNvpJa+MbdI
	UjuUtRoPCB7zdD2c7enAq2SEegMJhKbw2scUwixd43z51kNl/Lt3qLVnNWVezldJgi4TmeIG3FF
	cbM2mj77GnvZlMhIQVxXfjZFowuT1yipfAoR4jFTMRROlM0C8waixTqjgX5Mo/EdsxMz48cTxHX
	zhWLbC0BfbksPQm3ZsryCVn5y8htHddA9RqAAWNZmV+sA92ObMCuOx3e+6HKXEECjP/XecRMu2V
	JAnAvKiOahlIxkAYKqM=
X-Google-Smtp-Source: AGHT+IGcsyptCkNNgElDMHUqp59G9XasYlNh+kD6ps4orOkoq3zmQYarxU6Rv4iwNbpPAGrre9J9rapc+IDbwbRYxDs=
X-Received: by 2002:a05:6214:2426:b0:880:52d3:9bff with SMTP id
 6a1803df08f44-88052d39e83mr89696586d6.52.1762261766499; Tue, 04 Nov 2025
 05:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com> <20251103-bitbake-setup-v2-4-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-4-89fbb14cfbbd@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Nov 2025 14:09:14 +0100
X-Gm-Features: AWmQ_bnTyhL5FZ68E-bmUHrs4nDI2c45Kq15pA86ebglmCJSR2z5BOIG3wUlZEM
Message-ID: <CANNYZj9T_QkU4YJJncEm6DXgaK6nh0ry-We=8fMTcyzQ_FVq1w@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 4/6] brief-yoctoprojectqs: switch to bitbake-setup
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Nov 2025 13:09:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7985

On Mon, 3 Nov 2025 at 17:33, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +    The current configuration does not allow the ``root`` user to login. As this
> +    can be useful for development, you can enable ``root`` login by opening the
> +    :ref:`local.conf <structure-build-conf-local.conf>` file in ``conf/`` and
> +    adding the following statement::
> +
> +       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"

The fragment that does this has now landed:
https://git.openembedded.org/openembedded-core/commit/?id=e135458415dea5bbc4651e05dafe0b6903b65751
so this can be rewritten in fragment terms. Also you can add a note
that rephrases the cautions and appropriate use from the fragment
description/commit.

> +#.  **Find a Layer:** Many hardware layers, or :ref:`BSP layers
> +    <overview-manual/concepts:bsp layer>` are available. The
> +    :oe_layerindex:`layer index <>` can be used to find such layers. This example
> +    adds the :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>` BSP
> +    layer.

See a separate email about using raspberry pi instead:
https://lists.yoctoproject.org/g/docs/message/7984

Also this was not addressed?
https://lists.yoctoproject.org/g/docs/message/7955
You can add to that that the missing websockets dependency can be
fulfilled by installing buildtools, with 'bitbake-setup
install-buildtools'.

Other than these three issues, the patchset is good!

Alex

