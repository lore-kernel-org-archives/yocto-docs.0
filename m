Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7E4D16267
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:26 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.55256.1728913518288467389
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDVJ5j95;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e1543ab8so4073395e87.2
        for <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913516; x=1729518316; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KIzwt47wFCIMspbgsZWWAmMxp9sinVCPOmI9JbQSSxY=;
        b=aDVJ5j95wM+kjg9z3B0YPq9RO7C20Hoee+Gkpdpxo3TffjmDbqvsqRm0VPtCsSlS5f
         qHQJjgCZi+5p9gSEqQAq9Zgl3wJVQWU36KY+IdJlcTHm0SE+Q4fJGZ3z2195tTRCpnNk
         TiqcR4WtqcxpJMrHum7NndPuliwig290QOwcViSTUn1PM6i6lRUSgP9L9M8hl/a11fZh
         g4EVM7r4VpM7QL3tvM/Cfa+qk1rwuvxoDkCxPjL1/XSgHZoZGPCjAhUdxIWFW8wkk/k2
         BCZOY+MNnpE9g+vSPtL89TtB8bdXe1hQ8fWkJkV2nd0Bmq/CQpcVqzIH2uZh39pXRwYx
         BULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913516; x=1729518316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIzwt47wFCIMspbgsZWWAmMxp9sinVCPOmI9JbQSSxY=;
        b=iXHIQyM6c4BH+qcEaoDrxH75gK1Hqz1beaUqgxcB99+eDcHStfFhUJYaFDkUfXkGwa
         oiArBAxPZ29Wc76x4h5yszv2hytzWqaIv4oef73mT4KQO6gFnzcIKcOPZp4y6UzUEnEI
         dx9rNs+NEc9UypZzm4VNuBmkpsMBeJzsKRm6JDQpTL7rxgIiPBEcH3HgCfo4gfIdVoXq
         DrbF+vKpjj5UEcZfLOUMLl6/tpOqFPMuOrrf06udTR+UhKnGfhaXSCKYtTWhNwFBb4/e
         QZfTOgWFJ1uN3u5CZQDZHB00gNL/amFIVYTvVu5RsPToPXMR0OY4+wH/4kdN5E6IUdNY
         P2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvs3ZZsMvshvRWzCa7geB7N5oGDoLSyFI/zX/nyQKf9paKFiWiacYVHrOd2JgOlk7Zqj0/@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxnK802Rop/joqa1n2qomCo8E/Cl0hShRARhHPtQYS/Gvz1P3Py
	FrCEiugc2860/U9STn3rGf9xSjZ4rzzzVFHQ6WJcOikJehPqhUvintKLBmXdBQGKWi3AC4IVBPu
	AKr18cHIKjFqOO8cJnRNnfmMLrLw=
X-Google-Smtp-Source: AGHT+IEgIz1u9LWuS37+eRa4jayzJ8AUGW/EIL1Eeuk3CNSXpzVRjsX7Nz3fVDlW5Kasd9+y6dr+7psCa586tBFKqSw=
X-Received: by 2002:a05:6512:3e06:b0:536:a7a4:c3d4 with SMTP id
 2adb3069b0e04-539e571c959mr3927536e87.39.1728913516069; Mon, 14 Oct 2024
 06:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
 <6c969fd6-d6b9-41ce-9ed7-a5138414780c@cherry.de> <1d9c6e2c2cb42a4127e0eb1c1eefee9adc5de8f0.camel@linuxfoundation.org>
 <jglhemyx5xw7c6oibghwm5lwijb7jqgqirbupjmw5vxtjm56vr@7imisregnwci>
In-Reply-To: <jglhemyx5xw7c6oibghwm5lwijb7jqgqirbupjmw5vxtjm56vr@7imisregnwci>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 15:45:04 +0200
Message-ID: <CANNYZj-4zWGPuFb5GxWzfbrn9zgLpGQdBpMJhE44SOQOKm8f6w@mail.gmail.com>
Subject: Re: [docs] Docs build/workers need inkscape?
To: antonin.godard@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, quentin.schulz@cherry.de, 
	docs <docs@lists.yoctoproject.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:45:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5484

On Mon, 14 Oct 2024 at 15:28, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> I don't think it's Rust-based, I was using librsvg2-2 which provides
> rsvg-convert, and has the following dependencies on debian/ubuntu:
>
>   libc6 (>= 2.34), libcairo-gobject2 (>= 1.10.0), libcairo2 (>= 1.15.12),
>   libgcc-s1 (>= 4.2), libgdk-pixbuf-2.0-0 (>= 2.31.1), libglib2.0-0 (>= 2.50.0),
>   libpango-1.0-0 (>= 1.45.5), libpangocairo-1.0-0 (>= 1.44.0), libxml2 (>= 2.9.0)

Rust binaries don't have runtime dependencies on anything rust-based.
It's all statically linked in.

But for building them rust is very much required:
https://packages.debian.org/source/sid/librsvg

Alex

