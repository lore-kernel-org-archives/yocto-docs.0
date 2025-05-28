Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06A6C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 13:22:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.15523.1748438549754367576
 for <docs@lists.yoctoproject.org>;
 Wed, 28 May 2025 06:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KxzQVILy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so56790765e9.3
        for <docs@lists.yoctoproject.org>; Wed, 28 May 2025 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748438548; x=1749043348; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dW7buL2g4ZNiE1k7B9EKcvYyjJgx8/D5hI1vSixDwkw=;
        b=KxzQVILyLu1TGN2KmSkaYnEUR5EbR3KQq86eDtT+kV902kX9mUUqUiqqgFPSI4zJGg
         rLfOBUy1l7go0TAarl0ZRsfeu/6S19yS3v0GONNzOBKObcGbKJ7bF8k3V1tgBxDj8djL
         txi4qlfAdh7rJpIApk/FBPPCrJ+NIX1Naj900=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438548; x=1749043348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dW7buL2g4ZNiE1k7B9EKcvYyjJgx8/D5hI1vSixDwkw=;
        b=nuOEbVEhNdcD12IaEmiOHTrGfIT05Mb4Q3DomuptKtfLyHAXgc2bEdp3iUMhuOuRyN
         2q4lP1Ndbgyay0CJ0+T0pE7hPL3YbxQt0U2JHHYJ3gso/NQIgQfDa8qwzrDdZbOYivyh
         XuwpLgAbH/40MgTYNP0vfek6odTDtIveemOqx4HhYaktn0q+qAqu8ePevwJKVj9wf0EI
         5DADO3PLnTMQYyKMNFjBJaS7dmk1xws6Qq9rExMP0mlpiMtM5p0T02pKytD1U7PepSXs
         ofNIrQLtVzv4njowe4sRzYVjL9wIVpd4K1h7/r7JCfNy7q9wMMghdaxEc3gYDmhR2rdI
         IYmg==
X-Gm-Message-State: AOJu0YxtA3f3Ubh4YQL33VwB2PEOwirDw6nF56UKrzBTuFGGQB47Ujro
	2BwqlX5dHvPI2iOzkyvPccLr6lEKZZXnZd5IjBQr0ipWjR1YH7qQo8gmfAYiTZ+epTg=
X-Gm-Gg: ASbGncuXLm/DdHjPr2Mrv1WQJxj+trF8QCQ4UAxFP9MjyUr4tH1vJQFVAA0//41RM2G
	ejRRk+LgzzmX4OJjooZp8RKCbNyvRqZNzw4/HUrbvDoyC7FYJdcpbeYUaFwUD6xvVoHM26uyPE1
	4OZJyk4maTyKGTbHNUJu3yTWbPJ/hYb3uVexYJd/zGby/bFmptO8v29nqPbaMjk7rXNX8zjcsSf
	qVGop9+M0qNx3V2WwUMlrg0OCagF633il8c7YQubVkqqQVRqpZsHDnpWrDWTMw1v4+0leY12WPj
	oNJzdtE7EIz4GQKIf1G2loAQEy51Hb/DpPqZ9jpGkdpztcQNP157S01ENqy1Y4dBHn1iAI8DIfj
	Eq3zIAb1WYx4qQzuD9FMLClQmns3riCfI+aAPhrlm
X-Google-Smtp-Source: AGHT+IFVlpLbuQOO6awmDbjnEcMW5kmtWdG5AV1jE5ibsxm+vQkWcEay1RYLeYPJIQFFMLMmYdp+Jw==
X-Received: by 2002:a05:600c:4fc5:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-44c9465bfe3mr187880025e9.15.1748438548147;
        Wed, 28 May 2025 06:22:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ebb4:3a70:7323:f416? ([2001:8b0:aba:5f3c:ebb4:3a70:7323:f416])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae786sm21527505e9.23.2025.05.28.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:22:27 -0700 (PDT)
Message-ID: <3cdc7c12efbedfda3a705d34d87ce78462010268.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3 3/3] tests/fetch: Add test case to check
 shallow cloning using `PREMIRRORS`
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stefan-koch@siemens.com, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, liezhi.yang@windriver.com, 
	niqingliang2003@gmail.com, alex.kanavin@gmail.com,
 quentin.schulz@cherry.de, 	jan.kiszka@siemens.com
Date: Wed, 28 May 2025 14:22:26 +0100
In-Reply-To: <20250527095903.2300556-3-stefan-koch@siemens.com>
References: <20250527095903.2300556-1-stefan-koch@siemens.com>
	 <20250527095903.2300556-3-stefan-koch@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 May 2025 13:22:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6944

On Tue, 2025-05-27 at 11:59 +0200, Koch, Stefan via lists.yoctoproject.org =
wrote:
> Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
> ---
> =C2=A0lib/bb/tests/fetch.py | 27 +++++++++++++++++++++++++++
> =C2=A01 file changed, 27 insertions(+)

I've merged this series, I just wanted to say thanks for getting to the
bottom of it, getting to a good fix and ensuring the issue doesn't come
back (hopefully!).

Cheers,

Richard

